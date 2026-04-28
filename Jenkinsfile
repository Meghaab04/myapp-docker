node {

    stage('Clean Workspace') {
        deleteDir()
    }

    stage('Checkout') {
        git 'https://github.com/Meghaab04/myapp-docker.git'
    }

    stage('Build') {
        sh 'mvn clean package'
    }

    stage('Build Docker Image') {
        sh 'docker build -t myapp .'
    }

    stage('Run Container') {
        sh 'docker rm -f myapp-container || true'
        sh 'docker run -d --name myapp-container myapp'
    }
}
