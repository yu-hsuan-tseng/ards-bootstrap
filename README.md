# ards-bootstrap

## Introduction
`ards-bootstrap` is to kickoff ards project

## Prerequisite
Remember to put cohort-description.csv to this repository before you run shellscript

file should be named as `cohort-description.csv`

| Patient Unique Identifier | Date when Berlin criteria first met (m/dd/yyyy) | vent_start_time  | experiment_group | Pathophysiology | Potential Enrollment  
| :---:| :---: | :---: | :---: | :---: | :---: 
|00rpi001|2047-05-03 17:46:00 |2022-01-03 07:16:00 | 1 | ARDS | "Y"                            



## Run bootstrap
`sh bootstrap.sh` 

Note: You are very likely to face an issue where terminal keep asking you for password. I will address this issue in the future.
