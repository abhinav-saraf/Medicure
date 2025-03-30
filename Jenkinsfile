pipeline {
  agent any
    stages {
      stage('Git checkout') {
        steps {
          git branch: 'master', url: 'https://github.com/sarafabhinav1997/Medicure'
        }
      }
      stage('Maven Package') {
        steps {
          sh 'mvn package'
        }
      }
      stage('Docker Image Creation') {
        steps {
          sh 'docker build -t sarafabhinav1997/medicure:latest .'
        }
      }
      stage('Push Dockerhub') {
        steps {
          withCredentials([string(credentialsId: 'dockerhub-pat', variable: 'dockerhub')]) {
            sh 'docker login -u sarafabhinav1997 -p ${dockerhub-pat}'
          }
          sh 'docker push sarafabhinav1997/medicure:latest'
        }
      }
      stage('Ansible Playbook') {
        steps {
          ansiblePlaybook credentialsId: 'sshkey', disableHostKeyChecking: true, installation: 'ansible', inventory: '/etc/ansible/hosts', playbook: 'ansible-playbook.yml', vaultTmpPath: ''
        }
      }
    }
}
