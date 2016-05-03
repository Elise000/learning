# NOTICE
# This script is meant for auto-run. If you want to learn, please learn BASH script. Thank you.

function xcode_agreement {
	echo "== Setup Xcode Agreement =="
	sudo xcodebuild -license
	echo "[ COMPLETED ]"
}


function install_homebrew {
	echo "== Installing Homebrew =="
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	echo "[ COMPLETED ]"
}

function install_rbenv {
	echo "== Installing Rbenv =="
	brew install rbenv ruby-build

	# Add rbenv to bash so that it loads every time you open a terminal
	echo -n 'adding rbenv to bash_profile for autoloading... '
	echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile
	echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.zshrc
	source ~/.bash_profile
	echo '[ DONE ]'
	echo ''

	echo "[ COMPLETED ]"
}


function install_ruby {
	echo '== Installing Ruby =='
	# Process name
	echo -n "Processing input for setup... "
	local version=$1
	echo "[ DONE ]"

	# Install Ruby
	echo -n "Installing ruby $version... "
	rbenv install $version
	rbenv global $version
	echo '[ DONE ]'

	echo '[ COMPLETED ]'
}


function install_git {
	echo '== Installing GIT =='

	# Installation Notice
	brew install git

	# Process name
	echo -n "Processing input for setup... "
	local username=$1
	local email=$2
	echo "[ DONE ]"

	# Setup Git
	echo -n "Setting up Global Settings... "
	git config --global color.ui true
	git config --global user.name $username
	git config --global user.email $email
	git config --global push.default matching
	echo "[ DONE ]"

	echo '[ COMPLETED ]'
}


function setup_ssh {
	echo '== Setting Up SSH =='
	SSH_PATH=~/.ssh

	if [ -a $SSH_PATH ]; then
		mkdir $SSH_PATH
	fi

	ssh-keygen -t rsa -N "" -f $SSH_PATH/id_rsa
	ssh-add $SSH_PATH/id_rsa

	echo '[ COMPLETED ]'
}


function setup_rails {
	echo '== Setup Rails =='
	gem install rails

	echo -n "Allows rbenv to learn rails existence... "
	rbenv rehash
	echo '[ DONE ]'

	echo '[ COMPLETED ]'
}


function setup_postgresql {
	echo '== Install Postgresql =='

	echo -n 'Install postgresql software... '
	# Installation
	brew install postgresql
	echo '[ DONE ]'

	echo -n 'Add a launchd to start postgresql at login... '
	# To have launchd start postgresql at login
	ln -sfv /usr/local/opt/postgresql/*plist ~/Library/LaunchAgents
	echo '[ DONE ]'

	echo -n 'Launch the postgresql now... '
	# Then to load postgresql now:
	launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
	echo '[ DONE ]'
	echo ''

	echo '[ COMPLETED ]'
}


################################
# Driver Code
################################
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
OPTIONS="2.2.3 2.2.4"
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

OPTIONS="YES NO"
echo "Have you install XCode from Apple Store and AGREED TO LICENSE?"
select opt in $OPTIONS; do
	case $opt in
		"YES")
			echo "good."
			break
			;;
		"NO")
			echo "automation will not work without xcode."
			echo "please go to app store and install Xcode now."
			echo "---------------------------------------------"
			echo "Press ENTER after you've installed Xcode successfully."
			read temp
			xcode_agreement
			break
			;;
		*)
			echo "select option: invalid Option."
	esac
done

# Install Brew to ensure it's working
echo "-----------------------------------"
echo "| Setup Interatives softwares     |"
echo "-----------------------------------"
echo ""
install_homebrew
setup_ssh $user_email

echo "==================================================="
echo "Inquiry completed. Press Enter to begin automation."
echo "==================================================="
read temp

install_rbenv
install_ruby $ruby_version
install_git $user_username $user_email
setup_rails
setup_postgresql

# Done
source ~/.bash_profile
echo "Setup Completed. You should try generating a rails app to it test out."
