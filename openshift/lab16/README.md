

# Lab 16: Deploying an HTML Application using Source-to-Image (S2I) in OpenShift

This lab demonstrates how to deploy an HTML application using the Source-to-Image (S2I) workflow in OpenShift. The steps are provided for both the OpenShift CLI and the OpenShift Console.

## Prerequisites
- Access to an OpenShift cluster.
- `oc` CLI tool installed.
- Basic knowledge of OpenShift and Kubernetes.

## Using OpenShift CLI

### 1. Clone the HTML Application Repository
First, clone the repository to your local machine:
```sh
git clone https://github.com/IbrahimmAdel/html.git
cd html
```

### 2. Log in to OpenShift
Log in to your OpenShift cluster using the `oc` CLI tool. Replace `<your-cluster-url>` with your OpenShift cluster URL:
```sh
oc login <your-cluster-url> --token=<your-token>
```

### 3. Create a New Project
(Optional) Create a new project:
```sh
oc new-project my-html-project
```

### 4. Create a BuildConfig
Create a `BuildConfig` to build the HTML application using the Nginx builder image. Name the `BuildConfig` `my-html-app`:
```sh
oc new-build --name=my-html-app --binary --image-stream=nginx:latest
```

Upload the application source code to OpenShift:
```sh
oc start-build my-html-app --from-dir=. --follow
```

### 5. View the Build Logs and Monitor the Progress
To monitor the build logs and progress:
```sh
oc logs -f bc/my-html-app
```

### 6. Deploy the Application
Once the build is complete, deploy the application:
```sh
oc new-app my-html-app
```

### 7. Expose the Service
Expose the service to create a route and make the application accessible from outside the cluster:
```sh
oc expose svc/my-html-app
```

### 8. Access the Website
Get the URL for the newly created route:
```sh
oc get route
```
Access the website using the provided URL in your web browser.

## Using OpenShift Console

### 1. Clone the HTML Application Repository
First, clone the repository to your local machine:
```sh
git clone https://github.com/IbrahimmAdel/html.git
cd html
```

### 2. Log in to the OpenShift Console
Open your web browser and navigate to the OpenShift Console URL provided by your cluster administrator. Log in with your credentials.

### 3. Create a New Project
If you want to create a new project, click on the `+` symbol next to the "Projects" tab in the console, then click "Create Project". Fill in the required details like name, display name, and description.

![Create Project](images/1-create-project.png)

### 4. Create a BuildConfig
1. In the OpenShift Console, navigate to the project where you want to deploy the application.
2. Click on the `+Add` button in the top navigation bar.
3. Select `Import from Git` from the options.

![Add to Project](images/2-add-to-project.png)

4. In the "Git Repo URL" field, enter the URL of the GitHub repository: `https://github.com/IbrahimmAdel/html.git`.
5. For the `Builder Image`, select `nginx` from the list of builder images.
6. Name the application `my-html-app`.

![Import from Git](images/3-import-from-git.png)

7. Click on the `Show Advanced Git Options` to add any necessary configurations.
8. Click `Create` to create the BuildConfig and start the build process.

![Builder Image](images/4-builder-image.png)

### 5. View the Build Logs and Monitor the Progress
- After creating the BuildConfig, you will be redirected to the build page.
- Click on the `my-html-app` build to see the build details.
- Go to the `Logs` tab to monitor the build progress.

![Build Logs](images/5-build-logs.png)

### 6. Deploy the Application
- Once the build is complete, OpenShift will automatically deploy the application.
- You can verify the deployment by navigating to the `Topology` view under the `Project` section. You should see the `my-html-app` deployment.

![Topology View](images/6-topology-view.png)

### 7. Expose the Service
- Click on the `my-html-app` deployment in the `Topology` view.
- In the details panel on the right, click on the `Actions` dropdown and select `Expose`.
- Configure the route and create it to make the application accessible from outside the cluster.

![Expose Service](images/7-expose-service.png)

### 8. Access the Website
- After exposing the service, OpenShift will create a route.
- You can find the URL for the route in the `Routes` section under the `Networking` tab.
- Access the website using the provided URL in your web browser.

![Route URL](images/8-route-url.png)

By following these steps, you will have successfully deployed your HTML application using the S2I workflow in OpenShift and made it accessible via a web URL.

---
