# NOTICE
# This script is meant for auto-run. If you want to learn, please learn BASH script. Thank you.

function install_postgresql {
	echo '== Install Postgresql =='

	user=$1

	sudo apt-get update -y
	sudo apt-get install -y postgresql-common postgresql-contrib
	sudo apt-get install -y postgresql libpq-dev

	# Setup user for Postgresql
	sudo -u postgres createuser $user -s
	sudo -u postgres psql --command "\\password $user"

	# Run the setup
	service postgresql start
	sudo update-rc.d postgresql enable

	echo '[ COMPLETED ]'
}


function setup_ssh {
	SSH_PATH=~/.ssh

	if [ -a $SSH_PATH ]; then
		mkdir $SSH_PATH
	fi

	ssh-keygen -t rsa -N "" -f $SSH_PATH/id_rsa
	ssh-add $SSH_PATH/id_rsa
}

function install_dependencies {
	sudo apt-get update -y
	sudo apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev libgmp3-dev
}

function install_rvm {
	sudo apt-get install -y libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
	gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
	curl -L https://get.rvm.io | bash -s stable
	source ~/.rvm/scripts/rvm

	rvm_path='source ~/.rvm/scripts/rvm'
	echo $rvm_path >> ~/.bashrc
	echo $rvm_path >> ~/.zshrc
}

function install_ruby {
	version=$1

	rvm install $version
	rvm use $version --default
}

function install_bundler {
	echo "gem: --no-ri --no-rdoc" > ~/.gemrc
	gem install bundler
}

function setup_git {
	username=$1
	email=$2

	git config --global color.ui true
	git config --global user.name $username
	git config --global user.email $email
	git config --global push.default matching
}

function install_rails {
	sudo apt-get update -y
	sudo apt-get install -y nodejs
	gem install rails
}


# Welcome Printout
echo "==================================="
echo " Welcome to Rails Automation Tool  "
echo " brought to you by:                "
echo " hollowaykeanho@gmail.com          "
echo "==================================="
echo ""

# Inquire input
echo "-----------------------------------"
echo "| Inquire Input                   |"
echo "-----------------------------------"
echo ""

echo -n "Your Name For Github Signature (Supply a string with \"\"): "
read user_username
echo -n "Your Email For Github Signature (Supply a string with \"\"): "
read user_email


# Inquire Ruby Version to be installed
OPTIONS="2.2.4 2.2.3"
echo "Please select your desired ruby version option. "
select opt in $OPTIONS; do
	case $opt in
		"2.2.4")
			ruby_version=2.2.4
			break
			;;
		"2.2.3")
			ruby_version=2.2.3
			break
			;;
		*)
			echo "select option: invalid option"
			;;
	esac
done

install_postgresql $USER

echo "==================================================="
echo "Inquiry completed. Press Enter to begin automation."
echo "==================================================="
read temp

setup_ssh $user_email
install_dependencies
install_rvm
install_ruby $ruby_version
install_bundler
setup_git $user_username $user_email
install_rails

# Done
source ~/.bashrc
echo "Setup Completed."
echo "Close the terminal and open a new one."
echo "You should be able to use ruby from your local version. Type: "
echo "'which ruby' to verify the source file."
