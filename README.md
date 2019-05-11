# HyperFlex Deployment at Scale via Intersight API

## Purpose

Automatically generate multiple HyperFlex cluster profiles in Intersight from data provided in an excel spreadsheet.

## Installation

Recommended to use a virtual environment, but not mandatory.

1. Install python2.7
2. Install pip
3. Pull the "hx_intersight_deploy" repository to your local machine.
4. Using the provided "requirements.txt" file, run `pip install -r requirements.txt`.

## Setup

1. Log into https://intersight.com.
2. in the upper right-hand corner, click the "Gear" icon and then on "Settings".
3. Under the "API" section, click on "API Keys".
4. In the upper-right, click "Generate API Key". (You can also use an existing API key if you already have one created)
5. Enter a "Descripton" (name) for the API key and click "Generate".
6. The resulting popup shows the unique API Key ID and Secret Key that were created.
7. Copy the "API Key ID" text in it's entirety and insert into the "auth" file (on your local machine) for the "api_key_id" value.
8. Copy the "Secret Key" text in it's entirety into a file on your local machine.
9. Add the path to the "Secret Key" file in the "auth" file (on your local machine) for the "api_private_key_file" value.

Example "auth" file:

```
{
    "api_base_uri": "https://intersight.com/api/v1",
    "api_key_id": "<api_key_id>",
    "api_private_key_file": "<path_to_private_key_file"
}
```

## Input File

The included `input.xlsx` file is the excel spreadsheet used to pass data to the Intersight API. Each row in the spreadsheet represents a new HyperFlex cluster profile which will be created. The `blue` and `green` color-coding represent data as well as overall policies which are either optional (`blue`) or mandatory (`green`). The data marked `orange` represents policy names, in other words what would you like to call the particular policy that will get created. If multiple HyperFlex cluster profiles will leverage the same policy, you only need to provide the policy name AND policy data for the first instance of the policy. For each subsequent cluster profile that will leverage the same policy, you simply need to enter the same policy name and leave the policy data blank.

## Run Script

1. Run `hx_intersight_deploy.py -a auth -f ./input.xlsx`.
2. Select the operation to be performed:
   1. Claim HyperFlex Nodes in Intersight
   2. Create HyperFlex Cluster Profiles in Intersight
   3. Assign claimed HyperFlex nodes to HyperFlex Cluster Profiles in Intersight
3. Depending on the chosen option, you will be prompted for any required passwords
