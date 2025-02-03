## Table of Contents
* [About the repo](#about-the-repo)
* [Quick start](#quick-start)
* [Repository structure](#repository-structure)
   * [terraform-modules](#terraform-modules)
   * [my-cluster](#my-cluster)
   * [accounts](#accounts)
* [CI/CD example with Gitlab CI and Helm](#cicd-example-with-gitlab-ci-and-helm)

## About the repo
This repository contains an example of deploying and managing [Kubernetes](https://kubernetes.io/) clusters to [Azure Cloud Platform](https://portal.azure.com/) (Azure) in a reliable and repeatable way.


## Quick start

Check **terraform.tfvars.example** file inside `environments/prod` folder to see what variables you need to define before you can use terraform to create a cluster.

You can run the following command in `environments/prod` to make your variables definitions available to terraform:
```bash
$ mv terraform.tfvars.example terraform.tfvars # variables defined in terraform.tfvars will be automatically picked up by terraform during the run
```

Once the required variables are defined, use the commands below to create a Kubernetes cluster:
```bash
$ terraform init
$ terraform apply
```

After the cluster is created, run a command from terraform output to configure access to the cluster via `kubectl` command line tool. The command from terraform output will be in the form of:

```bash
$ gcloud container clusters get-credentials my-cluster --zone europe-west1-b --project example-123456
```


## Repository structure
```bash
azure-terraform/
├── README
├── environments/
│   ├── prod/
│   │   ├── terraform.tfvars
│   ├── global/
│   │   ├── main.tf
│   │   ├──provider.tf
│   │   ├── terraform.tfstate
│   ├── modules/
│   │   ├── network
│   │        ├── main.tf
│   │        ├── variable.tf


### terraform-modules
The folder contains reusable pieces of terraform code which help us manage our configuration more efficiently by avoiding code repetition and reducing the volume of configuration.

### network
Inside the **network** folder, I put terraform configuration for the creation and management of an example of Kubernetes cluster.
Important files here:

* `main.tf` is the place where we define main configuration such as creation of a network for our cluster, creation of the cluster itself and node pools.
* `terraform.tfvars.example` contains example terraform input variables which you need to define before you can start creating a cluster.
* `outputs.tf` contains output variables
* `variables.tf` contains input variables


* `deploy-app-example` has an bunch of Kubernetes objects definitions which are used to deploy nginx to a Kubernetes cluster. You can use the command below to deploy nginx to the cluster once it is created:
	```bash
	$ kubectl apply -f ./deploy-app-example/nginx-example.yml
	```

### accounts
This is another top level folder in this project. It has a separate set of terraform files which are used to manage access accounts to our clusters. For example, you may want to create a service account for your CI tool to allow it to deploy applications to the cluster.

## CI/CD example with Gitlab CI and Helm
For an example of building a CI/CD pipeline with Kubernetes, Gitlab CI, and Helm see [this](http://artemstar.com/2018/01/15/cicd-with-kubernetes-and-gitlab/) blog post.
