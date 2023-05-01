from flask import Flask

def create_app():
	app = Flask(__name__)
	@app.route("/")
	def index():
		return ".......root......"
	return app

#app_sub1 = Flask("a")
#@app_sub1.route("/sub1")
#def index():
#		return ".......sub1......"
		



