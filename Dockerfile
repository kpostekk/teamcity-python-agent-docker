FROM jetbrains/teamcity-agent

USER root
RUN apt update
RUN apt install software-properties-common -y
RUN add-apt-repository ppa:deadsnakes/ppa -y
RUN apt install python3.9 build-essential python3-pip -y --no-install-recommends
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 10

USER buildagent
RUN pip3 install pipenv
CMD ["/bin/sh", "-c", "/run-services.sh"]
