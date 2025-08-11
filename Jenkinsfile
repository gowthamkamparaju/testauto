pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('jenkins-aws') // Docker Hub creds in Jenkins
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
                script {
                    sh 'docker build -t $DOCKER_IMAGE:latest .'
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

        stage('Deploy with Ansible') {
            steps {
                withCredentials([sshUserPrivateKey(credentialsId: 'aws-ssh-key', 
                                                   keyFileVariable: 'SSH_KEY')]) {
                    dir('ansible') { // Move into ansible folder where deploy.yml & inventory.ini exist
                        sh '''
                            ANSIBLE_HOST_KEY_CHECKING=False \
                            ansible-playbook -i inventory.ini deploy.yml --private-key $SSH_KEY
                        '''
                    }
                }
            }
        }
    }
}
