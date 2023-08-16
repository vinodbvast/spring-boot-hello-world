pipeline {
    agent any
    environment {
        MAVEN_HOME = tool name: 'maven-3.9.4', type: 'maven'
    }
    stages {
       
        stage('Build') {
            steps {
                script {
                    def mvnCmd = "${env.MAVEN_HOME}/bin/mvn"
                    sh "${mvnCmd} clean package"
                }
            }
        }
        
        stage('Test') {
            steps {
                script {
                    def mvnCmd = "${env.MAVEN_HOME}/bin/mvn"
                    sh "${mvnCmd} test"
                }
            }
        }
        
        stage('Deploy') {
            steps {
                echo "Deploying...."
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
