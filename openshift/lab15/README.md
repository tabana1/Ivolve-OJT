# iVolve-OJT/openshift/lab15

# what is Daemonset
In Kubernetes, a DaemonSet is a resource that ensures a specified Pod runs on all nodes (or a specific subset of nodes) in your cluster. It guarantees that there's at least one instance of the Pod running on each eligible node. Here's a breakdown of its characteristics and use cases:

What it is:

A Kubernetes object that manages Pods.
Creates and schedules identical Pods across designated nodes.
Ensures high availability for background services.
Automatically restarts failed Pods.
What it's used for:

Running background services on each node: DaemonSets are ideal for deploying services that need to run on every node in the cluster, such as:
Logging agents: These agents collect logs from applications running on the nodes and send them to a central location for analysis.
Monitoring agents: These agents monitor the health and performance of the nodes and applications running on them.
Node-local storage: DaemonSets can be used to deploy distributed storage systems like Ceph to provide persistent storage on each node.
Security agents: These agents can be deployed with DaemonSets to scan nodes for vulnerabilities and enforce security policies.
Maintaining cluster state: They can be used to manage configurations or resources that need to be consistent across all nodes.
For example, a DaemonSet could be used to deploy a Pod that configures network settings on each node.
Key benefits:

High availability: Guarantees a running Pod on each node for critical background services.
Scalability: Automatically scales up or down as you add or remove nodes in your cluster.
Self-healing: Restarts failed Pods automatically, ensuring service continuity.
Simplified management: Manages the lifecycle of Pods across multiple nodes.
In essence, DaemonSets provide a robust mechanism for deploying and managing background services that require consistent operation on all nodes in your Kubernetes cluster.
## Node Affinity vs. Taints & Tolerations

Node Affinity

Purpose: Attraction - Defines preferences for pods to be scheduled on specific nodes based on node labels.
Approach: Labels and operators on pods and nodes (e.g., a pod requiring an NVIDIA GPU might have a node affinity rule targeting nodes with a label "gpu=true").
Granularity: More granular - Targets specific node attributes.
Taints & Tolerations

Purpose: Repulsion & Permission - Excludes unsuitable pods from nodes while allowing certain pods to be scheduled on tainted nodes.
Taints: Attributes applied to nodes to make them undesirable for certain pods.
Tolerations: Properties of pods that allow them to tolerate specific taints (e.g., a node undergoing maintenance might be tainted with "maintenance=true," and only pods with a toleration for this taint can be scheduled on it).
Approach: Taints on nodes, tolerations on pods.
Granularity: Less granular - Broader exclusion based on taints.
## When to Use:

Node Affinity: When you need fine-grained control over pod placement based on node characteristics (e.g., hardware, storage, OS version).
Taints & Tolerations: When you want to prevent certain types of pods from being scheduled on specific nodes (e.g., node maintenance, resource limitations) or enable scheduling pods on nodes in a temporary state (like maintenance) with specific tolerations.
Combining Strategies:

You can combine both approaches for more comprehensive control:

Use node affinity to attract pods to desired nodes with specific labels.
Use taints and tolerations to further ensure only compatible pods are scheduled on those nodes, even if they have the desired labels.
Choosing the Right Approach:

Node Affinity: When precise node selection based on labels is necessary for your application's functionality.
Taints & Tolerations: For dynamic exclusion or restricting access to specific nodes based on their temporary state.




