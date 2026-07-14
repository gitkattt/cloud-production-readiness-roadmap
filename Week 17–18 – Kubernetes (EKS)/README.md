# Amazon EKS Kubernetes Deployment Lab

## Overview

This project demonstrates deploying and managing a Kubernetes cluster using **Amazon Elastic Kubernetes Service (EKS)**. The lab focuses on provisioning an EKS cluster, deploying containerized applications, configuring automatic scaling, monitoring cluster health, and troubleshooting networking failures.

The objective of this lab was to gain hands-on experience with Kubernetes running in AWS while learning how managed Kubernetes simplifies control plane management.

---

# Project Objectives

- Deploy an Amazon EKS cluster
- Deploy a sample Kubernetes application
- Expose applications using a LoadBalancer Service
- Configure Horizontal Pod Autoscaling (HPA)
- Monitor cluster metrics
- Intentionally break networking
- Troubleshoot and restore cluster connectivity

---

# Technologies Used

- Amazon Web Services (AWS)
- Amazon EKS
- Kubernetes
- eksctl
- kubectl
- CloudFormation
- Elastic Load Balancer
- YAML
- Amazon CloudWatch

---

# Architecture

```
                    Internet
                         │
                         ▼
               AWS Load Balancer
                         │
                         ▼
              Kubernetes Service
                         │
                         ▼
                Kubernetes Pods
                         │
                         ▼
              Amazon EKS Worker Nodes
                         │
                         ▼
             Amazon EKS Control Plane
```

---

# Deploying the EKS Cluster

Amazon EKS is AWS's managed Kubernetes service.

AWS manages the Kubernetes control plane, including:

- API Server
- Scheduler
- Controller Manager
- etcd

This allows developers to focus on deploying workloads without managing Kubernetes master nodes.

The cluster was created using **eksctl**.

```bash
eksctl create cluster \
--name my-eks-cluster \
--region us-east-1 \
--nodegroup-name my-nodegroup \
--node-type t2.small \
--nodes 3 \
--nodes-min 1 \
--nodes-max 5 \
--managed
```

After deployment, the CloudFormation stack was verified to ensure all required AWS resources had been successfully provisioned.

---

# Deploying Applications

To verify the cluster was functioning correctly, I first deployed a simple **NGINX web server** and exposed it through an AWS Load Balancer.

Once connectivity was confirmed, I deployed the Kubernetes sample application **2048**, demonstrating application deployment within the cluster.

Deployment manifests were created using Kubernetes YAML configuration files.

Applications were deployed with:

```bash
kubectl apply -f deployment.yaml
```

The deployment was exposed externally using:

```bash
kubectl expose deployment 2048-deployment \
--type=LoadBalancer \
--name=my-service
```

After several minutes, AWS provisioned an Elastic Load Balancer and assigned a public DNS endpoint, allowing external access to the application.

---

# Horizontal Pod Autoscaling

To automatically scale application replicas based on CPU utilization, I configured a **Horizontal Pod Autoscaler (HPA).**

An HPA configuration file was created:

```text
hpa.yaml
```

The configuration was applied using:

```bash
kubectl apply -f hpa.yaml
```

This enabled Kubernetes to automatically increase or decrease pod replicas depending on CPU usage.

---

# Monitoring

I explored the Amazon EKS console and CloudWatch metrics to monitor cluster health.

Examples of monitored metrics included:

- API request concurrency
- Pod scheduling rate
- API server latency
- Pending Pods
- Scheduler attempts
- HTTP 4XX requests
- Cluster database size

Monitoring these metrics provided insight into overall cluster performance and health.

---

# Networking Troubleshooting

To better understand EKS networking, I intentionally misconfigured several security groups associated with the cluster.

The following security groups were modified:

- EKS Cluster Security Group
- EKS Control Plane Security Group
- EKS Shared Node Security Group

After removing the required rules:

- The application became inaccessible
- Load Balancer health checks began failing
- Targets were marked unhealthy
- External connectivity was lost

AWS reported multiple consecutive health check failures for the registered targets.

To restore connectivity, the security groups were recreated and properly configured, allowing the Load Balancer to successfully route traffic back to the application.

This exercise demonstrated how Kubernetes availability depends on correct AWS networking configuration.

---

# Skills Demonstrated

- Amazon EKS administration
- Kubernetes cluster deployment
- Kubernetes Deployments
- Kubernetes Services
- YAML configuration
- eksctl
- kubectl
- Horizontal Pod Autoscaler (HPA)
- AWS Load Balancers
- CloudWatch monitoring
- Kubernetes networking
- Security Group troubleshooting
- Infrastructure validation
- Production-style troubleshooting

---

# Lessons Learned

This project provided practical experience with deploying Kubernetes workloads on AWS while reinforcing several important cloud engineering concepts:

- Managed Kubernetes architecture
- Kubernetes resource management
- Cluster scaling
- AWS networking integration
- Load Balancer behavior
- Security Group dependencies
- Infrastructure troubleshooting
- Production incident recovery

---

# Future Improvements

Potential future enhancements include:

- Deploy the application using Helm
- Configure an NGINX Ingress Controller
- Enable CloudWatch Container Insights
- Implement rolling updates and rollbacks
- Practice pod failure recovery
- Deploy using Terraform instead of eksctl
- Integrate CI/CD with GitHub Actions
- Implement GitOps using ArgoCD or Flux

---

# Conclusion

This lab provided hands-on experience deploying Kubernetes workloads on Amazon EKS while gaining familiarity with cluster provisioning, application deployment, autoscaling, monitoring, and networking troubleshooting.

By intentionally introducing networking failures and restoring service, I gained practical experience diagnosing production-style infrastructure issues and a deeper understanding of how Kubernetes integrates with AWS networking components.
