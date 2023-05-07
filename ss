[1mdiff --git a/bashhistory b/bashhistory[m
[1mindex 54680ab..06501bb 100644[m
[1m--- a/bashhistory[m
[1m+++ b/bashhistory[m
[36m@@ -14,7 +14,7 @@[m
   351  touch bashhistory[m
   352  geany bashhistory[m
   361  cd ..[m
[31m-  362  flask run[m
[32m+[m[32m  362  flask --debug --app  dotaco/dotaco.py run[m
   363  cd dotaco[m
   365  touch test.py[m
   366  geany test.py [m
[36m@@ -25,4 +25,3 @@[m
   399  git status[m
   401  rm dotaco/dotaco.py [m
   [m
[31m-flask --debug --app  dotaco/dotaco.py run[m
[1mdiff --git a/dotaco/dotaco.py b/dotaco/dotaco.py[m
[1mindex ac6b6fe..aef8f94 100644[m
[1m--- a/dotaco/dotaco.py[m
[1m+++ b/dotaco/dotaco.py[m
[36m@@ -1,20 +1,20 @@[m
 from flask import Flask,Blueprint[m
 [m
[31m-app_root = Blueprint("app_root",__name__)[m
[31m-@app_root.route("/")[m
[31m-def sub1():[m
[32m+[m[32mBlue_app_root = Blueprint("app_root",__name__)[m
[32m+[m[32m@Blue_app_root.route("/")[m
[32m+[m[32mdef root():[m
 	return ".....root......"[m
 [m
[31m-app_sub1 = Blueprint("app_sub1",__name__)[m
[31m-@app_sub1.route("/sub1")[m
[32m+[m[32mBlue_app_sub1 = Blueprint("app_sub1",__name__)[m
[32m+[m[32m@Blue_app_sub1.route("/sub1")[m
 def sub1():[m
 	return ".....sub1......"[m
 [m
 def create_app():[m
[31m-	app = Flask(__name__)[m
[31m-	app.register_blueprint(app_root)[m
[31m-	app.register_blueprint(app_sub1)[m
[31m-	return app[m
[32m+[m	[32mFlask_app = Flask(__name__)[m
[32m+[m	[32mFlask_app.register_blueprint(Blue_app_root)[m
[32m+[m	[32mFlask_app.register_blueprint(Blue_app_sub1)[m
[32m+[m	[32mreturn Flask_app[m
 [m
 [m
 [m
