# HyperFlex Deployment at Scale through Intersight aka "hx_intersight_deploy"

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
7. Copy the "API Key ID" and insert into the "auth" file (on your local machine) for the "api_key_id" value.
8. Copy the "Secret Key" into a file on your local machine.
9. Add the path to the "Secret Key" file in the "auth" file (on your local machine) for the "api_private_key_file" value.

Example "auth" file:

```
{
    "api_base_uri": "https://intersight.com/api/v1",
    "api_key_id": "<api_key_id>",
    "api_private_key_file": "<path_to_private_key_file"
}
```

## Run Script

1. Run 

## Example
