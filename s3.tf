pipeline {
    agent any

    stages {
        stage('Create S3 Bucket') {
            steps {
                withAWS(region: 'us-east-1-', credentials: 'aws-credentials') {
                    sh ' aws s3api create-bucket --bucket my-bucket-name --region us-east-1 
                }
            }
        }
    }
}
