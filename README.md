# React - Docker project

This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).

## Workflow

In this project, Im using dev and prod environments(Dockerfile.dev and Dockerfile) and carving out the respective docker-compose files with the help of which I'm writing workflow files for Github Actions, inorder to perform tests(in the test.yaml file, which makes use of Dockerfile.dev) and then deploying the resulting zip file(the website) to AWS Elastic Beanstalk(using deploy.yml file), which makes use of docker-compose.yml, which in turn makes use of Dockerfile.
