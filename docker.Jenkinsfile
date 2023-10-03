pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout([
                    $class: 'GitSCM',
                    branches: [[name: '*/dev']], // Specify the branch you want to checkout
                    doGenerateSubmoduleConfigurations: false,
                    extensions: [],
                    submoduleCfg: [],
                    userRemoteConfigs: [[
                        url: 'https://github.com/vinodbvast/spring-boot-hello-world.git' // Your Git repository URL
                    ]]
                ])
            }
        }
        
        stage('Build and Push Docker Image') {
            steps {
                script {
                    def dockerfile = 'Dockerfile.dockerfile' // Specify the correct Dockerfile name
                    def dockerImageName = 'hemvinod/ubuntu:latest'
                    
                    // Authenticate with Docker Hub using the credentials
                    docker.withRegistry('https://registry.hub.docker.com', 'docker_hub_credentials') {
                        def dockerImage = docker.build(dockerImageName, "--file ${dockerfile} .")
                        dockerImage.push()
                    }
                }
            }
        }
    }
}
