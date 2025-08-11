pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('jenkins-aws') // Jenkins Docker Hub credentials ID
        DOCKER_IMAGE = "gowthamkamparaju/demousr"
        IMAGE_TAG = "1.0" // Change this if you want a new version
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'feature', url: 'https://github.com/gowthamkamparaju/testauto.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t $DOCKER_IMAGE:$IMAGE_TAG .'
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    sh 'echo "$DOCKER_HUB_CREDENTIALS_PSW" | docker login -u "$DOCKER_HUB_CREDENTIALS_USR" --password-stdin'
                    sh 'docker push $DOCKER_IMAGE:$IMAGE_TAG'
                }
            }
        }

        stage('Deploy with Ansible') {
            steps {
                sshagent(['aws-ssh-key']) {
                    sh '''
                        cd ansible
                        ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook \
                        -i inventory.ini deploy.yml \
                        --extra-vars "docker_image=$DOCKER_IMAGE image_tag=$IMAGE_TAG"
                    '''
                }
            }
        }
    }
}
