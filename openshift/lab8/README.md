# MySQL StatefulSet in Kubernetes

## Overview

This repository contains the YAML configurations for deploying MySQL using a Kubernetes StatefulSet. It includes configurations for both the StatefulSet and the Service required for MySQL.

## Comparison: Deployment vs StatefulSet

### Deployment

- **Purpose:** Used for stateless applications.
- **Pod Management:** Pods are interchangeable; any pod can replace another.
- **Scaling:** Easily scalable up or down; pods are created or terminated to match the desired state.
- **Update Strategy:** Supports rolling updates and rollbacks.
- **Persistent Storage:** Typically uses Persistent Volume Claims (PVCs) not tied to specific pods.
- **Use Case:** Ideal for web servers, API servers, and microservices that do not require persistent storage.

### StatefulSet

- **Purpose:** Used for stateful applications.
- **Pod Management:** Pods have unique, stable identities (hostname, network, storage) that persist across rescheduling.
- **Scaling:** Pods are created in order and terminated in reverse order to ensure stable identities.
- **Update Strategy:** Sequential updates ensure each pod maintains its identity.
- **Persistent Storage:** Uses PVCs bound to individual pods, ensuring each pod has its own storage.
- **Use Case:** Suitable for databases, stateful applications, and applications requiring stable network identities or persistent storage.

## MySQL StatefulSet Configuration

### StatefulSet YAML

Save the following content in a file named `mysql-statefulset.yaml`.

```yaml
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: mysql
  labels:
    app: mysql
spec:
  selector:
    matchLabels:
      app: mysql
  serviceName: "mysql"
  replicas: 3
  template:
    metadata:
      labels:
        app: mysql
    spec:
      containers:
      - name: mysql
        image: mysql:5.7
        env:
        - name: MYSQL_ROOT_PASSWORD
          value: rootpassword
        ports:
        - containerPort: 3306
          name: mysql
        volumeMounts:
        - name: mysql-persistent-storage
          mountPath: /var/lib/mysql
  volumeClaimTemplates:
  - metadata:
      name: mysql-persistent-storage
    spec:
      accessModes: [ "ReadWriteOnce" ]
      resources:
        requests:
          storage: 1Gi
