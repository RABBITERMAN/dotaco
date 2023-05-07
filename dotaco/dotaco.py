from flask import Flask
#from blue_app_root import Blue_app_root
#from blue_app_root_local import Blue_app_root
from bluprints import Blue_app_root,Blue_app_sub1
#import bluprints

def create_app():
	Flask_app = Flask(__name__)
	Flask_app.register_blueprint(Blue_app_root)
	Flask_app.register_blueprint(Blue_app_sub1)
	return Flask_app

