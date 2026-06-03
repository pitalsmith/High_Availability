stage('Build Image') {
    steps {
        sh '''
        cd $WORKSPACE
        pwd
        ls -la

        docker build -t high-availability-app .

        docker compose down || true
        docker compose up -d --build
        '''
    }
}




// pipeline {
//     agent any
    
//     stages {
//         stage('Checkout') {
//             steps {
//                 checkout scm
//             }
//         }
        
//         stage('Build Image') {
//             steps {
//                 // Build the image so Docker Compose can use it
//                 sh 'docker build -t high-availability-app .'
//             }
//         }
        
//         stage('Deploy') {
//             steps {
//                 // We use 'docker' (the binary) and pass 'compose' as an argument
//                 // This forces it to use the Docker Compose plugin, not a standalone binary.
//                 sh 'docker compose down || true'
//                 sh 'docker compose up -d --build'
//             }
//         }
//     }
    
//     post {
//         always {
//             echo 'Pipeline finished. Cleaning up...'
//         }
//         failure {
//             echo 'Pipeline failed. Check the logs above.'
//         }
//     }
// }