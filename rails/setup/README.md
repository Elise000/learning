# Rails Setup Bash Script
This folder is created for automating Ruby on Rails installation.

Version 0.5.4

<br><br>

# OS support start from version:
| OS                                         | Version  |     Status     |
|:-------------------------------------------|:--------:|:--------------:|
| Mac OSX - El Capitan                       |  0.5.1   | tested working |
| Xubuntu 14.04 64-bit                       |  0.5.0   | tested working |
| Xubuntu 14.10 32-bit                       |  0.5.0   | tested working |
| Mac OSX - Yosmite                          |  0.5.0   | tested working |
| Ubuntu Mate 15.04 32-bit                   |  0.5.0   | tested working |
| Ubuntu Mate 15.04 64-bit                   |  0.5.0   | tested working |
| Raspberry Pi Ubuntu Mate 15.04 64-bit      |  0.5.0   | tested working |

# To start
1) Installation needs sudo or admin authority. Please request from your admin / owner if you do not have the sudo password.

<br><br>

2) Launch the Terminal application.

<br><br>

3) In the Terminal, navigate to your Desktop folder by typing the following command:

```
$ cd ~/Desktop
```

<br><br>

4) Download the correct script using the following command:

Ubuntu or Xubuntu:

```
$ wget https://raw.githubusercontent.com/hollowaykeanho/learning/master/rails/setup/ubuntu/rails_setup_deb.sh
```

<br>
MAC OSX:

```
$ curl -O https://raw.githubusercontent.com/hollowaykeanho/learning/master/rails/setup/mac/rails_setup_osx.sh
```


<br><br>

5) Perform the following command (change `script_name.sh` to the name of the file that you've just downloaded to your desktop):

```
$ chmod +x script_name.sh
$ ./script_name.sh
```

<br><br>

6) Follow the automation instructions. Please watch and stay tuned for the prompted inputs from time to time.

<br><br>

# Checking
After the installation is completed, you need to verify that all the settings are configured properly.

<br>

The script is a straight forward installation without feedback control. Hence, should there be any error during the installation (say rbenv was not installed properly), your Rails is considered **not** installed successfully / correctly.

<br>
There are 3 general checking steps you need to perform:

<br><br>
1) Check for successful installation within the Terminal after your automated installation is completed:

> Ubuntu / Linux: (you should see your Ruby and Rails is source from .rvm folder)

```
$ which ruby
/home/your_username/.rvm/rubies/ruby_version/bin/ruby
$ which rails
/home/your_username/.rvm/rubies/ruby_version/bin/rails
$
```

<br>
> Mac User: (you should see your Ruby and Rails is source from .rbenv folder)

```
$ which ruby
/Users/your_username/.rbenv/shims/ruby
$ which rails
/Users/your_username/.rbenv/shims/rails
$
```

<br><br>

2) Ensure Terminal always get the Ruby and Rails from correct source.

> Close the Terminal window and open a new one. Perform step #1 again.
> You should get the same result.

<br><br>

3) Generate a new Rails app.

Create a new Rails app and ensure it's working fine after step #1 and step #2.

```
$ rails new testing_app --database=postgresql
```


<br><br>
# Troubleshooting
If your installation failed, you can perform the following command to remove the existing contents (if any).

<br>
Ubuntu / Linux:

```
$ rvm implode
```

<br><br>
MAC OSX:

```
$ rm -rf ~/.rbenv
```

<br>
Once done, you can restart the script again or install Rails manually (instructions are available in the reference section below)

<br><br>

# References
## Mac
1. https://gorails.com/setup/osx/10.10-yosemite
2. http://railsapps.github.io/installrubyonrails-mac.html

## Ubuntu
1. https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-on-ubuntu-12-04-lts-precise-pangolin-with-rvm
2. https://gorails.com/setup/ubuntu/15.04
3. https://gorails.com/setup/ubuntu/14.10
4. https://help.ubuntu.com/lts/serverguide/ruby-on-rails.html
