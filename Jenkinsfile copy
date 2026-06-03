pipeline {
    agent any
    stages {
        stage('Build Image') {
            steps {
                // Build the image using the Dockerfile
                sh 'docker build -t high-availability-app .'
            }
        }

//NEW DEPLOYMENT STRATEGY: We will use Docker Compose to manage our multi-container application, which includes the main application and a load balancer. This allows us to easily scale and manage our services while ensuring high availability.
        stage('Deploy') {
    steps {
        sh 'docker compose down' // Stop old containers
        sh 'docker compose up -d --build' // Start the cluster
    }
}

// OLD DEPLYMENT STRATEGY: 
        // stage('Deploy') {
        //     steps {
        //         // Stop and remove old container if it exists
        //         sh 'docker stop high-availability-container || true'
        //         sh 'docker rm high-availability-container || true'
                
        //         // Run the new container
        //         sh 'docker run -d -p 8081:80 --name high-availability-container high-availability-app'
        //     }
        // }

    }
}