Based on your request and the repository link provided, here is a `README.md` file tailored for the specified project directory:

```markdown
# iVolve OJT - OpenShift Lab 9

This repository contains the files and instructions for Lab 9 of the iVolve On-the-Job Training (OJT) program, focusing on deploying and managing NGINX with persistent storage using OpenShift.

## Table of Contents

- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Steps](#steps)
  - [1. Create the Kubernetes Deployment](#1-create-the-kubernetes-deployment)
  - [2. Exec into the NGINX Pod and Create a File](#2-exec-into-the-nginx-pod-and-create-a-file)
  - [3. Verify the File is Served by NGINX](#3-verify-the-file-is-served-by-nginx)
  - [4. Delete the NGINX Pod](#4-delete-the-nginx-pod)
  - [5. Wait for the Deployment to Create a New Pod](#5-wait-for-the-deployment-to-create-a-new-pod)
  - [6. Verify the File is No Longer Present](#6-verify-the-file-is-no-longer-present)
  - [7. Create a Persistent Volume Claim (PVC)](#7-create-a-persistent-volume-claim-pvc)
  - [8. Modify the Deployment to Attach the PVC](#8-modify-the-deployment-to-attach-the-pvc)
  - [9. Verify the File Persists Across Pod Deletions](#9-verify-the-file-persists-across-pod-deletions)
- [Comparison between PV, PVC, and StorageClass](#comparison-between-pv-pvc-and-storageclass)

## Introduction

In this lab, you will deploy an NGINX server in OpenShift, manage files within the pod, and ensure file persistence across pod deletions using a Persistent Volume Claim (PVC).

## Prerequisites

- OpenShift CLI (oc) installed and configured
- Access to an OpenShift cluster
- Basic understanding of Kubernetes and OpenShift concepts

## Steps

### 1. Create the Kubernetes Deployment
Create a deployment with a single NGINX pod:
```bash
oc create deployment my-deployment --image=nginx --replicas=1
```

### 2. Exec into the NGINX Pod and Create a File
Get the name of the NGINX pod:
```bash
oc get pods -l app=nginx
```
Exec into the pod:
```bash
oc exec -it <nginx-pod-name> -- /bin/bash
```
Inside the pod, create the file:
```bash
echo "hello, this is Your_Name" > /usr/share/nginx/html/hello.txt
exit
```

### 3. Verify the File is Served by NGINX
```bash
oc exec <nginx-pod-name> -- curl localhost/hello.txt
```

### 4. Delete the NGINX Pod
```bash
oc delete pod <nginx-pod-name>
```

### 5. Wait for the Deployment to Create a New Pod
```bash
oc get pods -w
```

### 6. Verify the File is No Longer Present
Get the name of the new NGINX pod:
```bash
oc get pods -l app=nginx
```
Exec into the new pod:
```bash
oc exec -it <new-nginx-pod-name> -- /bin/bash
```
Inside the pod, check if the file exists:
```bash
ls /usr/share/nginx/html/
exit
```

### 7. Create a Persistent Volume Claim (PVC)
Create a file named `pvc.yaml` with the following content:
```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: my-pvc
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
```
Apply the PVC configuration:
```bash
oc apply -f pvc.yaml
```

### 8. Modify the Deployment to Attach the PVC
Create or modify a file named `deployment.yaml` with the following content:
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-deployment
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx
        volumeMounts:
        - name: nginx-pvc
          mountPath: /usr/share/nginx/html
      volumes:
      - name: nginx-pvc
        persistentVolumeClaim:
          claimName: my-pvc
```
Apply the deployment configuration:
```bash
oc apply -f deployment.yaml
```

### 9. Verify the File Persists Across Pod Deletions
- Exec into the new pod and create the file:
```bash
oc exec -it <new-nginx-pod-name> -- /bin/bash
echo "hello, this is Your_Name" > /usr/share/nginx/html/hello.txt
exit
```
- Verify the file is served by NGINX:
```bash
oc exec <new-nginx-pod-name> -- curl localhost/hello.txt
```
- Delete the NGINX pod:
```bash
oc delete pod <new-nginx-pod-name>
```
- Wait for the deployment to create a new pod and verify the file persists:
```bash
oc get pods -l app=nginx
oc exec -it <new-nginx-pod-name> -- /bin/bash
ls /usr/share/nginx/html/hello.txt
exit
```

## Comparison between PV, PVC, and StorageClass

- **Persistent Volume (PV):**
  - A PersistentVolume (PV) is a storage resource provisioned in the cluster, independent of the pods. It can be statically created by administrators or dynamically created using StorageClasses.
  - PVs are cluster resources, and they have a lifecycle independent of any individual pod that uses them.
  - A PV includes specific storage properties such as size, access modes, and storage class.

- **Persistent Volume Claim (PVC):**
  - A PersistentVolumeClaim (PVC) is a request for storage by a user. It specifies the desired storage capacity and access mode.
  - PVCs abstract the underlying storage implementation, making it easier for users to request storage without worrying about the details of provisioning.
  - A PVC can be bound to a PV that meets its requirements. Once bound, the PVC can be used by pods.

- **StorageClass:**
  - A StorageClass defines a class of storage with specific properties and parameters. It can be used to dynamically provision PVs.
  - StorageClasses allow administrators to define different types of storage (e.g., fast SSD storage, slow spinning disks, cloud storage) and policies (e.g., backup, replication).
  - When a PVC requests storage without specifying a PV, a StorageClass can be used to dynamically provision an appropriate PV based on the PVC's requirements.

By following these steps and understanding the differences between PV, PVC, and StorageClass, you can effectively manage persistent storage in an OpenShift cluster.
```


