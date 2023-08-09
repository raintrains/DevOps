from flask import Flask, render_template, request

import os

app = Flask(__name__)

os.makedirs("uploads", mode=0o755, exist_ok=True)

UPLOAD_FOLDER = ("uploads")
app.config["UPLOAD_FOLDER"] = UPLOAD_FOLDER

@app.route("/", methods=["GET", "POST"])
def upload_file():
    if request.method == "POST":
        uploaded_file = request.files["file"]
        if uploaded_file:
            filename = os.path.join(app.config["UPLOAD_FOLDER"], uploaded_file.filename)
            uploaded_file.save(filename)
            print("Saved file:", filename) 
            return render_template("saved.html")
    return render_template("upload.html")

if __name__ == "__main__":
    app.run(debug=True)