// pipeline {
//     agent any

//     stages {
//         stage('Build') {
//             steps {
//                 bat 'mvn clean package'
//             }
//         }
//     }
// }

// pipeline {
//     agent any

//     stages {
//         stage('Build') {
//             steps {
//                 bat 'mvn clean compile'
//             }
//         }

//         stage('Test') {
//             steps {
//                 bat 'mvn test'
//             }
//         }

//         stage('Package') {
//             steps {
//                 bat 'mvn package -DskipTests'   
//                 // crete JAR file
//             }
//         }
//     }
// }
pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                bat 'mvn clean compile'
            }
        }

        stage('Test') {
            steps {
                bat 'mvn test'
            }
        }

        stage('Package') {
            steps {
                bat 'mvn package -DskipTests'
            }
        }

        stage('Docker Check') {
            steps {
                bat 'docker --version'
            }
        }
    }
}
