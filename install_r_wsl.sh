sudo apt update
wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo apt-key add -
sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"
sudo apt install r-base r-base-dev -y
wget https://download1.rstudio.org/electron/jammy/amd64/rstudio-2024.12.1-563-amd64-debian.tar.gz
tar xvzf rstudio-2024.12.1-563-amd64-debian.tar.gz
cd rstudio-2024.12.1+563/
sudo apt-get install libnss3
sudo apt-get install libasound2t64
nohup ./rstudio &

 