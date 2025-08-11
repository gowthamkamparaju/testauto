pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('jenkins-aws')
        DOCKER_IMAGE = "gowthamkamparaju/demousr"
        AWS_SSH_KEY = credentials('aws-ssh-key') // must be SSH private key type
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'feature', url: 'https://github.com/gowthamkamparaju/testauto.git'
                script {
                    // Get the short commit hash
                    COMMIT_HASH = sh(returnStdout: true, script: 'git rev-parse --short HEAD').trim()
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE:$COMMIT_HASH .'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                sh 'echo "$DOCKER_HUB_CREDENTIALS_PSW" | docker login -u "$DOCKER_HUB_CREDENTIALS_USR" --password-stdin'
                sh 'docker push $DOCKER_IMAGE:$COMMIT_HASH'
            }
        }

        stage('Deploy with Ansible') {
            steps {
                sh """
                ANSIBLE_HOST_KEY_CHECKING=False \
                ansible-playbook -i ansible/inventory.ini ansible/deploy.yml \
                --private-key $AWS_SSH_KEY \
                --extra-vars "docker_image_tag=$COMMIT_HASH"
                """
            }
        }
    }
}
