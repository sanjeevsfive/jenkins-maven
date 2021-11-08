pipeline {
    agent any
     stages {
      stage('Compile and Clean') { 
            steps {
                sh "mvn clean compile"
            }
        }
        stage('Test') { 
            steps {
                sh "mvn test site"
            }
            
             post {
                always {
                    junit allowEmptyResults: true, testResults: 'target/surefire-reports/*.xml'   
                }
            }     
        }

          stage('package') { 
            steps {
                sh "mvn package"
            }
        }

        stage('Build Docker image'){
            steps {
                sh 'docker build -t sanjeevsfive/maven:${BUILD_NUMBER} .'
            }
        }
        stage('Docker Login'){
            steps {
                withCredentials([string(credentialsId: 'dockeridd', variable: 'dockeridd')]) {
                     sh "docker login -u sanjeevsfive -p ${dockeridd}"
                }
            }                
        }

        stage('Docker Push'){
            steps {
                sh 'docker push sanjeevsfive/maven:${BUILD_NUMBER}'
            }
        }
         
        stage('Archving') { 
            steps {
                 archiveArtifacts '**/target/*.jar'
            }
        }
    }
}
