pipeline {
  environment {
    imagename = "kubesahil221/k8-jenkins"
    dockerImage = ""
    registryCredential = 'dockerhub_id'
    KUBECONFIG = credentials('kube_vagrant_id')
  }
  agent {
        label 'vagrant-vm'
    }
  stages {
    stage('Cloning Repo') {
      steps {
        git branch:'main',url: 'https://github.com/rana-sahil-221/k8-jenkins.git'
      }
    }
    stage('Building Image') {
      steps{
        script {
          dockerImage = sudo docker.build imagename
        }
      }
    }
    stage('Pushing Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push("latest")
          }
        }
      }
    }
    stage('Deploying the Application to the K8 Cluster') {
      steps {
        sh 'sudo kubectl --kubeconfig=${KUBECONFIG} apply -f /var/lib/jenkins/workspace/k8-jenkins/deployment.yaml'
        sh 'sudo kubectl --kubeconfig=${KUBECONFIG} apply -f /var/lib/jenkins/workspace/k8-jenkins/service.yaml'
    }
  }
}
}  
