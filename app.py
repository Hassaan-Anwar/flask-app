from flask import Flask,render_template
app = Flask(__name__)

def add(a, b):
    return a + b

@app.route('/')
def home():
    return render_template("index.html")



@app.route('/about')
def about():
    return render_template(
        "about.html",
        name="Hassaan",
        course="BS Computer Science MLOPS",
        section="CS-K",
        roll_number="22I-0890"
    )

if __name__ == '__main__':
    app.run(debug=True)