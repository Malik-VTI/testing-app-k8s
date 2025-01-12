pipeline {
    agent any
    environment {
        DOCKER_REGISTRY = 'malikvti'
        APP_NAME = 'sample-app-k8s'
        KUBE_CONTEXT = 'minikube'
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build JAR') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_REGISTRY/$APP_NAME:latest .'
            }
        }
        stage('Push Docker Image') {
            steps {
                sh 'docker push $DOCKER_REGISTRY/$APP_NAME:latest'
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                sh '''
                kubectl apply -f k8s-deployment.yaml --context=$KUBE_CONTEXT
                kubectl apply -f k8s-service.yaml --context=$KUBE_CONTEXT
                '''
            }
        }
    }
}
