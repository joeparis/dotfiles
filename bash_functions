#!/bin/bash
# adopted from https://medium.com/@bezgachev/a-simple-bash-script-to-update-visual-studio-code-insiders-edition-on-linux-6d7b6e662163

function update-vscode {
    file="/tmp/vscode-insider.tar.gz"

    curl -L https://go.microsoft.com/fwlink/?LinkId=723968 -o $file


    if [ -z "$file" ]
        then
            echo "No file supplied, add the file"
            exit 1
    fi

    if [[ $file == *.tar.gz ]]
        then
            # Proceed, it's a tar.gz file
            # Make a temp directory for the vscode archive
            mkdir /home/slava/temp
            tar -xzf "$file" -C /home/slava/temp
            # Move into the app folder
            rm -rf /home/slava/Apps/code-insider/*
            rsync -avhP /home/slava/temp/VSCode-linux-x64/* /home/slava/Apps/code-insider
            # Delete the temp folder, cleanup
            rm -rf /home/slava/temp
            rm $file
            exit 0
    else    
        echo "The file is not a .tar.gz archive"
        exit 1
    fi
}
