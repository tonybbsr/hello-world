pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "M3"
    }
    environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub-cred-tonybbsr')
	}

    stages {
        stage('Git Pull') {
            steps {
                // Get some code from a GitHub repository
                git 'https://github.com/tonybbsr/hello-world.git'
            }
        }
        stage('Maven Build') {
            steps {
                // Get some code from a GitHub repository
                sh 'mvn install package'
            }
        }
        
         stage('Docker Build') {
            steps {
                // Get some code from a GitHub repository
                sh 'sudo docker build -t tonybbsr/debasis_sahani:1 .'
            }
        }
        
       stage('Push image') {
        docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-cred-tonybbsr') {
            sh 'sudo docker push tonybbsr/debasis_sahani:1 '
        }
         stage('Docker run ') {
            steps {
                // Get some code from a GitHub repository
                sh 'sudo docker run -itd -p 8081:8080 debasis'
            }
        }
//         stage('Deploy To Tomcat') {
//             steps {
//                 // Get some code from a GitHub repository
//                deploy adapters: [tomcat9(credentialsId: 'tomcat', path: '', url: 'http://34.125.237.227:8080/')], contextPath: null, war: 'webapp/target/webapp.war'
//             }
//         }
    }
}
