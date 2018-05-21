# Add a User and SSH Key to a Server

1. On your local machine, create the ssh keys (public and private) to be used to grant user access to a machine via ssh
2. Copy the key files (both) up to the server's administrator account, usually ec2-user in our case
3. Create any new users needed on the system
4. Setup the user's account to allow ssh access
5. Add the public key to each user's `~/.ssh/authorized_keys` file
6. If you cannot add the key to their authorized_keys file, save the public key in their folder on the server
7. Configure SSH on the server
    a. do something
    b. do something else

X. From your local machine, zip up the two keys, and provide them to each of the account owners


## Assumptions

- When keys are created, a copy of the public and private keys are added to the AWS default user account for that system. For example, if it were a CentOS box, the primary user would be `centos`. If it were RedHat, the primary user would be `ec2-user`. The pair of keys are stored in the `~/.ssh/` folder.
- A user's keys are mailed to them in a zip
- A user's public key is installed on each server, in that user account's `~/.ssh/authorized_keys` file.
- A folder is created here: `/usr/keys/` with the owner being set to: `root:wheel`. This will allow everyone in the `wheel` group to be able to access the folder's contents. This folder also holds copies of the ssh keys.

## Creating Keys

``` bash
    project_name="vamobile-hd"
    sudo mkdir /.keys && cd /.keys
    sudo ssh-keygen -f /.keys/$project_name -t rsa -b 4096
```

### Results of the ssh-keygen Command

``` text
saturn:.keys adge$ sudo ssh-keygen -f /.keys/$project_name -t rsa -b 4096
Generating public/private rsa key pair.
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /.keys/vamobile-hd.
Your public key has been saved in /.keys/vamobile-hd.pub.
The key fingerprint is:
SHA256:B5CeNjBoywcSi5cSs/otgeanyS50PZTGj1SUuWRuUVo root@saturn.frontierlocal.net
The key's randomart image is:
+---[RSA 4096]----+
|+. .  oo+E       |
|o=+.o .Oo        |
|=+oo.+*o+        |
|.+o .*=+ .       |
|o...=.+.S .      |
|oo + + . .       |
|..+.. .          |
|o +.             |
|o=               |
+----[SHA256]-----+
saturn:.keys adge$ 

```

``` bash
    # Log into remote system/server
    #
    # Example for new user account "adge"
    account="adge"
    sudo useradd $account
    sudo passwd $account
    sudo usermod -aG wheel $account
    
    # copy key files to new user's ~/.ssh directory
    sudo cp /usr/keys/vamobile-hd.pub ~/.ssh/vamobile-hd.pub
    cat ~/.ssh/vamobile-hd.pub >> ~/.ssh/authorized_key

    # set directory permissions
    sudo chmod -R 700 ~/.ssh
    sudo chmod 600 ~/.ssh/authorized_keys

    # you should have also already mailed a zip file with both
    # the public and private keys, to the user
    # the message should indicate what they need to do with
    # the private key and public key files.
```

``` bash
    # Log into remote system/server
    #
    # Example for existing user account "madmin"
    account="madmin"
    sudo mkdir /home/$account/.ssh
    sudo chown centos:centos /home/$account/.ssh
    sudo touch /home/$account/.ssh/authorized_keys









[centos@ip-10-171-39-5 ~]$ account="madmin"

[centos@ip-10-171-39-5 ~]$ sudo mkdir /home/$account/.ssh
mkdir: cannot create directory ‘/home/madmin/.ssh’: File exists

[centos@ip-10-171-39-5 ~]$ sudo chown centos:centos /home/$account/.ssh

[centos@ip-10-171-39-5 ~]$ sudo chown centos:centos /home/$account/.ssh/authorized_keys
chown: cannot access ‘/home/madmin/.ssh/authorized_keys’: No such file or directory

[centos@ip-10-171-39-5 ~]$ sudo touch /home/$account/.ssh/authorized_keys

[centos@ip-10-171-39-5 ~]$ sudo chown centos:centos /home/$account/.ssh/authorized_keys

[centos@ip-10-171-39-5 ~]$ cd .ssh

[centos@ip-10-171-39-5 .ssh]$ ls
authorized_keys  known_hosts  vamobile-hd  vamobile-hd.pub

[centos@ip-10-171-39-5 .ssh]$

[centos@ip-10-171-39-5 .ssh]$ cat vamobile-hd.pub
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCs0mjMfSVsluDKhj/Y9OkgKjJ4OWf25UKd8vbV+EOCWU8G7qdnea/6Al7WzCQt/Fs9r1JKUIFDaEKIpIbTZS+nqmsUFGUzvqRPWffTTJYrqKuMTf0ouO6j9F7w9eh4vvsaxqlx72EcRKJFs5HqJHezKoYRIP9jjbnohdril7Anx2D+Gfxu1MfKvaOcsoj2JcsNlXjlM1h5/2MH+/x1i9QkUvllXuv+6IQO8zQ5E6r26SA8HDLkcKTzDF1N5j5z9nFYlmiqiw6Mk+fsenhkzphFXae76qIDM2qPGdnDyH8/tVrPk5sbo+UYHuHshfqgCGZ1V7QAxNJ8uKx2zN9f9yD46jIefkNuvBN6QwaUOvkGMmKdNFBf7IsV4QaEdkpTq8ts+UGInslxAxIZsBQKmqIZCldfHZURFBrOOWCqc7XXz6EEv1cfTtkGwX+GesaED7QIADD4AyArY0Fapj4/BniFf5uKPrZYRBB1qcgLp70dkz4/opNinU3ICj+L0g49EwL3K3Kwa4pJI7VZMCI0Iu67izXTmKTWH3mjCbyggpsV75wHTRSdMeKQbqcVFmP09uDPjDIMBW8y+upa6jDqpfKmk6dV09HIjrz0/oHpXwFBxH19vylQ9AYqnO61YUp/XfaOOvyhZKQQNPYB0D/vaXvNkAnd0aUPiQVGwtRTuHpBrQ== root@saturn.frontierlocal.net

[centos@ip-10-171-39-5 .ssh]$ sudo nano /home/madmin/.ssh/authorized_keys

# paste in the public key from just above, save and close nano

[centos@ip-10-171-39-5 .ssh]$ sudo chown -R madmin:madmin /home/$account/.ssh

[centos@ip-10-171-39-5 .ssh]$ sudo chmod 700 /home/$account/.ssh

[centos@ip-10-171-39-5 .ssh]$ sudo chmod 600 /home/$account/.ssh/authorized_keys

[centos@ip-10-171-39-5 .ssh]$ 



# from your home directory
ssh -i "~/.ssh/vamobile-hd" user@help.vamobile.us



