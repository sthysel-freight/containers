from flask import Flask, request, render_template

app = Flask(__name__)

@app.route('/')
def index():
   return render_template("square.html")

@app.route('/square/submit', methods = ['POST'])
def square_submit():
   x = int(request.form.get('x', 0))
   res = x * x
   return "{} squared is {}".format(x, res)

@app.route('/cube/submit', methods = ['POST'])
def cube_submit():
   x = int(request.form.get('x', 0))
   res = x * x * x
   return "{} cubed is {}".format(x, res)

if __name__ == "__main__":
   app.run(host="0.0.0.0", port=8080, debug=True)
