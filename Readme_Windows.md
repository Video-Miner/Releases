
# INSTALLING 

**Note:** The installer Wizard contains its own set of instructions to help you get started. Use this Readme if you run into issues.

1. Extract the downloaded ZIP file. Right-click and choose Extract All from the menu. 

2. Double click VideoMiner.msi and select Run Anyway if prompted.

3. Click Next.

4. Accept License Agreement and click Next.

5. To accept the default installation directory click Next.

6. Enter your details. Please make sure these are correct.
    * 6a. Enter the ETH address you want payments sent to.
    * 6b. Enter your authentication Token (If you don’t have a token reach out to us on Discord or Email).
    * 6c. Enter the ID of the GPU(s) you'd like to allocate to the pool. Click GPU Help to find your GPU ID.
    * 6d. Select your desired stream capacity (up to 10) from the dropdown.

7. Click Next. 

8. Click Install.

9. Click Yes to Allow App to make changes.

11. Click Show Logs to view the Video Miner process. If you see ```Waiting for segments```, the install completed successfully. If you see ```...H.264 not supported on hardware```, click Patching App to begin patching your GPU(s) manually.

The installer will create start menu shortcuts named Start Video Miner Pool, Stop Video Miner Pool, and View Video Miner Pool Logs. We recommend pinning these for easy access. 

## MANUALLY PATCHING

1. You can find the patching app in ```C:\Program Files\Video Miner Pool\```

2. Run ApplyPatch.exe

3. Click Yes to Allow App to make changes.

4. Find your Nvidia DLL. There should be a field populated with ```C:\WINDOWS\system32\nvEncodeAPI64.dll```. If not, choose Browse for Nvidia DLL and find nvEncodeAPI64.dll in ```C:\WINDOWS\system32\```.

5. Download the correct patch for your driver version. By default, the patch program will attempt to detect the correct patch and place the URL in the field next to Download Patch. 
    * 5a. Click Download Patch. If you receive an error stating your patch could not be found, or if the field is empty, proceed to step 7.

6. Click Apply Patch.

7. If you receive an error, you'll need to manually find the correct patch for your drivers. This is common when using Studio drivers. In the patching app, you should see your driver version listed.
    * 7a. Go to https://github.com/keylase/nvidia-patch/tree/master/win
    * 7b. Press ctrl+F to open a search, and search for your driver version
    * 7c. Right-click on the corresponding library patch, and click copy link address. **Make sure to choose the x64 library patch.**
    * 7d. Paste the link into the field next to Download Patch. 
    * 7e. Click Download Patch.
    * 7f. Click Apply Patch.


If you encounter additional errors, join the Video Miner Discord server for support:

https://discord.gg/bmtfrh9Vx6



#  UPDATING TO A NEW RELEASE         

1. Click the ```Stop Video Miner Pool``` shortcut in the start menu.

2. Run VideoMiner.msi as Admin and install Video Miner. This will download the newest release. If asked to uninstall first, follow the steps to do so and run the installer again to reinstall Video Miner with the latest version. 

#  MANUALLY SELECTING A REGION

If you find that your transcoder is being connected to an incorrect region, you can select a different one by adding a flag to the transcoder config.

**DISCLAIMER:** Always be careful editing your transcoder config, as adding an incorrect flag or removing neccessary flags can break your transcoder.

1. Open the Registry Editor by typing Registry Editor in the Windows search box.
 
2. Paste the following into the navigation bar in the Editor:
```
Computer\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\videominerSvc\Parameters
```
3. Right click on “App Parameters” and choose “Modify” from the pop up menu.

5. Append one of the following to the “Value Data” field (make sure to add a space before adding the flag).

```
-orchAddr=Orch-us-east.video-miner.xyz
-orchAddr=Orch-us-west.video-miner.xyz
-orchAddr=Orch-eu-central.video-miner.xyz
```
6. Click “OK”

7. Stop and restart the service using the shortcuts in the Video Miner directory (or start menu) for changes to take effect.
