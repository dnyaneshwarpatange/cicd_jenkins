agent any {
    environment{

        # here I have updated ip here but we should update this_in jenkins where I have updates key file in credentials section.
        VPS_IP = '20.193.138.209'
        VPS_USER = 'azureuser'
        APP_DIR= '~/app_deployment'

    }

    stages{
        stage('Checkout code on the github'){
            steps{
                Checkout scm
            }
        }

        stage('Deploy code on the azure vps'){
            steps {
                sshagent(['azure_key']){


                    sh """
                     # here we are creting a directory in the vps
                    ssh -o StrictHostChecking=no ${VPS_USER}@${VPS_IP} "mkdir ${APP_DIR}"

                    #now will copy the code into the vps from github

                    scp -o StrictHostChecking=no -r * ${VPS_USER}@${VPS_IP}:${APP_DIR}


                    #now will build the docker image and run the containner

                    ssh -o StrictHostChecking=no ${VPS_USER}@${VPS_IP} '''

                    cd ${APP_DIR}


                    echo "Building the docker image"

                    docker build -t node_azure_app .

                    #also we need to check and stop already existing container there so will chek and stop there

                    docker stop node_app_running || true

                    docker rm node_app_running  || true

                    #now will run the container and map the ports

                    docker run -d -p 80:3000 --name node_app_running node_azure_app




                    '''

                    


                    



                    """
                }
            }
        }


    }
}