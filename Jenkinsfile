pipeline {
    agent any
    stages {
        stage('Build Image') {
            steps {
                // Build the image using the Dockerfile
                sh 'docker build -t high-availability-app .'
            }
        }
        stage('Deploy') {
            steps {
                // Stop and remove old container if it exists
                sh 'docker stop high-availability-container || true'
                sh 'docker rm high-availability-container || true'
                
                // Run the new container
                sh 'docker run -d -p 8081:80 --name high-availability-container high-availability-app'
            }
        }
    }
}