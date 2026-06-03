pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Build Image') {
            steps {
                // Build the image so Docker Compose can use it
                sh 'docker build -t high-availability-app .'
            }
        }
        
        stage('Deploy') {
            steps {
              // Use the legacy hyphenated command
                sh 'docker-compose down || true'
                sh 'docker-compose up -d --build'
            }
        }
    }
    
    post {
        always {
            echo 'Pipeline finished. Cleaning up...'
        }
        failure {
            echo 'Pipeline failed. Check the logs above.'
        }
    }
}