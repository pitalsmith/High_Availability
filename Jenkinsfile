pipeline {
    agent any
    tools {
        nodejs 'node22' 
    }
    stages {
        stage('Build & Containerize') {
            steps {
                // 1. Clean and Build
                sh 'rm -rf node_modules package-lock.json'
                sh 'npm install'
                sh 'npm run build'
                
                // 2. Build the image locally
                // We use the BUILD_ID so you can track specific versions
                sh "docker build -t high-availability-app:${env.BUILD_ID} ."
                
                // 3. Tag it as 'latest' for easy deployment
                sh "docker tag high-availability-app:${env.BUILD_ID} high-availability-app:latest"
                
                echo "Successfully built image: high-availability-app:${env.BUILD_ID}"
            }
        }
    }
}