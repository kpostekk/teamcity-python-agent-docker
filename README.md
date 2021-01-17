# TeamCity Build Agent for Python
A fork of [jetbrains/teamcity-agent](https://hub.docker.com/r/jetbrains/teamcity-agent)

## Features
 - The latest python builds from deadsnakes repo
 - `pipenv` installed OOB
 - Installed `build-essential`

## Usage
For more details look [here](https://hub.docker.com/r/jetbrains/teamcity-agent)

In general, just pull this image and run it.

### Example `docker-compose`

```yaml
version: '3'
services:
  teamcity:
    restart: always
    image: jetbrains/teamcity-server:latest
    volumes: 
      - /opt/teamcity/logs:/opt/teamcity/logs
      - /opt/teamcity/data:/data/teamcity_server/datadir
      - /opt/teamcity/conf:/opt/teamcity/conf
    ports: 
      - "8111:8111"
      - "9090:9090"
  teamcity_agent:
    restart: always
    image: kpostekk/teamcity-python-agent:3.9.1
    environment: 
      - SERVER_URL=http://teamcity:8111/
      - AGENT_NAME=Elon
      - DOCKER_IN_DOCKER=start
    privileged: yes
    volumes: 
      - /opt/teamcity/agent:/data/teamcity_agent/conf
```
