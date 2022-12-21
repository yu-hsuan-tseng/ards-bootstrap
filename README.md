# ards-bootstrap

## Introduction
`ards-bootstrap` is to kickoff ards project. By default, you will get unanonymized dataset after your run `ards-bootstrap`

## Prerequisite
Remember to put cohort-description.csv to this repository before you run shellscript

file should be named as `cohort-description.csv` and store it in ards-bootstrap directory `./`

Moreover, we are cloning private repository. Please add your `ssh key` to Github UI. 

`ssh-keygen`

`cat ~/.ssh/id_rsa.pub`


| Patient Unique Identifier | Date when Berlin criteria first met (m/dd/yyyy) | vent_start_time  | experiment_group | Pathophysiology | Potential Enrollment  
| :---:| :---: | :---: | :---: | :---: | :---: 
|00rpi001|2047-05-03 17:46:00 |2022-01-03 07:16:00 | 1 | ARDS | Y                             



## Run bootstrap
`sh bootstrap.sh` 

## Automatically run shell script syntax check

In `github workflow`, we will run syntax script check everytime you commit to your pull_request
