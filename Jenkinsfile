pipeline{
  agent any
  tools{
    maven "maven3.8.2"
   }
  stages{
    stage('Checkout'){
     steps{
        git branch: 'main', credentialsId: '9e275ed6-8010-46b1-a77e-e8d1e28bb0b0', url: 'https://github.com/stpl-pro/maven-project.git'
      }
     }
    stage('Build'){
      steps{
        sh "mvn clean package" 
          }
        }
    stage('UploadtoNexus'){
      steps{
        sh "mvn clean deploy"
          }
        }
  }
}

