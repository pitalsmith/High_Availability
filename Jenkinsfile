pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
    stage('Deploy') {
        steps {
            // Use the hyphenated version which is often found in base Jenkins images
            sh 'docker-compose down'
            sh 'docker-compose up -d --build'
        }
}
        stage('Deploy') {
            steps {
                // This runs in the same workspace where the files were checked out
                sh 'docker compose down'
                sh 'docker compose up -d'
            }
        }
    }
}