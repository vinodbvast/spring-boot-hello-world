pipeline {
    agent any
    tools {
            maven 'maven-3.6.3'
    }
    stages {
       
        stage('Build') {
            steps {
                script {
                 
                    sh "mvn clean package"
                }
            }
        }
        
        // stage('Test') {
        //     steps {
        //         script {
                   
        //             sh "mvn test"
        //         }
        //     }
        // }
        
        stage("Artifacts"){
             steps {
                rtUpload (
                    // Obtain an Artifactory server instance, defined in Jenkins --> Manage Jenkins --> Configure System:
                    serverId: "jfrogdev-01",
                    spec: """{
                            "files": [
                                    {
                                        "pattern": "./target/*.jar",
                                        "target": "artifactory-build-info/"
                                    }
                                ]
                            }"""
                )
               
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
