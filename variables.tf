variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "devops-key"
}


from flask import Flask
import socket

app = Flask(__name__)

@app.route('/')
def home():
    hostname = socket.gethostname()
    return f"Application Deployed Successfully<br>Hostname: {hostname}"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
