pipeline {
  agent any

  environment {
    AWS_ACCESS_KEY_ID = 'AKIA4ALQMRQXOR2JHVVO'
    AWS_SECRET_ACCESS_KEY = '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'
    AWS_DEFAULT_REGION = 'us-east-1'
  }

  stages {
    stage('git') {
      steps {
        git 'https://github.com/vrk2299/terr'
      }
    }

    stage('Terraform Init') {
      steps {
        sh 'terraform init'
      }
    }

    stage('Terraform Plan') {
      steps {
        sh 'terraform plan -out=tfplan'
      }
    }

    stage('Terraform Apply') {
      steps {
        sh 'terraform apply tfplan'
      }
    }
  }
}
