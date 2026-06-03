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
                // We use 'docker compose' (v2). 
                // We use || true on the down command so it doesn't fail 
                // if the project isn't already running.
                sh 'docker compose down || true'
                sh 'docker compose up -d'
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