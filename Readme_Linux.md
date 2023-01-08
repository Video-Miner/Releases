
# INSTALLING 

**Note:** If not running as root use ```sudo``` to run commands with elevated permissions.

1. Patch your Nvidia GPU(s) to enable transcoding:  
```
wget https://raw.githubusercontent.com/keylase/nvidia-patch/master/patch.sh
chmod a+x ./patch.sh
./patch.sh
```
2. Make sure you have the correct dependencies installed:
```
apt install jq
apt install unzip
apt install curl
```
3. Begin the Video Miner installation:
```
sudo su -c "bash <(curl -fsSL `curl -s https://api.github.com/repos/Video-Miner/Releases/releases/latest | grep browser_download_url | grep \"/install_videominer.sh\" | cut -d '\"' -f 4`)" root
```
**Disclaimer:** The above command will automatically run the install script. You can find the script [here](<https://github.com/Video-Miner/Releases/releases/latest>) if you prefer to run it manually. 

4. When prompted, enter your ETH address and authorization token.

5. Once completed, `CTRL+C` to exit the installer. Make sure you see the status of the service before exiting to avoid closing during the installation process.

6. To check that your transcoder is working correctly, tail the logs by running this command: 
```
journalctl -u videominer -n 500 -f
```

If you see `Waiting for segments`, the install completed successfully.

If you encounter errors, join the Video Miner Discord server for support:

https://discord.gg/bmtfrh9Vx6



#  UPDATING TO A NEW RELEASE         


1. To modify or update Video Miner, run the same command listed above and navigate through the prompts:
```
sudo su -c "bash <(curl -fsSL `curl -s https://api.github.com/repos/Video-Miner/Releases/releases/latest | grep browser_download_url | grep \"/install_videominer.sh\" | cut -d '\"' -f 4`)" root
```
2. Check the logs:
```
journalctl -u videominer -n 500 -f
```

#  UNINSTALLING

1. To uninstall Video Miner, run the uninstall script:
```
sudo su -c "bash <(curl -fsSL `curl -s https://api.github.com/repos/Video-Miner/Releases/releases/latest | grep browser_download_url | grep \"/uninstall_videominer.sh\" | cut -d '\"' -f 4`)" root
```
