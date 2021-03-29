pipeline {
  environment {
    IMAGE = "ghcr.io/mysticrenji/flask-mysql-k3s"
    GITHUBCR="ghcr.io"
    DEPLOY = "${env.BRANCH_NAME == "main" || env.BRANCH_NAME == "develop" ? "true" : "false"}"
    NAME = "flask"
    VERSION = "latest"

  }
  agent {
    kubernetes {
      label 'kubernetes'
      defaultContainer 'jnlp'
      yaml """
apiVersion: v1
kind: Pod
spec:
  containers:
  - name: docker
    image: docker:1.11
    command: ['cat']
    tty: true
    volumeMounts:
    - name: dockersock
      mountPath: /var/run/docker.sock
  - name: helm
    image: lachlanevenson/k8s-helm:v3.5.2
    command:
      - cat
    tty: true
  volumes:
  - name: dockersock
    hostPath:
      path: /var/run/docker.sock
"""
}
  }

 stages {
   /* stage('Clean up') {
      steps {
      container('docker') {
        sh '''
        docker rmi $(docker images -f "dangling=true" -q)
        '''
      }
      }
    }*/
        
   stage('Build Docker image and Push to Container Registry') {
      steps {
      container('docker') {
        withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId:'GitHub',
        usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']])
        {
        git url: "https://github.com/mysticrenji/flask-mysql-k3s.git",  branch: 'main'
        sh '''
        docker login -u $USERNAME -p $PASSWORD $GITHUBCR 
        docker build -t $IMAGE:${VERSION} .
        docker push ${IMAGE}:${VERSION} 
           '''
        }
      }
   }
 }
   stage('Deploy via Helm'){
/*     when {
       environment name: 'DEPLOY', value: 'true'
     }*/
     steps {
       container('helm') {
         sh "helm upgrade --install ${NAME} ./charts  --namespace ${NAME} --set image.repository=${IMAGE} --set image.tag=${VERSION}"
       }
     }
   }
   
  

     

 }
 }
