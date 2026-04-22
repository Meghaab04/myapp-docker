node {
   def mvnHome = tool 'M3'

   stage('Checkout Code') { 
      git 'https://github.com/maping/java-maven-calculator-web-app.git'
   }

   stage('Build & Unit Test') {
      sh "'${mvnHome}/bin/mvn' clean package"
   }

   stage('Integration Test') {
      sh "'${mvnHome}/bin/mvn' integration-test"
   }

   stage('Verify') {
      sh "'${mvnHome}/bin/mvn' verify"
   }

   stage('Build Docker Image') {
      sh 'docker build -t calculator-app .'
   }

   stage('Deploy') {
      timeout(time: 10, unit: 'MINUTES') {
           input message: 'Deploy this web app to production ?'
      }

      sh 'docker rm -f calculator-container || true'
      sh 'docker run -d -p 8080:8080 --name calculator-container calculator-app'
   }
}
