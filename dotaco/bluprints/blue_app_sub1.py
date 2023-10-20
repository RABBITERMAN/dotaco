from flask import Blueprint

Blue_app_sub1 = Blueprint("app_sub1",__name__,url_prefix="/sub1/")
@Blue_app_sub1.route("/")
def sub1():
	return ".....sub1......"
