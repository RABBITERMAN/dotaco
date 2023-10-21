#!/bin/bash

clear
echo "---------------------------------------------------------------"
deactivate
rm -r ~/github/test_flask
echo "----------------------------------------------------------------"
set -e








# Set the default values for empty input (Enter key) and timeout
empty_input_default="test_flask"
timeout_default="test_flask"
timeout=10
echo "----------------------------------------------------------------"

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
read
clear

empty_input_default="app"
timeout_default="app"
timeout=10


if read -t $timeout -p "Enter project sub module name  [Press Enter for '$empty_input_default' or wait $timeout seconds for '$timeout_default']: "; then
    case $REPLY in
        "") inpout="$empty_input_default"; echo "Input is set to: $empty_input_default";;
        *)  inpout="$REPLY"; echo "Input is set to: $REPLY";;
    esac
else
    inpout="$timeout_default"
    echo "Timeout occurred. Input is set to the timeout default value: $timeout_default"
fi

submodule=$inpout
read
clear

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
read
clear

















echo "----------------------------------------------------------------"
echo "project name is:" $folder
echo "mkdir ~/github/$folder --------------------------------------------------------------"
mkdir ~/github/$folder
echo "cd ~/github/$folder  ------------------------------------------------------------"
cd ~/github/$folder 
echo "pwd--------------------------------------------------------------"
pwd





echo "python3 -m venv venv------------------------------------------------------------"
python3 -m venv venv 
echo "---source venv/bin/activate-----------------------------------------------------------"
source venv/bin/activate  







echo "create .flaskenv----------------------------------------------------------"
echo "FLASK_APP=$appfilename.py" > .flaskenv
echo "FLASK_ENV=delopment" >> .flaskenv
echo "FLASK_DEBUG=1" >> .flaskenv 


echo "pip install python-dotenv----------------------------------------------------------"
pip install python-dotenv







echo "create $submoudle folder---------------------------"
mkdir $submodule
cd $submodule
echo "pwd--------------------------------------------------------------"
pwd
echo "create __init__py for $submoudle folder----------------------------------------------------"
echo "from .$appfilename import create_app" > __init__.py
ls -l


pwd

echo "create config module ---------------------------"
mkdir config
echo "cd config------------------------------------------"
cd config
echo "pwd--------------------------------------------------------------"
pwd
echo "create __init__.py ----------------------------------------------------------"
echo "from .config import Config" > __init__.py

echo "create config.py ----------------------------------------------------------"
echo "from os import environ" > config.py
echo "class Config():" >> config.py
echo "    ENV = environ.get("\""$folder""_API_ENV"\"", "\"production\"")" >> config.py
echo "    DEBUG = bool(int(environ.get("\""$folder""_API_DEBUG"\"", "1")))" >> config.py
echo "    TESTING = DEBUG" >> config.py
echo "    SECRET_KEY = environ.get("\""$folder""_API_SECRET_KEY"\"", "\"secretkey\"")" >> config.py
echo "    JSONIFY_PRETTYPRINT_REGULAR = bool(int(environ.get("\""$folder""_API_JSON_PRETTYPRINT"\"", "0")))" >> config.py
echo "cat config.py----------------------------------------------------------"
cat   config.py

read -p "check configs"

ls -l





echo "exit config------cd..------------------------------------"
cd ..
echo "pwd--------------------------------------------------------------"
pwd

echo "pip install  flask---------------------------------------------------------------"
pip install  flask  


#echo "rm $appfilename.py-------------------------------------------------------------"
#rm $appfilename.py
echo "create $appfilename.py------------------------------------------------------------"
echo "#!bin/python3" > $appfilename.py
echo "from flask import Flask" >> $appfilename.py
echo "from .config import Config" >> $appfilename.py
echo "def create_app():" >> $appfilename.py
echo    "        app = Flask (__name__)" >> $appfilename.py
echo -e "        print(app.config)\n        print(Config.DEBUG)\n        print(Config.ENV)\n        print(Config.JSONIFY_PRETTYPRINT_REGULAR)\n        print(Config.SECRET_KEY)\n        print(Config.TESTING)" >> $appfilename.py
echo "        return app" >> $appfilename.py
echo "#cat $appfilename.py----------------------------------------------------------"
cat   $appfilename.py
read -p "check app"











echo "pip install flask-restful------------------------------------------------------"
pip install flask-restful











 
echo "pip freeze-------------------------------------------------------------"
pip freeze
echo "tree  -I 'venv|__pyc*__' -a-----------------------------------------------------"
tree  -I 'venv|__pyc*__' -a
read -t 30 -p "check evryting ok 30 second time out...?"
clear
echo "run---------------------------------------------------------------"
flask run
#flask --debug --app $appfilename.py run
echo "----------------------------------------------------------------"
deactivate
