pipeline {
    agent any
    stages {
        stage ('Git Checkout') {
            steps{
                git branch: 'main', url: 'https://github.com/aakash894/assingment.git'
            }
        }
        stage('terraform format check') {
            steps{
                sh 'terraform fmt'
            }
        }
        stage('terraform Init') {
            steps{
                sh 'terraform init'
            }
        }
        stage('terraform apply'){
            steps {
                sh 'terraform apply --auto-approve'
            }
        }
        stage('terminate instance'){
            steps {
                sh ```
                INSTANCE_ID=$(aws ec2 describe-instances  --filters "Name=tag:version,Values=nubra" "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].InstanceId" --output text)
                echo $INSTANCE_ID
                aws ec2 terminate-instances --instance-ids $INSTANCE_ID
                ```
            }
        }
    }    
}
