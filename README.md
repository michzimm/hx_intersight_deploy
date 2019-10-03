# HyperFlex Deployment at Scale via Intersight API

[Docker Container Version 1.2]

## Purpose

Automatically generate multiple HyperFlex cluster profiles in Intersight from data provided in an excel spreadsheet.

## Supported Operating Systems

1. [Setup and Run on MAC OS X and Linux](#MAC-OS-X-and-Linux)
2. [Setup and Run on Microsoft Windows](#Microsoft-Windows)

## MAC OS X and Linux

### Setup

#### Step 1: Install Docker on your Local Machine

1. Install Docker on your system using the standard Docker installation procedure for your particular operating system.

   Documentation for installing Docker can be found here:
    * Ubuntu: https://docs.Docker.com/install/linux/Docker-ce/ubuntu/
    * CentOS: https://docs.Docker.com/install/linux/Docker-ce/centos/
    * MacOS: https://docs.Docker.com/Docker-for-mac/install/

#### Step 2: Pull Input Files to Local Machine

1. In the top right of the `michzimm/hx_intersight_deploy` repository on Github there is a green "Clone or Download" button. Click the "Clone or Download" button.

2. The resulting dropdown/popup box contains the URL for the `michzimm/hx_intersight_deploy` repository. Manually copy the URL text or simply click the clipboard icon to the right of the URL text to copy.

3. Navigate to a directory of your choice on your local machine where you would like to store the necessary files to run the hx_intersight_deploy tool.

4. Use the `git clone <copied repository_URL>` command to pull the input files from the repository to your local machine.

#### Step 3: Setup Intersight API Authentication File

**Note:** Intersight Essentials license is required to use the Intersight API.

1. Log into https://intersight.com.

2. in the upper right-hand corner, click the "Gear" icon and then on "Settings".

3. Under the "API" section, click on "API Keys".

4. In the upper-right, click "Generate API Key". (You can also use an existing API key if you already have one created)

5. Enter a "Description" (name) for the API key and click "Generate".

6. The resulting popup shows the unique API Key ID and Secret Key that were created. Keep this popup open for the subsequent steps.

7. In the `inputs` directory that was pulled from the Github repository on your local machine, locate and open the `auth` file with your favorite text editor.

8. Copy the `API Key ID` text in it's entirety from Intersight and insert into the `auth` file for the `api_key_id` value.

9. Save and close the `auth` file.

Sample `inputs/auth` file:

```
{
    "api_base_uri": "https://intersight.com/api/v1",
    "api_key_id": "XXXXXXX COPY YOUR API KEY ID HERE XXXXXXXXXXX",
    "api_private_key_file": "./inputs/SecretKey.txt"
}
```

10. In Intersight, use the `Save Secret Key to text file` button (to the right of the Secret Key text) to save the secret key file in the `inputs` directory that was pulled from the Github repository on your local machine.
11. You can now close the `Generate API Key` pop up window in Intersight.

#### Step 4: Fill-In HyperFlex Cluster Data into Spreadsheet

The included `input.xlsx` file in the "inputs" directory is the excel spreadsheet used to pass data to the Intersight API. Each row in the spreadsheet represents a new HyperFlex cluster profile which will be created. The `blue` and `green` color-coding represent data as well as overall policies which are either optional (`blue`) or mandatory (`green`). The data marked `orange` represents policy names, in other words what would you like to call the particular policy that will get created. If multiple HyperFlex cluster profiles will leverage the same policy, you only need to provide the policy name AND policy data for the first instance of the policy. For each subsequent cluster profile that will leverage the same policy, you simply need to enter the same policy name and leave the policy data blank.

### Run

1. Run the following command to start the Docker container:

```
docker run -it -v <inputs_dir_full_path>:/hx_intersight_deploy/inputs michzimm/hx_intersight_deploy:1.2
```
   * **Note:** <inputs_dir_full_path> = full path on your local machine to the `inputs` directory
   * **Note:** Your local machine must have access to the internet to pull container image from the public Docker hub registry.

   * **Example:** Let's say the `inputs` directory lives in `/Users/michzimm/` on my local machine...
   ```
   docker run -it -v /Users/michzimm/inputs:/hx_intersight_deploy/inputs michzimm/hx_intersight_deploy:1.2
   ```

2. Running the above `docker run -it ...` command will start the container, dump you into the container's CLI and automatically run the `./hx_intersight_deploy.py` script.

3. Select the operation to be performed:  
    * Claim HyperFlex Nodes in Intersight
    * Create HyperFlex Cluster Profiles in Intersight
    * Assign claimed HyperFlex nodes to HyperFlex Cluster Profiles in Intersight
    * All of the Above

4. Depending on the chosen option, you will be prompted for any required passwords and additional information.

5. Once the script completes, you will automatically exit the Docker container and the container will be stopped.


## Microsoft Windows

### Setup

#### Step 1: Install Docker on your Local Machine

1. Install Docker on your system using the standard Docker installation procedure for your particular operating system.

**Note:** Make sure you DO NOT select the option to only use Windows containers when installing Docker on Windows.

   Documentation for installing Docker can be found here:
    * Windows: https://docs.Docker.com/Docker-for-windows/install/

#### Step 2: Pull Input Files to Local Machine

1. In the top right of the `michzimm/hx_intersight_deploy` repository on Github there is a green "Clone or Download" button. Click the "Clone or Download" button.

2. Click the `Download ZIP` button to download the repository to your local system.

3. Navigate to the `downloads` directory on your local machine and unzip the `hx_intersight_deploy-master.zip` file.

#### Step 3: Setup Intersight API Authentication File

**Note:** Intersight Essentials license is required to use the Intersight API.

1. Log into https://intersight.com.

2. in the upper right-hand corner, click the "Gear" icon and then on "Settings".

3. Under the "API" section, click on "API Keys".

4. In the upper-right, click "Generate API Key". (You can also use an existing API key if you already have one created)
5. Enter a "Description" (name) for the API key and click "Generate".

6. The resulting popup shows the unique API Key ID and Secret Key that were created. Keep this popup open for the subsequent steps.

7. In the `inputs` directory that was pulled from the Github repository on your local machine, locate and open the `auth` file with your favorite text editor.

8. Copy the `API Key ID` text in it's entirety from Intersight and insert into the `auth` file for the `api_key_id` value.

9. Save and close the `auth` file.

Sample `inputs/auth` file:

```
{
    "api_base_uri": "https://intersight.com/api/v1",
    "api_key_id": "XXXXXXX COPY YOUR API KEY ID HERE XXXXXXXXXXX",
    "api_private_key_file": "./inputs/SecretKey.txt"
}
```

10. In Intersight, use the `Save Secret Key to text file` button (to the right of the Secret Key text) to save the secret key file in the `inputs` directory that was pulled from the Github repository on your local machine.

11. You can now close the `Generate API Key` pop up window in Intersight.

#### Step 4: Fill-In HyperFlex Cluster Data into Spreadsheet

The included `input.xlsx` file in the "inputs" directory is the excel spreadsheet used to pass data to the Intersight API. Each row in the spreadsheet represents a new HyperFlex cluster profile which will be created. The `blue` and `green` color-coding represent data as well as overall policies which are either optional (`blue`) or mandatory (`green`). The data marked `orange` represents policy names, in other words what would you like to call the particular policy that will get created. If multiple HyperFlex cluster profiles will leverage the same policy, you only need to provide the policy name AND policy data for the first instance of the policy. For each subsequent cluster profile that will leverage the same policy, you simply need to enter the same policy name and leave the policy data blank.

### Run

1. Open PowerShell.

**Note:** Depending on your user permissions, you may need to run PowerShell as an Administrator. To do so, right click on the PowerShell icon and select `Run as Administrator`.

2. On the PowerShell command line, run the following command to start the Docker container:

```
docker run -it -v <inputs_dir_full_path>:/hx_intersight_deploy/inputs michzimm/hx_intersight_deploy:1.2
```
**Note:** <inputs_dir_full_path> = full path on your local machine to the `inputs` directory
**Note:** Your local machine must have access to the internet to pull container image from the public Docker hub registry.

**Example:** Let's say the `inputs` directory lives in `C:/Users/michzimm/Downloads/` on my local machine...
   ```
   docker run -it -v C:/Users/michzimm/Downloads/inputs:/hx_intersight_deploy/inputs michzimm/hx_intersight_deploy:1.2
   ```

4. Depending on your Docker configuration, after running the `docker run -it ...` command you may see a windows popup saysing that Docker wants to access your local drive. Select `Share it` and then an additional popup window should appear asking for your credentials.

**Note:** Sometimes the popup window asking for credentials mentioned above appears behind the PowerShell window.

3. Running the above `docker run -it ...` command will start the container, dump you into the container's CLI and automatically run the `./hx_intersight_deploy.py` script.

4. Select the operation to be performed:  
    * Claim HyperFlex Nodes in Intersight
    * Create HyperFlex Cluster Profiles in Intersight
    * Assign claimed HyperFlex nodes to HyperFlex Cluster Profiles in Intersight
    * All of the Above

5. Depending on the chosen option, you will be prompted for any required passwords and additional information.

6. Once the script completes, you will automatically exit the Docker container and the container will be stopped.
