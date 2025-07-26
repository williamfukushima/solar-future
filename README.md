# Solar Future Automated Workflows

This repository holds docker compose files for self-hosting a n8n container and a postgres database. The local-files folder holds assets that will be used to setup the automated workflow.

## Getting Started

These instructions will cover usage information and the setup of the deliverables from the technical case on the docker container.

### Prerequisities

In order to run this container you'll need docker installed.

* [Windows](https://docs.docker.com/windows/started)
* [OS X](https://docs.docker.com/mac/started/)
* [Linux](https://docs.docker.com/linux/started/)

### Usage

#### n8n Credentials

If you already have a `credentials.json` file, for this repository, put it in the `local-files` folder. This file should contain credentials for accessing the postgres database and the OpenAI model. Otherwise, you can setup them later manually.

#### Environment Variables

Setup the environment variables to your liking:


Default port values:

* `POSTGRES_PORT`=5432
* `N8N_PORT`=5678

Default login and password for the postgres database:

* `POSTGRES_USER`=postgres
* `POSTGRES_PASSWORD`=postgres1234

#### Other n8n environment variables:

DOMAIN_NAME and SUBDOMAIN together determine where n8n will be reachable from
The top level domain to serve from.
The below example serve n8n at: https://n8n.example.com:

* `DOMAIN_NAME`=example.com
* `SUBDOMAIN`=n8n

Optional timezone to set which gets used by Cron and other scheduling nodes
New York is the default value if not set:

* `GENERIC_TIMEZONE`=America/Sao_Paulo

The email address to use for the TLS/SSL certificate creation:

* `SSL_EMAIL`=user@example.com

#### Volumes

If you want the data of the containers to persist, make sure to specify the path to the folowing volumes in the docker compose flags ([Specifying volumes in docker compose flags](https://docs.docker.com/reference/compose-file/volumes/)):

n8n volumes:

 * n8n_data
 * traefik_data

postgres database volume:

 * postgresdb

With docker installed and with the daemon running, setup the containers by executing the following bash script on the root folder of the project:

```shell
./run.sh
```

## Seeding the database

### n8n Setup
After executing the migration, open the n8n application (if localhosting, that would be `https://localhost:$N8N_PORT`).

Create an account in the setup screen

Load the workflows and credentials by executing the following bash script on the root folder of the project:

```shell
./load_n8n_workflows.sh
```

Open the n8n dashboard to confirm the imports

*** If you didn't override the local-files/credentials files with your own, the template will be imported to be filled in the credentials dashboard. ***

Run the `SeedDB.json` workflow once by clicking on it to populate the database with the compressed mock data that was loaded with the container in the local-files folder.

## Retrieving the client's last 3 months energy readings mean data

The `RequestReportData.json` workflow will return raw user data about the mean of energy consumption during the last 3 months. It is available as a webhook.

The `RequestReport.json` workflow will make the same queries as the latter flow, but will also calculate statistical paremeters of the values distribution and generate a report with conclusions regarding the distribuition's behaviour. It is available as a webhook.

## Built With

* postgres
* n8n

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
