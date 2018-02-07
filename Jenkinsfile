#!/usr/bin/env groovy

node('master') {
    try {
        stage('build') {
            checkout scm
            sh "echo 'ENV SETUP'"
            sh "composer install"
         
        }

        stage('test') {
             sh "echo 'Running Test Env'"
             sh "php artisan serve"
        }

        stage('deploy') {
            // ansible-playbook -i ./ansible/hosts ./ansible/deploy.yml
            sh "echo 'WE ARE DEPLOYING'"
        }
    } catch(error) {
        throw error
    } finally {

    }

}
