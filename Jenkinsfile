pipeline{
    agent any

    tools {nodejs "NodeJS 4"}

    parameters{
        string(name: 'SPEC', defaultValue: "cypress/e2e/**/**", description: "Enter the scripts path that you want to execute")
        choice(name: 'BROWSER', choices: ['chrome','edge','firefox'], description: "Choose the browser where you want to execute your script")
    }

    stages{
        stage('Building'){
            steps {
            echo "Building the application"
            sh "npm install"
            sh "<<Build Command>>"
            }
        }

        stage('Testing'){
            steps{
                sh "node test"
                sh "npm i"
                sh "npx cypress run --browser ${BROWSER} --spec ${SPEC}"
            }
        }

        stage('Deploying'){
            steps {
            echo "Deploy the application"
            }
        }
    }
    post{
        always{
            publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'cypress/reports/html', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: '', useWrapperFileDirectly: true])
        }
    }
}