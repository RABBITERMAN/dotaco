#!/bin/bash
deactivate
# Set the default values for empty input (Enter key) and timeout
empty_input_default="test_flask"
timeout_default="test_flask"
timeout=10

# Prompt the user for input
if read -t $timeout -p "Enter project folder name  [Press Enter for '$empty_input_default' or wait $timeout seconds for '$timeout_default']: "; then
    case $REPLY in
        "") inpout="$empty_input_default"; echo "Input is set to: $empty_input_default";;
        *)  inpout="$REPLY"; echo "Input is set to: $REPLY";;
    esac
else
    inpout="$timeout_default"
    echo "Timeout occurred. Input is set to the timeout default value: $timeout_default"
fi

folder=$inpout



empty_input_default="."
timeout_default="."
timeout=10


if read -t $timeout -p "Enter project sub folder name  [Press Enter for '$empty_input_default' or wait $timeout seconds for '$timeout_default']: "; then
    case $REPLY in
        "") inpout="$empty_input_default"; echo "Input is set to: $empty_input_default";;
        *)  inpout="$REPLY"; echo "Input is set to: $REPLY";;
    esac
else
    inpout="$timeout_default"
    echo "Timeout occurred. Input is set to the timeout default value: $timeout_default"
fi

subfolder=$inpout


empty_input_default="app"
timeout_default="app"
timeout=10


if read -t $timeout -p "Enter project app  name  [Press Enter for '$empty_input_default' or wait $timeout seconds for '$timeout_default']: "; then
    case $REPLY in
        "") inpout="$empty_input_default"; echo "Input is set to: $empty_input_default";;
        *)  inpout="$REPLY"; echo "Input is set to: $REPLY";;
    esac
else
    inpout="$timeout_default"
    echo "Timeout occurred. Input is set to the timeout default value: $timeout_default"
fi

appfilename=$inpout



echo "folder var is:" $folder
python3 -m venv venv
source venv/bin/activate

#rm app.py
#cp ~/github/dotaco/dotaco/app.py .
#echo "#!bin/python3" > app.py
#echo from flask import Flask >> app.py
cat   app.py
ls -l
read -t 5 -p "check evryting ok?"
pwd

#flask --debug --app $subfolder/$appfilename.py run

echo "FLASK_APP=test" > .flaskenv
echo "FLASK_ENV=delopment" >> .flaskenv
echo "FLASK_DEBUG=1" >> .flaskenv 
flask run

deactivate
