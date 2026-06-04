pipeline {
    agent any
    tools {
        // This 'node22' must match the EXACT Name you typed in the Tools configuration
        nodejs 'node22' 
    }
    stages {
        stage('Build & Dockerize') {
            steps {
                sh 'node -v' // Debug: This will print the version in the logs
                sh 'npm install'
                sh 'npm run build'
                
                script {
                    docker.withRegistry('', 'docker-hub-creds') {
                        def img = docker.build("your-username/high-availability-app:${env.BUILD_ID}")
                        img.push()
                        img.push("latest")
                    }
                }
            }
        }
        // ... rest of your stages
    }
}