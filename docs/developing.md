Developing on the Cloudstead Codebase
=====================================

# Setting up a Development Environment

    # Log in to a Ubuntu 14.04 system (ideally a fresh/brand new instance)
    ssh user@somehost.example.com

    # Update and install required packages (if you can't 'sudo', talk to the administrator of the machine)
    sudo apt-get update
    sudo apt-get install -y git openjdk-7-jdk maven npm
    sudo ln -s /usr/bin/nodejs /usr/bin/node   # lineman looks for node here
    sudo npm install -g lineman                # lineman builds the frontend emberjs UI
    sudo rm -rf ~/tmp                          # remove temp dir owned by root

    # Optional: install useful developer packages
    apt-get install -y screen emacs24-nox tshark

    # Create a new user (name it whatever you like, we'll use 'devuser' in this example)
    useradd -m devuser

    # Become that user
    su - devuser

    # Set git global options
    git config --global user.name "devuser name"
    git config --global user.email devuser@example.com

    # Add your SSH key to ~/.ssh
    # Add a key that git server is configured to recognize and thus will allow you to clone this repository
    # The command below is merely an example, feel free to get the appropriate key into ~/.ssh 
    # with whatever means makes the most sense for you
    mkdir ~/.ssh && chmod 600 ~/.ssh && scp devuser@some.other.host:.ssh/id_dsa* ~/.ssh/

    # Clone the cloudstead-inc repository and cd into it
    cd ~
    git clone git@github.com:cloudstead/cloudstead-inc.git
    cd cloudstead-inc

    # Run first time setup script
    ./first_time_dev_setup.sh

    # Install databases and other dev tools
    ./dev_bootstrap_ubuntu.sh

    # Run a full build/install of cloudos
    cd cloudos
    mvn -DskipTests=true -P complete install

    # Build all cloudstead-inc components
    cd ~/cloudstead-inc
    mvn -DskipTests=true package


# Deploying Artifacts

In order to setup a cloudstead-server, you'll need to push some artifacts to a server where the install process 
will fetch them.

The `prep.sh` script is used for this purpose. To prepare all the artifacts:

    cd ~/cloudstead-inc
    ./prep.sh all user@deploy-host:/path/to/htdocs/deploy/dir
    
Once the artifacts have been copied to the remote host, verify you can fetch them with wget or curl:

    wget -S -O /dev/null http://deploy-host/deploy/dir/artifact.tar.gz

Now you're ready to launch just about anything.