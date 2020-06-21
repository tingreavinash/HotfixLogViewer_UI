# Instagram Chat Reader

## Description

This application will read the ***messages.json*** file which you get in Instagram data backup and displayes the converstation on webpage at given port.

## How To Use

1. Using ***application.yml*** file:
    - Specify the instagram user id in place of for property `participant`
    - Specify the location of ***messages.json*** file in property `messageFile`

2. Using command line argument:
    - While running application, provide the argument `--participant_id=<insta_user_id>` 
    - Specify the location of `messages.json` file in ***application.yml*** file
