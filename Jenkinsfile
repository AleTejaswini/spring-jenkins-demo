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
//             }
//         }

//         stage('Docker Check') {
//             steps {
//                 bat 'docker --version'
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

        stage('Docker Build') {
            steps {
                bat 'docker build -t spring-jenkins-demo:latest .'
            }
        }

        stage('Run Container') {
            steps {
                bat 'docker run -d --name spring-jenkins-demo-container -p 8081:8080 spring-jenkins-demo:latest'
            }
        }
    }
}
