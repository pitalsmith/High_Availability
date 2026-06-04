pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'npm install'
                sh 'npm run build'
            }
        }
        stage('Docker Build & Push') {
            steps {
                script {
                    docker.withRegistry('', 'docker-hub-credentials-id') {
                        def customImage = docker.build("your-username/high-availability-app:${env.BUILD_ID}")
                        customImage.push()
                        customImage.push("latest")
                    }
                }
            }
        }
        stage('Deploy to K8s') {
            steps {
                // This updates your deployment to use the new image
                sh "kubectl set image deployment/my-app-deployment my-app=your-username/high-availability-app:${env.BUILD_ID}"
            }
        }
    }
}