pipeline {
    agent any
    
    environment {
        NODEJS_HOME = tool name: 'NodeJs', type: 'NodeJSInstallation'
    }
    stages {
        stage('Build') {
            steps {
                sh 'npm install'
            }
        }
        stage('Test') {
            steps {
                sh './test.sh'
            }
        }
        stage('Deliver') {
            steps {
                sh './deliver.sh'
                input message: 'Finished using the web site? (Click "Proceed" to continue)'
                sh './kill.sh'
            }
        }
    }
}