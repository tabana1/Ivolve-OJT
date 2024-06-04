# Lab 15: DaemonSets & Taint and Toleration

## Overview
This lab covers the concepts of DaemonSets, Taints, and Tolerations in OpenShift. We will create a DaemonSet with an Nginx container, simulate a tainted node using Minikube, and observe the behavior of pods with different tolerations. Additionally, we will compare Taints, Tolerations, and Node Affinity.

## Objectives
1. Understand what a DaemonSet is and its use cases.
2. Create a DaemonSet YAML file with an Nginx container and verify the number of pods.
3. Taint a Minikube node with a key-value pair `color=red`.
4. Create a pod with a toleration `color=blue` and observe its status.
5. Modify the pod's toleration to `color=red` and observe the changes.
6. Compare Taints, Tolerations, and Node Affinity.

## Prerequisites
- OpenShift CLI (`oc`)
- Minikube
- Basic knowledge of Kubernetes and OpenShift

## Instructions

### Step 1: Create a DaemonSet with Nginx

1. **Create a DaemonSet YAML file** (`nginx-daemonset.yaml`):

    ```yaml
    apiVersion: apps/v1
    kind: DaemonSet
    metadata:
      name: nginx-daemonset
    spec:
      selector:
        matchLabels:
          name: nginx
      template:
        metadata:
          labels:
            name: nginx
        spec:
          containers:
          - name: nginx
            image: nginx:latest
    ```

2. **Apply the DaemonSet in OpenShift**:

    ```sh
    oc apply -f nginx-daemonset.yaml
    ```

3. **Verify the number of pods created**:

    ```sh
    oc get pods -l name=nginx
    ```
    ![DaemonSet Pods](images/daemonset_pods.png)

### Step 2: Taint the Minikube Node

1. **Taint the Minikube node** with `color=red`:

    ```sh
    kubectl taint nodes minikube color=red:NoSchedule
    ```

2. **Verify the taint**:

    ```sh
    kubectl describe node minikube | grep Taints
    ```
    ![Taint Node](images/taint_node.png)

### Step 3: Create a Pod with Toleration

1. **Create a Pod YAML file** (`pod-blue-toleration.yaml`) with toleration `color=blue`:

    ```yaml
    apiVersion: v1
    kind: Pod
    metadata:
      name: nginx-pod
    spec:
      containers:
      - name: nginx
        image: nginx:latest
      tolerations:
      - key: "color"
        operator: "Equal"
        value: "blue"
        effect: "NoSchedule"
    ```

2. **Apply the Pod YAML file**:

    ```sh
    kubectl apply -f pod-blue-toleration.yaml
    ```

3. **Observe the Pod's status**:

    ```sh
    kubectl get pod nginx-pod
    ```
    ![Pod Blue Toleration](images/pod_blue_toleration.png)

### Step 4: Modify the Pod Toleration to `color=red`

1. **Update the Pod YAML file** (`pod-red-toleration.yaml`) with toleration `color=red`:

    ```yaml
    apiVersion: v1
    kind: Pod
    metadata:
      name: nginx-pod
    spec:
      containers:
      - name: nginx
        image: nginx:latest
      tolerations:
      - key: "color"
        operator: "Equal"
        value: "red"
        effect: "NoSchedule"
    ```

2. **Apply the updated Pod YAML file**:

    ```sh
    kubectl apply -f pod-red-toleration.yaml
    ```

3. **Observe the Pod's status**:

    ```sh
    kubectl get pod nginx-pod
    ```
    ![Pod Red Toleration](images/pod_red_toleration.png)

## Comparison: Taint & Toleration vs. Node Affinity

- **Taint & Toleration**:
  - **Taint**: Applied to nodes, it repels pods that do not tolerate the taint.
  - **Toleration**: Applied to pods, it allows them to schedule onto nodes with matching taints.
  - **Use Case**: Prevent specific pods from scheduling on certain nodes.

- **Node Affinity**:
  - **Node Affinity**: Constraints that limit which nodes a pod can be scheduled on based on node labels.
  - **Use Case**: Ensure pods are scheduled on nodes with specific attributes (e.g., hardware specifications).

## Conclusion
In this lab, we demonstrated the creation and verification of a DaemonSet, how to taint a node, and how to use tolerations to control pod scheduling. We also compared the concepts of Taints, Tolerations, and Node Affinity to better understand their use cases in managing cluster workloads.

For more information, refer to the [OpenShift Documentation](https://docs.openshift.com).
