from flask import Flask, jsonify
import socket, os, time

app = Flask(__name__)

@app.get("/healthz")
def healthz():
    return "ok", 200

@app.get("/api")
def api():
    return jsonify({
        "service": "api",
        "hostname": socket.gethostname(),
        "version": os.getenv("APP_VERSION", "dev"),
        "time": int(time.time())
    })

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
