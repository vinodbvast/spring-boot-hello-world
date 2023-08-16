pipeline {
    agent any
    
    environment {
        MAVEN_HOME = tool name: 'Apache Maven', type: '3.6.3'
    }
    
    stages {
       
        
        stage('Build') {
            steps {
                script {
                    def mvnCmd = "${env.MAVEN_HOME}/usr/share/maven"
                    sh "${mvnCmd} clean package"
                }
            }
        }
        
        stage('Test') {
            steps {
                script {
                    def mvnCmd = "${env.MAVEN_HOME}/usr/share/maven"
                    sh "${mvnCmd} test"
                }
            }
        }
        
        stage('Deploy') {
            steps {
                script {
                    def mvnCmd = "${env.MAVEN_HOME}/usr/share/maven"
                    sh "${mvnCmd} deploy"
                }
            }
        }
    }
    
    post {
        always {
            archiveArtifacts artifacts: '**/target/*.jar', allowEmptyArchive: true
        }
        
        success {
            echo 'Pipeline completed successfully. Deployed artifacts.'
        }
        
        failure {
            echo 'Pipeline failed. Please review the build and test logs.'
        }
    }
}