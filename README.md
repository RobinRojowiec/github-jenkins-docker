# github-jenkins-docker
Repo explaining how to use Jenkins Pipeline with Github and Docker

# Prerequisite

## Check if docker is running

```bash
sudo docker ps
```

If your docker engine is running, you should get displayed an empty table for running containers (or non-empty if you already started some)

## Create a volume for Jenkins

```bash
sudo docker volume create jenkins_data
```

This volume will store data from the jenkins configuration to avoid data loss on container restart.

## Start Jenkins container

### Go to the *jenkins* directory

```bash
docker run -d -p 80:8080 -p 50000:50000 -v /var/run/docker.sock:/var/run/docker.sock -v jenkins_data:/var/jenkins_home --name jenkins-local berndserker/jenkins:latest
```

This command pulls the latest LTS version of the jenkins container from Dockerhub and runs it using the previously created volume *jenkins_data* and the local port *80*.

## Open container in browser

When opening the browser on *http://localhost/* you should see either (loading image follow up) or: 

![admin password](/img/admin_password_initial.png)

To find out the password, run

```bash
docker logs jenkins-local
```

then you should see this:

![gen password](/img/jenkins_admin_password.png)

# Setup jenkins

## Click on **Select plugins to install**
![gen password](/img/jenkins_install_mask.png)

## Select Docker, NodeJS and Github Branch Plugin as well as Git

![gen password](/img/jenkins_github_plugin.png)

## After filling in a username (admin) and password, click Install

![](/img/jenkins_create_admin_account.png)

## Finally, click **Save and Continue**

# Create a pipeline

![](/img/jenkins_menu.png)

## Click **Create element**

![](/img/jenkins_create_docker_pipeline.png)

## Enter a name for your pipeline, select type **Pipeline** and click Okay

## Copy the pipeline script from **Jenkinsfile** into the editor in the section *Pipeline*

![](/img/jenkins_add_pipeline_script.png)

## Click save

![](/img/jenkins_pipeline_menu.png)

## Test the pipeline by clicking **Run build**