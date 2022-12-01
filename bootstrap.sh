#!/bin/sh
# Bootstrap will clone all the repository needed for you 

echo "Start bootstrap ..."

clone_ccil(){
    echo "cloning ccil_vwd ..."
    git clone git@github.com:jyadams/ccil_vwd.git
    echo "ccil_vwd download finished !!"
}

clone_ventmap(){
    echo "cloning ventMAP ..." 
    git clone git@github.com:yu-hsuan-tseng/ventMAP.git
    echo "ventMAP download finished !!"
}

transfer_data(){
    echo "transferring data from database ..."
    cd ccil_vwd
    mkdir -p anon_dataset/experiment1/all_data/raw
    mkdir -p unanon_dataset/experiment1/all_data/raw
    mv ../cohort-description.csv unanon_dataset/
    source activate ards
    # TODO add sudo handling to avoid password request
    python transfer_data.py --data-path unanon_dataset/experiment1/all_data/raw/ --cohort-description unanon_dataset/cohort-description.csv
    echo "transferring data finished !!"
}

clone_ccil
clone_ventmap
transfer_data

echo "Boostrap finished !!"
