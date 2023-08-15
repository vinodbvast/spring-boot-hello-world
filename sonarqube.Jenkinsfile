def git_url = "https://github.com/vinodbvast/spring-boot-hello-world.git"
node {
    stage ('Checkout') {
        checkout([$class: 'GitSCM', branches: [[name: '*/qa']],
        userRemoteConfigs: [[url: git_url]]])

    }
    stage('Build'){
        sh 'mvn clean install'
    }
    stage("Code Analysis"){
        def scannerHome = tool 'sonar5.0'
        withSonarQubeEnv('jen-sonar') {
            sh """
            ${scannerHome}/bin/sonar-scanner \
            -Dsonar.projectKey=springbootapp \
            -Dsonar.projectName=SpringApp \
            -Dsonar.sources=. \
            -Dsonar.java.binaries=target/classes \
            -Dsonar.sourceEncoding=UTF-8
            """
        }
        sh "sleep 40"
        timeout(time: 1, unit: 'MINUTES') {
            def qg = waitForQualityGate()
            if (qg.status != 'OK') {
                error "Pipeline aborted due to quality gate failure: ${qg.status}"
            }
        }
    }
    
   
}