pipeline {
  agent any

  environment {
    AWS_ACCESS_KEY_ID = 'AKIAYRAZFAL7NBHPRHYP'
    AWS_SECRET_ACCESS_KEY = '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'
    AWS_DEFAULT_REGION = 'us-east-1'
  }

  stages {
    stage('git') {
      steps {
        git 'https://github.com/himanshuops/pipeline123.git'
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
