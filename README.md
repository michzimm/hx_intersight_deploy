# HyperFlex Deployment at Scale via Intersight API

[Docker Container Version]

## Purpose

Automatically generate multiple HyperFlex cluster profiles in Intersight from data provided in an excel spreadsheet.

## MAC OS X and Linux Systems

### Setup

#### Step 1: Install Docker on your Local Machine

1. Install docker on your system using the standard docker installation procedure for your particular operating system.

   Documentation for installing docker can be found here:
    * Ubuntu: https://docs.docker.com/install/linux/docker-ce/ubuntu/
    * CentOS: https://docs.docker.com/install/linux/docker-ce/centos/
    * Windows: https://docs.docker.com/docker-for-windows/install/
    * MacOS: https://docs.docker.com/docker-for-mac/install/

#### Step 2: Pull Input Files to Local Machine

1. Use the green "Clone or Download" button in the `michzimm/hx_intersight_deploy` repository on Github to copy the repository's URL.
2. Navigate to a directory of your choice on your local machine where you would like to store the necessary input files.
3. Use the `git clone <repository_URL>` command to pull the input files from the repository.

#### Step 3: Setup Intersight API Authentication File

1. Log into https://intersight.com.
2. in the upper right-hand corner, click the "Gear" icon and then on "Settings".
3. Under the "API" section, click on "API Keys".
4. In the upper-right, click "Generate API Key". (You can also use an existing API key if you already have one created)
5. Enter a "Description" (name) for the API key and click "Generate".
6. The resulting popup shows the unique API Key ID and Secret Key that were created. Keep this popup open for the subsequent steps.
7. In the `inputs` directory that was pulled from the Github repository on your local machine, locate and open the `auth` file with your favorite text editor.
8. Copy the "API Key ID" text in it's entirety from Intersight and insert into the `auth` file for the `api_key_id` value.
9. Save and close the `auth` file.

Sample `inputs/auth` file:

```
{
    "api_base_uri": "https://intersight.com/api/v1",
    "api_key_id": "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
    "api_private_key_file": "./inputs/private_key"
}
```

10. In the `inputs` directory that was pulled from the Github repository on your local machine, locate and open the `private_key` file with your favorite text editor.
11. Copy the "Secret Key" text in it's entirety from Intersight into the empty `private_key` file.
12. Save and close the `private_key` file.

Sample `inputs/private_key` file

```
-----BEGIN RSA PRIVATE KEY-----
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
-----END RSA PRIVATE KEY-----
```


#### Step 4: Fill-In HyperFlex Cluster Data into Spreadsheet

The included `input.xlsx` file in the "inputs" directory is the excel spreadsheet used to pass data to the Intersight API. Each row in the spreadsheet represents a new HyperFlex cluster profile which will be created. The `blue` and `green` color-coding represent data as well as overall policies which are either optional (`blue`) or mandatory (`green`). The data marked `orange` represents policy names, in other words what would you like to call the particular policy that will get created. If multiple HyperFlex cluster profiles will leverage the same policy, you only need to provide the policy name AND policy data for the first instance of the policy. For each subsequent cluster profile that will leverage the same policy, you simply need to enter the same policy name and leave the policy data blank.

### Run

#### Step 1: Deploy the HX_Intersight_Deploy Container

1. Run the following command to start the docker container:

```
docker run -it -v <inputs_dir_full_path>:/hx_intersight_deploy/inputs michzimm/hx_intersight_deploy:1.0 /bin/bash
```
   * NOTE: <inputs_dir_full_path> = full path on your local machine to the `inputs` directory
   * NOTE: Requires access to internet to pull container image from docker hub.


#### Step 2: Run Script
1. Running the above `docker run -it ...` command will start the container and dump you into the containers' CLI. From the container's CLI, run `./hx_intersight_deploy.py`.
2. Select the operation to be performed:
   1. Claim HyperFlex Nodes in Intersight
   2. Create HyperFlex Cluster Profiles in Intersight
   3. Assign claimed HyperFlex nodes to HyperFlex Cluster Profiles in Intersight
3. Depending on the chosen option, you will be prompted for any required passwords and additional information.
4. Once the script completes, type `exit` to exit the Docker container. The Docker container will automatically stop upon exiting.
