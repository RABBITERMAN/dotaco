from flask import Blueprint

Blue_app_root = Blueprint("app_root",__name__)
@Blue_app_root.route("/")
def root():
	return ".....root......"


print ("hi from blue_app_root")
