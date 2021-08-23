# Hello EKS Anywhere

This is an example application you can deploy to your [Amazon EKS Anywhere](https://anywhere.eks.amazonaws.com) clusters.
It is intended to verify your Kubernetes components are working well enough to deploy a stateless workload.

You can deploy the container from the main branch with
```bash
kubectl apply -f https://raw.githubusercontent.com/aws-containers/hello-eks-anywhere/main/hello-eks-a.yaml
```

The pre-built container is hosted at [https://gallery.ecr.aws/aws-containers/hello-eks-anywhere](https://gallery.ecr.aws/aws-containers/hello-eks-anywhere).
And can be run locally in docker with

```bash
docker run -p 8000:80 -e POD_NAME=localhost public.ecr.aws/aws-containers/hello-eks-anywhere
```

The application can be verified three different ways.

### Kubectl logs

```bash
kubectl get pods -l app=hello-eks-a
```

You can view the logs for the pod which should show the following output along with standard nginx output.

```
⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢

Thank you for using

███████╗██╗  ██╗███████╗                                             
██╔════╝██║ ██╔╝██╔════╝                                             
█████╗  █████╔╝ ███████╗                                             
██╔══╝  ██╔═██╗ ╚════██║                                             
███████╗██║  ██╗███████║                                             
╚══════╝╚═╝  ╚═╝╚══════╝                                             
                                                                     
 █████╗ ███╗   ██╗██╗   ██╗██╗    ██╗██╗  ██╗███████╗██████╗ ███████╗
██╔══██╗████╗  ██║╚██╗ ██╔╝██║    ██║██║  ██║██╔════╝██╔══██╗██╔════╝
███████║██╔██╗ ██║ ╚████╔╝ ██║ █╗ ██║███████║█████╗  ██████╔╝█████╗  
██╔══██║██║╚██╗██║  ╚██╔╝  ██║███╗██║██╔══██║██╔══╝  ██╔══██╗██╔══╝  
██║  ██║██║ ╚████║   ██║   ╚███╔███╔╝██║  ██║███████╗██║  ██║███████╗
╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝    ╚══╝╚══╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝
                                                                     
You have successfully deployed the hello-eks-a pod $POD_NAME

For more information check out
https://anywhere.eks.amazonaws.com

⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢⬡⬢
```

### kubectl port forward

You can forward the port to your local system and access the application via a web browser or `curl`.

```bash
kubectl port-forward deploy/hello-eks-a 8000:80
```

Now you can run this command to see the same output as is printed in the logs.

```bash
curl localhost:8000
```

### Expose the service via ingress or load balancer

You can add an external load balancer to your EKS-A cluster and access the service using an external service IP or through an ingress controller.
More documentation on how to do that can be found [here](https://eksanywhere.jgarr.net/docs/tasks/workload/loadbalance/).

