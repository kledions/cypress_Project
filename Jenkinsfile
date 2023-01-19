pipeline{
    agent any

    parameters{
        string(name: 'SPEC', defaultValue: "cypress/e2e/**/**", description: "Enter the scripts path that you want to execute")
        choice(name: 'BROWSER', choices: ['chrome','edge','firefox'], description: "Choose the browser where you want to execute your script")
    }

    stages{
        stage('Building'){
            steps {
            echo "Building the application"
            }
        }

        stage('Run E2E tests') {
            dir("cypress-e2e-tests") {
                lock("cypress/e2e/integrations-${env.NODE_NAME}") {
                    sh "npm i"
                    sh "npx cypress run --browser ${BROWSER} --spec ${SPEC}"
                }
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