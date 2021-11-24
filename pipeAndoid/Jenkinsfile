pipeline {

    agent {
        docker {
            image 'androidsdk/android-30'
        }
    }
    /* agent { label 'mac' } */

    environment {
        branch = 'master'
        url = 'https://github.com/GustavoIanguas/HelloWorld4'
    }

    stages {

        stage('Checkout git') {
            steps {
                git branch: branch, credentialsId: 'git', url: url
            }
        }

        stage('Lint') {
            steps {
                sh "./gradlew lint"
            }
        }

        stage('Test') {
            steps {
                sh "./gradlew test --stacktrace"
            }
        }

        // Manage Jenkins > Credentials > Add > Secret file or Secret Text
        stage('Credentials') {
            steps {
                withCredentials([file(credentialsId: 'ANDROID_KEYSTORE_FILE', variable: 'ANDROID_KEYSTORE_FILE')]) {
                    sh "cp '${ANDROID_KEYSTORE_FILE}' app/key-sotre.jks"
                    sh "cat app/key-sotre.jks"
                }
                withCredentials([file(credentialsId: 'FIREBASE_SERVICE_ACCOUNT_FILE', variable: 'FIREBASE_SERVICE_ACCOUNT_FILE')]) {
                    sh "cp '${FIREBASE_SERVICE_ACCOUNT_FILE}' app/firebase-key.json"
                    sh "cat app/firebase-key.json"
                }
            }
        }

        stage('Build') {
            steps {
                sh "./gradlew clean assembleRelease"
                sh "./gradlew bundleRelease"
            }
        }
                stage('Firebase Distribution') {
                    steps {
                        sh "./gradlew appDistributionUploadRelease --track $Track"
                    }
                }

                stage('Google Play...') {
                    steps {
                        sh "./gradlew publishBundle --track $Track"
                    }
                }
            }
        }
