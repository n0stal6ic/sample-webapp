pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/n0stal6ic/sample-webapp.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t sampleapp .'
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    sh 'docker run -d -p 8080:8080 --name sampleapp_container sampleapp'
                }
            }
        }

        stage('Verify App Running') {
            steps {
                script {
                    sh 'curl -s http://localhost:8080'
                }
            }
        }
    }

    post {
        always {
            echo 'Cleaning up...'
            sh 'docker stop sampleapp_container || true'
            sh 'docker rm sampleapp_container || true'
        }
    }
}
