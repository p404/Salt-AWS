### Installing Salt-Master and Salt-Cloud

Salt-Master

	wget -O install_salt.sh https://bootstrap.saltstack.com
	sudo sh install_salt.sh -M

Salt-Cloud:

	sudo add-apt-repository ppa:saltstack/salt
	sudo apt-get update
	sudo apt-get install salt-cloud

####Salt Cloud

Example file 
	
/etc/salt/cloud.providers

	aws:
	  driver: ec2
	  id: 'SECRETOSMYGT45WR4A'
	  key: 'SECRETKEYOTZFCp2GBNVJ3sBh8smQaTq1U6'
	  keyname: salt-master
	  private_key: /etc/salt/keys/salt-master.pem
	  location: us-west-2
	  availability_zone: us-west-2c
	  securitygroup: salt-minions


/etc/salt/cloud

	start_action: state.highstate
	minion:
    	master: 52.35.204.170


#### VM profiles salt-cloud config

Example file

/etc/salt/cloud.profiles.d/api-ec2.conf

	api-ec2:
	  provider: aws
	  image: ami-5189a661
	  size: t2.small

#### Create a Instance with salt-cloud

	sudo salt-cloud -p api-ec2 api-2

#### Delete a Instance

   	sudo salt-cloud -d api-2

