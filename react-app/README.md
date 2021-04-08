## Deploy Static App to Azure using Jenkins
This project contains a static app developed using React and deployed to Azure static apps tapping Jenkins along with Ansible

![Architecture](react-app/images/AzureStaticApps-CICD.png?raw=true "Pipelines")


### Prequisites
The Jenkins infrastructure runs on Kubernetes cluster. Each stage inside the pipeline will be executed in a dynamically provisioned container and once the tasks are done, container destroys by itself. If there are artifacts that are required to be persistent, it has be stored and exported to external artifact store such as Nexus or JFrog.

