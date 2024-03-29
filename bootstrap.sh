#!/bin/sh
# Bootstrap will clone all the repository needed for you 

echo "Start ards bootstrap ..."
#TODO more simplify processing

# Clone ccil_vwd repo to run transfer_data.py
clone_ccil(){
    # TODO ccil_vwd is a private repository, we might need to pre-configure your git to fulfill that
    if [ -d "../ccil_vwd" ]
    then
      echo "ccil_vwd already exists"
      cd ..
    else
      echo "cloning ccil_vwd ..." 
      cd ..
      git clone git@github.com:jyadams/ccil_vwd.git
      echo "ccil_vwd download finished !!"
    fi
}

# Clone ventMap software to run data preprocessing
clone_ventmap(){
    if [ -d "ventMAP" ] 
    then
      echo "ventMap already exists"
    else
      echo "cloning ventMAP ..." 
      git clone git@github.com:yu-hsuan-tseng/ventMAP.git
      echo "ventMAP download finished !!"
    fi
}

# Transfer data from server to local
transfer_data(){
    echo "transferring data from database ..."
    cd ccil_vwd
    conda env create -f environment.yml
    conda activate ards

    # install ventparliament
    cd ..
    git clone https://github.com/hahnicity/ventparliament.git
    cd ventparliament
    conda env update --file environment.yml --name ards
    pip install -e .

    # go back to ardsdetection code
    cd ../ccil_vwd
    
    if [ ! -d "anon_dataset" ] && [ ! -d "unanon_dataset" ]
    then
      mkdir -p anon_dataset/experiment1/all_data/raw
      mkdir -p unanon_dataset/experiment1/all_data/raw
    else
      echo "folder already exists"
    fi
    mv ../cohort-description.csv unanon_dataset/
    source activate ards
    python transfer_data.py --data-path unanon_dataset/experiment1/all_data/raw/ --cohort-description unanon_dataset/cohort-description.csv
    # Due to phi, we cannot keep the unanonymized dataset
    rm -rf unanon_dataset/

    echo "transferring data finished !!"
}

anonymize_data(){
    echo "Please specify your data path in ventMAP/default.yaml if needed !!"
    cd ../ventMAP 
    sh anonymize_cohort.sh 
}

clone_ccil
clone_ventmap
transfer_data
anonymize_data

echo "Boostrap finished !!"
