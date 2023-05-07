from flask import Flask,Blueprint

Blue_app_root = Blueprint("app_root",__name__)
@Blue_app_root.route("/")
def root():
	return ".....root......"

Blue_app_sub1 = Blueprint("app_sub1",__name__)
@Blue_app_sub1.route("/sub1")
def sub1():
	return ".....sub1......"

def create_app():
	Flask_app = Flask(__name__)
	Flask_app.register_blueprint(Blue_app_root)
	Flask_app.register_blueprint(Blue_app_sub1)
	return Flask_app




