pipeline{
    agent any
    stages{
        stage("Cleanup"){
            steps{
                sh 'docker rm -f \$(docker ps -aq) || true'
                sh 'docker rmi -f \$(docker images) || true'
            }
        }
        stage("Build image"){
            steps{
                sh "docker build -t lab3_stretch ."
            }
        }
        stage("Security Scan"){
            steps{
                sh 'trivy fs --format json -o report.json .'
                }
                post {
                    always {
                        // Archive trivy report
                        achiveArtifacts artifacts: 'report.json', onlyIfSuccessful: true
                }
            }
        }
        stage("Running the container"){
            steps{
                sh "docker run -d -p 80:5500 lab3_stretch"
            }
        }
    }
}
