
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

#  MANUALLY SELECTING A REGION

If you find that your transcoder is being connected to an incorrect region, you can select a different one by adding a flag to the transcoder config.

**DISCLAIMER:** Always be careful editing your transcoder config, as adding an incorrect flag or removing neccessary flags can break your transcoder.

1. Edit ```videominer.service```:
```
nano /etc/systemd/system/videominer.service
```

2. Append one of the following to the end of the “ExecStart” line (make sure to add a space before adding the flag).

```
-orchAddr=Orch-us-east.video-miner.xyz
-orchAddr=Orch-us-west.video-miner.xyz
-orchAddr=Orch-eu-central.video-miner.xyz
```
3. Save and close ```videominer.sevice```

4. Reload systemd manager configuration:
```
systemctl daemon-reload
```

5. Restart ```videominer.service``` for changes to take effect:
```
systemctl restart videominer.service
```
#  MANUALLY SELECTING A GPU

If you would like to allocate a specific GPU to Video Miner, you can do so by adding another flag to the transcoder config.

1. Edit ```videominer.service```:
```
nano /etc/systemd/system/videominer.service
```

2. Append the following to the end of the “ExecStart” line (make sure to add a space before adding the flag).
```
-nvidia <id>
```

3. To find the ID of your GPU's, in a new terminal type ```nvidia-smi```.

The correct syntax for the flag is ```-nvidia 0```, or ```-nvidia 1```, depending on the GPU you'd like to use. You can also specify multiple GPU's with ```-nvidia 0,1,2```.

4. Save and close ```videominer.sevice```

5. Reload systemd manager configuration:
```
systemctl daemon-reload
```

6. Restart ```videominer.service``` for changes to take effect:
```
systemctl restart videominer.service
```
