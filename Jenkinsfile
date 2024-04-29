pipeline{
    agent any
    tools{
        jdk 'jdk11'
        maven 'maven3'
    }
    stages{
        stage('Git Checkout'){
            steps{
                git changelog:false , url: 'https://github.com/Bibox1/java-rest-api-calculator.git'
            }
        }
        stage('Compile'){
            steps{
                sh "mvn clean compile "
            }
        }
        stage('Build the Application'){
            steps{
                sh "mvn clean install"
            }
        }
        stage('Build Docker Image'){
            steps{
                script{
                    sh "docker build -t arab112/calculator -f Dockerfile ."
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerHubPwd')]) {
                    sh "docker login -u arab112 -p ${dockerHubPwd}"
                }
            }
            sh "docker push arab112/calculator"
        }
        stage('Docker deploy to container'){
            steps{
                script{
                    withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerHubPwd')]) {
                        sh "docker login -u arab112 -p ${dockerHubPwd}"
                    }
                    sh "docker run -d --name calcul -p 8070:8070 arab112/calcul"
                }
            }
        }
    }
}