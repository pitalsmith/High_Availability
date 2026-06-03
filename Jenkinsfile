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
                // This builds the image locally so Compose can use it
                sh 'docker build -t high-availability-app .'
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