pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = 'AKIA3AP7Y7HRFVVDCIWN'
        AWS_SECRET_ACCESS_KEY = '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'
        ARTIFACT_NAME = 'calculator.jar'
        AWS_S3_BUCKET = 'valentin-calculator-api-jars'
       
    }

    stages {
        stage('Build') {
            steps {
                git 'https://github.com/Naveen1997-hub/Calculator-.git'
                sh './mvnw clean compile'
                // bat '.\\mvnw clean compile'
            }
        }
        stage('Test') {
            steps {
                sh './mvnw test'
                // bat '.\\mvnw test'
            }

            post {
                always {
                    junit '**/target/surefire-reports/TEST-*.xml'
                }
            }
        }
        stage('Publish') {
            steps {
                sh './mvnw package'
                // bat '.\\mvnw package'
            }
            post {
                success {
                    archiveArtifacts 'target/*.jar'
                    sh 'aws --version'
                    // bat 'aws --version'
                    sh 'aws iam get-user'
                    // bat 'aws iam get-user'
                    sh 'aws configure set region us-east-2'
                    sh 'aws s3 cp ./target/calculator-0.0.1-SNAPSHOT.jar s3://$AWS_S3_BUCKET/$ARTIFACT_NAME'
                    
                }
            }
        }
    }
}
