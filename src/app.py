from flask import Flask, render_template, request
import requests

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/get-user', methods=['POST'])
def get_user():
    user_id = request.form['userId']
    # Set the Qlik Sense server details
    server = "https://yourserver.com"
    virtual_proxy = "your_vp"
    xrfkey = "abcdefghijklmnoq"
    # Set the API endpoint and headers
    endpoint = f"{server}/{virtual_proxy}/qrs/user/{user_id}"
    headers = {
        "X-Qlik-xrfkey": xrfkey,
        "Content-Type": "application/json"
    }
    response = requests.get(endpoint, headers=headers)
    if response.status_code == 200:
        return response.json()
    else:
        return response.text
    
if __name__ == '__main__':
    app.run(debug=True)
