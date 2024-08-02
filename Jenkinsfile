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
        stage("Security Scan") {
            steps {
                sh "trivy fs --format json -o trivy-report.json ."
            }
            post {
                always {
                    // Archive the Trivy report
                    archiveArtifacts artifacts: 'trivy-report.json', onlyIfSuccessful: true
                }
            }
        }
        stage("Running the container"){
            steps{
                sh "docker run -d -p 80:5500 lab3_stretch"
            }
        }
        stage('Execute Tests'){
            steps {
                script{
                sh '''
                python3 -m venv .venv
                . .venv/bin/activate
                pip install -r requirements.txt
                python3 -m unittest discover -s tests .
                deactivate
                '''
                }
            }
        }
    }
}
