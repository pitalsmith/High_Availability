pipeline {
    agent any
    stages {
        stage('Hello') {
            steps {
                echo 'Hello, Jenkins is working with Kubernetes!'
                sh 'kubectl get nodes'
            }
        }
    }
}