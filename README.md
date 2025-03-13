# Assessment3: Movie DB

This assessment evaluates your understanding of Continuous Integration & Continuous Deployment concepts utilizing containerization and automation through GitHub Actions.

Your goal is to automate the deployment of a three-tier application stack through a CICD pipeline.  Your stack must include a front end app and web server, a back end API and a database.
We will provide a few examples to get you started.

## Instructions

1. Fork and clone down this repo onto your local machine
2. You can use either of the subdirectories in the templates folder to get you started, or you can create your own app from scratch

## Recommended Steps

1. Ensure the core functionality of your app is working locally
2. Containerize each part of your application
3. Write workflows to:
   - Push your image(s)
   - Provision remote resources
   - Deploy and run your application remotely

You can find additional instructions and a scoring/requirements rubric in the [Assessment 3 Document](https://docs.google.com/document/d/1IWGg04gIUM2j9hj8cyiFhqTTRcr-NvwhIEeYEbRIIQo/edit?tab=t.kt3fj1iax9hz#heading=h.2mviilujhigk)

The assessment is due on the 15th.  You can present earlier for bonus points.

## Setting Up the Pipeline

1. Clone the repo

2. Create the following environment variables

```env
AWS_ACCESS_KEY_ID=<your_access_key_ID>
AWS_SECRET_ACCESS_KEY=<your_secret_access_key>
AWS_SSH_KEY=<your_aws_ssh_key>
POSTGRES_USER=postgres
POSTGRES_PASSWORD=password
POSTGRES_DB=movie_hero
BACKEND_PORT=3001
FRONTEND_PORT=3000
```
