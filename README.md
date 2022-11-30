# minecraft

create Downloads folder
file path /home/yourusername/Downloads

create server folder
file path /home/yourusername/server

have all your minecraft server files within the server folder

the mcupdate.sh will be in the home folder
filepath /home/yourusername

the minecraft-start.service file will need to be in
file path /etc/systemd/system

also you need to edit this file replace yourusername in the working dir line with youras well as the user and ExecStart.

the run command
sudo systemctl enable minecraft-start.service
then reboot system

to get to the minecraft screen after boot "screeen UbuntuMinecraft"
