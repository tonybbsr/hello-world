pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "M3"
    }

    stages {
        stage('Build') {
            steps {
                // Get some code from a GitHub repository
               git 'https://github.com/tonybbsr/hello-world.git'

                // Run Maven on a Unix agent.
                sh "mvn install package"

                // To run Maven on a Windows agent, use
                // bat "mvn -Dmaven.test.failure.ignore=true clean package"
            }
         }
             stage('Deploy') {
                 steps {
                     deploy adapters: [tomcat9(credentialsId: 'tomcat', path: '', url: 'http://34.125.225.116:8080/')], contextPath: null, war: 'webapp/target/webapp.war'
                 }
             }

           
        
    }
}
