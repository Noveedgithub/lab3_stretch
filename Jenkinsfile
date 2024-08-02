pipeline{
    agent any
    stages{
        stage("Cleanup"){
            steps{
                sh "docker rm -f $(docker ps -aq)"
                sh "docker rmi -f $(docker images)"
            }
        }
        stage("Build image"){
            steps{
                sh "docker build -t noveed/lab3_stretch ."
            }
        }
        stage("Running the container"){
            steps{
                sh "docker run -d -p 80:5500 --name lab3_stretch"
            }
        }
    }
}
