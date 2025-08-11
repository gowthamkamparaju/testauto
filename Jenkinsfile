pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('jenkins-aws')
        SSH_KEY = credentials('aws-ssh-key') // SSH key from Jenkins
        DOCKER_IMAGE = "gowthamkamparaju/demousr"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'feature', url: 'https://github.com/gowthamkamparaju/testauto.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE:latest .'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                sh 'echo "$DOCKER_HUB_CREDENTIALS_PSW" | docker login -u "$DOCKER_HUB_CREDENTIALS_USR" --password-stdin'
                sh 'docker push $DOCKER_IMAGE:latest'
            }
        }

        stage('Deploy with Ansible') {
            steps {
                sh """
                    ANSIBLE_HOST_KEY_CHECKING=False \
                    ansible-playbook -i ansible/inventory.ini ansible/deploy.yml \
                    --private-key "$SSH_KEY"
                """
            }
        }
    }
}
