pipeline {
    agent {
        kubernetes {
            yaml '''
apiVersion: v1
kind: Pod
spec:
  containers:
  - name: jnlp
    image: jenkins/inbound-agent:3355.v388858a_47b_33-20
  - name: kubectl
    image: bitnami/kubectl:latest
    command: ['cat']
    tty: true
'''
        }
    }
    stages {
        stage('Hello') {
            steps {
                container('kubectl') {
                    sh 'kubectl get nodes'
                }
            }
        }
    }
}