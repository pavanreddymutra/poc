pipeline {

    // You can define a specific label for agent
    agent any
    options {
        ansiColor('xterm')
    }

   

    stages {

      stage('Terraform Init'){
            steps {
               
                sh "sudo  cp /home/ubuntu/poc/poc.tfvars . &&terraform init -var-file dev.tfvars -input=false -force-copy"
              
            }
        }

        stage('Terraform Plan'){
            steps {
                     
                      script {
                          env.CHANGES = sh (
                              script:"terraform plan -var-file poc.tfvars -out=tfplan -input=false -detailed-exitcode" ,
                              returnStdout: false , returnStatus: true
                          )
                          if (env.CHANGES == '1'){
                              sh "exit 1"
                          } else if (env.CHANGES == '0') {
                              echo 'NO CHANGES to apply!'
                              env.APPROVE = false
                          } else {
                              echo 'CHANGES to apply!'
                          }
                       }
                    

            }
            post {
                success {
                         
                        archiveArtifacts 'tfplan'
                    
                }
            }
        }

        stage('Approve'){
            when {
                allOf {
                    // branch 'master'
                    expression { return env.CHANGES ==~ /2/ }
                }
            }
            steps {
                script {
                    try {
                        timeout(time:10, unit:'MINUTES') {
                            env.APPROVE_CHANGE = input message: 'Apply Changes', ok: 'Continue',
                                parameters: [choice(name: 'APPROVE_CHANGE', choices: 'YES\nNO', description: 'Apply Changes?')]
                            if (env.APPROVE_CHANGE == 'YES'){
                                env.APPROVE = true
                            } else {
                                env.APPROVE = false
                            }
                        }
                    } catch (error) {
                        env.APPROVE = false
                        echo 'Timeout has been reached!!! Apply Changes skipped'
                    }
                }
            }
        }

        stage('Terraform Apply'){
            when {
                allOf {
                    // branch 'master'
                    expression { return APPROVE ==~ /(?i)(Y|YES|T|TRUE|ON|RUN)/ }
                }
            }
            steps {
                    
                        
                    sh "terraform apply -var-file poc.tfvars -input=false -auto-approve"
                
            }
        }
        stage('Ansible deploy'){
           
            steps {
                    
                        
                    sh '''
                sleep 15
                ansible-playbook -i ansible/hosts ansible/ansible-playbook.yml -e "my_username"="testadmin" -e "my_password"="test@dmin99" '''
                
            }
        }
    }

    post {
        always {
            cleanWs()
        }
        
    }

}
