from flask import Flask, request, jsonify
from models.model_handler import ModelHandler

app = Flask(__name__)
model_handler = ModelHandler()

@app.route('/chat', methods=['POST'])
def chat():
    user_input = request.json.get('message')
    if not user_input:
        return jsonify({'error': 'No message provided'}), 400

    response = model_handler.generate_response(user_input)
    return jsonify({'response': response})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)