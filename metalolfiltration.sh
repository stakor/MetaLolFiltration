#!/bin/bash

# metalolfiltration.sh
# Wraper Script for the core_lol.py script

# Set Path
script_name=$0
script_full_path=$(dirname "$0")


for arg in "$@"
do
    if [ "$arg" == "--help" ] || [ "$arg" == "-h" ]
    then
        ## Help Routine
        echo "Help argument detected."
        echo "$0 -e <file_name_to_encode> <encoding_table>"
        echo "$0 -e test.file (lol|kahn|etc)"
        echo "$0 -d <file_name_to_decode> <encoding_table>"
        echo "$0 -d test.file (lol|kahn|etc...)"
        exit
    elif [ "$arg" == "-d" ]
    then
        ## Decode MetaLolfiltrated File
        exfil_file=`echo $2 | sed "s/.$3$//"`
        #exfil_file=`echo $2 | sed "s/.$3$//"`
        #exfil_file=`echo $2 | sed 's/\.lol$//'`
        echo "Converting MetaLolFiltrated File into base64: $exfil_file"
        $script_full_path/core_lol.py -t table_$3 -d $exfil_file.$3 $exfil_file.64
        echo "Converting $exfil_file.64 into original binary file: $exfil_file"
        base64 --decode $exfil_file.64 > $exfil_file
        # Clean Up
        # echo "Cleaning up $exfil_file.64" # Troubleshooting
        rm $exfil_file.64
        rm $exfil_file.$3
        exit
    elif [ "$arg" == "-e" ]
    then
        ## Encode File for MetaLolFiltration
        # Convert Target File
        echo "Converting file into base64: $2.64"
        base64 $2 | tr -d "\r \n" > $2.64
        echo "Converting base64 file into MetaLolFiltration file: $2.$3"
        $script_full_path/core_lol.py -t table_$3 $2.64 $2.$3
        # Clean Up
        # echo "Cleaning up base64 file: $1.64" # Troubleshooting
        rm $2.64
        exit
    fi
done

## Help Routine
echo "$0 Usage:"
echo "Encoding:"
echo "$0 -e <file_name_to_encode> <encoding_table>"
echo "$0 -e test.file (lol|kahn|etc)"
echo "Decoding:"
echo "$0 -d <file_name_to_decode> <encoding_table>"
echo "$0 -d test.file (lol|kahn|etc...)"
exit
