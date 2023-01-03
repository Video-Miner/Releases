
# INSTALLING 

**Note:** The installer Wizard contains its own set of instructions to help you get started. Use this Readme if you run into issues.

1. Extract the downloaded ZIP file. Right-click and choose Extract All from the menu. 

2. Double click VideoMiner.msi and select Run Anyway if prompted.

3. Click Next.

4. Accept License Agreement and click Next.

5. To accept the default installation directory click Next.

6. Enter your details. Please make sure these are correct.
    * 6a. Enter the ETH address you want payments sent to
    * 6b. Authentication Token (If you don’t have a token reach out to us on Discord or Email)

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

2. Run VideoMiner.msi as Admin and install Video Miner. This will download the newest release. 
