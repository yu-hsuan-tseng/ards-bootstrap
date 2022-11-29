#!/bin/sh
# Bootstrap will clone all the repository needed for you 

echo "Start bootstrap ... \n"

clone_ccil(){
    echo "cloning ccil_vwd ... \n"
    
	git clone git@github.com:jyadams/ccil_vwd.git
	
	echo "ccil_vwd download finished !! \n"
}

clone_ventmap(){
    echo "cloning ventMAP ... \n" 
	
	git clone git@github.com:yu-hsuan-tseng/ventMAP.git
	
	echo "ventMAP download finished !! \n"
}

transfer_data(){
	mkdir -p ccil_vwd/dataset/experiment1/all_data/raw
    
	echo "transferring data from database ... \n"
    
	cd ccil_vwd
	source activate ards
	python transfer_data.py --data-path ccil_vwd/dataset/experiment1/all_data/raw/ --cohort-description ccil_vwd/dataset/cohort-description.csv

	echo "transferring data finished !! \n"
}

clone_ccil
clone_ventmap
transfer_data

echo "Boostrap finished !!"
