# IT610 Server Documentation

***

### Server Specifications
Minimum requirements (allocate more resources if available):
* CPU - Single core CPU
* RAM - 1024 MB
* HDD - 30 GB
* Networking - one network interface with internet access
* OS - Ubuntu 14.04 (or later)

***

### Create Servers
Create three servers based on the server specifications in your environment of choice (VirtualBox, AWS, VMWare, etc.)

### Prepare Servers
On all servers, run the following commands once installation is complete:

```bash
sudo apt-get update
sudo apt-get upgrade
```

Install pip and linux-metrics, required for check_in_out_octs plugin.

```bash
sudo apt-get install python-pip python-dev build-essential
sudo pip install --upgrade pip
sudo pip install linux-metrics
```

Update time zone to your current geographical location by running the following command:

```bash
sudo timedatectl set-timezone America/New_York
```
**NOTE: Replace "New York" with your current location.**

Ensure that all devices are correctly networked to properly communicate with each other.

### Identify a backup location/code repository
Create a location where you can store all default configurations, in case you need to revert any changes made. If you do not plan to complete this step, go with God.

### Nagios Server
Install Nagios on Server_1 by running the following commands:

```bash
sudo apt-get install nagios3 nagios-nrpe-plugin
sudo apt-get install mysql-client-core-5.7
```

Check that Nagios is up by navigating to the IP address of the server (if you are using AWS, navigate to the public IP address).

Make an in-place copy of the localhost_nagios2.cfg file and rename it to the hostname of each of the other two servers:

```bash
sudo cp /etc/nagios3/conf.d/localhost_nagios2.cfg /etc/nagios3/conf.d/[Server_2].cfg
sudo cp /etc/nagios3/conf.d/localhost_nagios2.cfg /etc/nagios3/conf.d/[Server_3].cfg
```

Edit each newly created host file, replacing the hostname and address values with the corresponding values of the servers you will be monitoring.

Restart Nagios and ensure that the newly monitored servers are reflected in the web interface:

```bash
sudo service nagios3 restart
```

**NOTE: If Nagios does not restart successfully, double check that configurations are accurate.**

Install Samba, backup the configuration file, create a new SMB user, and a folder to share:

```bash
sudo apt-get install samba
sudo cp /etc/samba/smb.conf ~/your/backup/location
sudo smbpasswd -a ubuntu
mkdir ~/your/share/location
```

Edit /etc/samba/smb.conf to include the following information:

```bash
[awShare]
path = /home/ubuntu/awShare
valid users = ubuntu
read only = no
```

Restart Samba:

```bash
sudo service smbd restart
```

**NOTE: If Samba does not restart successfully, double check that configurations are accurate.**

Download the plugins from this repository (in nagios_srv/), and copy them to /usr/lib/nagios/plugins

Copy the commands.cfg and localhost_nagios2.cfg files to /etc/nagios3/ and make the appropriate changes to match your current values (e.g. IP addresses).

To configure email, install ssmtp:

```bash
sudo apt-get install ssmtp
```

Copy the ssmtp.conf file from the Git repository, and place it in /etc/ssmtp/
From there, open and edit the file to match your SMTP server's settings.

To test that email notifications work, end a service that Nagios is monitoring, or shut down one of the servers.

### Apache Server
Install Nagios Agent and Apache:

```bash
sudo apt install nagios-nrpe-server
sudo apt-get install apache2
```

Check that Apache is up by navigating to the IP address of the server.

**NOTE: If you are using AWS, navigate to the public IP address.**


### MySQL Server
Install Nagios Agent and MySQL:

```bash
sudo apt install nagios-nrpe-server
sudo apt-get install mysql-server-5.6
```

Verify the MySQL was installed correctly by signing in with the password you configured during the setup process:

``` bash
mysql -u root -p

```
If successful, logout (by typing "exit") and run the following command to create a user to allow Nagios to monitor MySQL:

```sql
CREATE USER nagios IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'nagios'@'%';
```

Back up the /etc/mysql/mysql.conf.d/mysqld.cnf file, then edit the original. Comment out the single line corresponding to the bind address in the mysqld.cnf file. This will allow for remote connections to the server from any IP address.


Restart MySQL

```bash
sudo service mysqld restart
```

Copy the sqlbackup.sh script from sql_srv/ in Git, and place it in your home directory.

Edit the script to include the information for your database, and the location you wish to store all backups.
Add this script to the crontab file, setting the frequency of backups to your specified value.
