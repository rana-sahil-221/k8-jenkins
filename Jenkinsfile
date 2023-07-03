pipeline {
  environment {
    imagename = "kubesahil221/k8-jenkins"
    dockerImage = ""
    registryCredential = 'dockerhub_id'
  }
  agent any
  stages {
    stage('Cloning Repo') {
      steps {
        git 'https://github.com/rana-sahil-221/k8-jenkins.git'
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
        script {
          kubernetesDeploy(configs: "deployment.yaml", "service.yaml")
        }
      }
    }
  }
}