if [ ! $(which anisble) ]; then
  if [ -f /etc/centos-release ] || [ -f /etc/redhat-release ]; then
    yum install -y epel-release
    yum makecache 
    yum install -y python-pip ansible
  elif [ -f /etc/debian_version ] || [ $(grep -qi ubuntu /etc/os-release) ]; then
    sudo apt-get update
    sudo apt-get install software-properties-common
    sudo apt-add-repository ppa:ansible/ansible
    sudo apt-get update
    sudo apt-get install -y python-pip ansible
  else
    echo 'WARN: Distro not supported by this script..'
    echo 'See Ansibles docs for manual install steps:'
    echo 'http://docs.ansible.com/ansible/latest/intro_installation.html'
  fi

else
  echo 'INFO: Ansible already installed, exiting..'
fi
