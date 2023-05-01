from flask import Flask,Blueprint

app_root = Blueprint("app_root",__name__)
@app_root.route("/")
def sub1():
	return ".....root......"

app_sub1 = Blueprint("app_sub1",__name__)
@app_sub1.route("/sub1")
def sub1():
	return ".....sub1......"

def create_app():
	app = Flask(__name__)
	app.register_blueprint(app_root)
	app.register_blueprint(app_sub1)
	return app




