pipeline {
    agent any
    stages {
        stage ("git checkout") {
            steps {
                git branch: 'develop', url: 'https://github.com/Sushanta-lab/Learn.git'
            }
        }
    }
}
