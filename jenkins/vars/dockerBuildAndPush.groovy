def call() {
    def dockerImage = docker.build("tabana1/your-app:${env.BUILD_NUMBER}")
    dockerImage.push()
    return dockerImage.id
}
