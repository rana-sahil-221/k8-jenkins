pipeline {
  environment {
    imagename = "kubesahil221/k8-jenkins"
    dockerImage = ""
    registryCredential = 'dockerhub_id'
    KUBECONFIG = credentials('kube_vagrant_id')
  }
  agent {
    labels: 'vagrant-vm'
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
          dockerImage = docker.build imagename
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
        sh 'sudo kubectl --kubeconfig=${KUBECONFIG} apply -f /opt/jenkins/workspace/jenkins-k8-agent/deployment.yaml'
        sh 'sudo kubectl --kubeconfig=${KUBECONFIG} apply -f /opt/jenkins/workspace/jenkins-k8-agent/service.yaml'
    }
  }
}
}  
