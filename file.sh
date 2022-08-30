#! /bin/bash



if [[ $1 == "remove" ]]; then
	if sudo apt -y remove atom > /dev/null ; then
		echo "Atom succesfuly removed"
		exit 0
	fi
	echo "I cannot remove atom, check please"
	exit 1
fi

if  command -v atom ; then
	echo "Atom already instaled in a system"
	echo "You can delete it like by runnig: ./${0##*/} remove"
	exit 0
fi

echo "Atom not found in a system, downloading a instalation file"
downloadLink="https://github.com/atom/atom/releases/download/v1.60.0/atom-amd64.deb"
atomInstalationFile="Atom.deb"
cd /tmp/
echo "Trying to download instalation file from:"
echo $downloadLink

wget -qO $atomInstalationFile $downloadLink
if wget -qO $atomInstalationFile $downloadLink; then
	echo "The packege downloaded, tryin to install it "
fi

sudo dpkg -i $atomInstalationFile > /dev/null
if [[ $? -eq 1 ]]; then

	echo "Error while instaling $atomInstalationFile"
else
	sudo rm $atomInstalationFile
	echo "Atom successfuly downloaded. It\`s binaries locate at: "
	echo $(which atom)
fi
Have a nice day
