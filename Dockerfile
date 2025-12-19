FROM ubuntu:22.04

# used to choose the default answers i.e. avoids prompting you yes or no
ARG DEBIAN_FRONTEND=noninteractive

# install required pacakges for ansible
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
    software-properties-common \
    python3 \
    python3-pip && \
    apt-get clean

# Create a non-root user for better security
RUN useradd -m -s /bin/bash ansible && \
usermod -aG sudo ansible

# Set the working directory
WORKDIR /home/ansible

# Switch to the ansible user
USER ansible

# add the home directory to the path
ENV PATH="/home/ansible/.local/bin:${PATH}"

RUN python3 -m pip install --user ansible

CMD ["/bin/bash"]
