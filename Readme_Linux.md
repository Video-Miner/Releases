
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

4. Follow the prompts:
    * 4a. Enter the ETH address you want payments sent to.
    * 4b. Enter your authentication Token (If you don’t have a token reach out to us on Discord or Email).
    * 4c. Enter the ID of the GPU(s) you'd like to allocate to the pool. Click GPU Help to find your GPU ID.
    * 4d. Input your desired stream capacity (up to 10).

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

If you would like to allocate a specific GPU to Video Miner without having to re-run the install script, you can do so by adding another flag to the transcoder config.

1. Edit ```videominer.service```:
```
nano /etc/systemd/system/videominer.service
```

2. Append the following to the end of the “ExecStart” line (make sure to add a space before adding the flag).
```
-nvidia <id>
```

The correct syntax for the flag is ```-nvidia 0```, or ```-nvidia 1```, depending on the GPU you'd like to use. You can also specify multiple GPU's with ```-nvidia 0,1,2```.

3. To find the ID of your GPU's, in a new terminal type ```nvidia-smi```.


4. Save and close ```videominer.sevice```

5. Reload systemd manager configuration:
```
systemctl daemon-reload
```

6. Restart ```videominer.service``` for changes to take effect:
```
systemctl restart videominer.service
```

# Containerized Operation (Experimental)

Within this repository, you'll discover a [Dockerfile](Dockerfile) and [docker-compose.yml](docker-compose.yml) file, offering a method to encapsulate the video-miner pool within a Docker container. It's essential to note that this configuration is still in the experimental phase and isn't recommended for production environments. Should you choose to embark on this journey, adhere to the following guidelines:

1. **Docker Deployment**: Commence by installing Docker on your Linux machine. For guidance, refer to the [official Docker installation documentation](https://docs.docker.com/engine/install/ubuntu/).

2. **Nvidia Container Toolkit Integration**: Ensure your system is fortified with the [Nvidia container toolkit](https://github.com/NVIDIA/nvidia-container-toolkit).

3. **Image Construction**: Execute the subsequent command to construct the Docker image:

```bash
docker build -t video-miner-pool .
```

4. **Container Launch**: Initiate the container using the following command. Remember to substitute `<ETH_ADDRESS>` with your Ethereum address, `<NICKNAME>` with your designated identifier and `<MAX_SESSIONS>` with your desired session count:

```bash
docker run --runtime nvidia video-miner-pool -ethAcctAddr <ETH_ADDRESS> -orchSecret <ORCH_SECRET> -maxSessions <MAX_SESSIONS>
```

 > \[!NOTE]
 > If a discreet background operation suits your preferences, orchestrate it via Docker Compose:
>
>```bash
>docker compose up -d
>```
>
> During this process, update the [docker-compose.yml](docker-compose.yml) file with your precise ETH address, orchestrator secret and max sessions count.
