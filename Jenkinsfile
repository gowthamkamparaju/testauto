pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('jenkins-aws')
        DOCKER_IMAGE = "gowthamkamparaju/demousr"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/gowthamkamparaju/testauto.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t $DOCKER_IMAGE:latest .'
                }
            }
        }

        stage('Test Application') {
            steps {
                script {
                    // If you have tests, run them here and check
                    sh 'echo "Running tests..."'
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    sh 'echo "$DOCKER_HUB_CREDENTIALS_PSW" | docker login -u "$DOCKER_HUB_CREDENTIALS_USR" --password-stdin'
                    sh 'docker push $DOCKER_IMAGE:latest'
                }
            }
        }

        stage('Deploy to Server') {
            steps {
                script {
                    // Example: SSH to server and pull image
                    sh 'echo "Deploy step placeholder"'
                }
            }
        }
    }
}
