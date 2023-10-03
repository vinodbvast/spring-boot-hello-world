pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                https://github.com/vinodbvast/spring-boot-hello-world.git
            }
        }
        
        stage('Build and Push Docker Image') {
            steps {
                script {
                    def dockerfile  = 'dockerfile.dockerfile'
                    //  def dockerImage = docker.build('hemvinod/ubuntu:latest' "-f ${dockerfile} .")
                    docker.withRegistry('https://registry.hub.docker.com', 'docker_hub_credentials') {
                        def dockerImage = docker.build('hemvinod/ubuntu:latest' "-f ${dockerfile} .")
                        dockerImage.push()
                    }
                }
            }
        }
    }
}
