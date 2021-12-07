# Shell variables
green=`tput setaf 2 && tput bold`
black=`tput setaf 7 && tput bold`
reset=`tput sgr0`
autokey_version="0.95.10"

echo "${green}INSTALLING REQUIRED PACKAGES${reset}"
sudo apt -y install curl software-properties-common apt-transport-https flatpak ca-certificates gnupg lsb-release snapd

echo "${green}ADDING REQUIRED REPOS${reset}"
# Brave
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
# docker ce
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo add-apt-repository -y ppa:hluk/copyq
sudo add-apt-repository -y ppa:agornostal/ulauncher
echo "${reset}Updating packages!"
sudo apt update

echo "${green}INSTALLING SOFTWARES${reset}"
echo "${black}BRAVE BROWSER${reset}"
sudo apt install -y brave-browser
echo "${black}CopyQ${reset}"
sudo apt install -y copyq
echo "${black}Ulauncher${reset}"
sudo apt install -y ulauncher
echo "${black}VSCode${reset}"
flatpak install -y flathub com.visualstudio.code
echo "${black}Steam${reset}"
flatpak install -y flathub com.valvesoftware.Steam
echo "${black}Autokey${reset}"
wget -O autokey-common.deb https://github.com/autokey/autokey/releases/download/v${autokey_version}/autokey-common_${autokey_version}-0_all.deb
wget -O autokey-gtk.deb https://github.com/autokey/autokey/releases/download/v${autokey_version}/autokey-gtk_${autokey_version}-0_all.deb
sudo dpkg --install autokey-common.deb autokey-gtk.deb
sudo apt -y --fix-broken install
rm autokey-*.deb
echo "${black}Docker${reset}"
sudo apt-get install docker-ce docker-ce-cli
echo "${black}Docker-compose${reset}"
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
echo "${black}Docker-compose${reset}"
snap install authy

echo "${green}Versions${reset}"
brave-browser --version
copyq --version
ulauncher --version
code --version
autokey --version
sudo docker --version
sudo docker-compose --version
