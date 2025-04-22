import React, { useState } from 'react';

const ChatBox = () => {
    const [input, setInput] = useState('');
    const [messages, setMessages] = useState([]);

    const handleInputChange = (event) => {
        setInput(event.target.value);
    };

    const handleSendMessage = async () => {
        if (input.trim() === '') return;

        const userMessage = { text: input, sender: 'user' };
        setMessages([...messages, userMessage]);

        try {
            const response = await fetch('http://<backend-url>/api/chat', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ message: input }),
            });

            const data = await response.json();
            const botMessage = { text: data.response, sender: 'bot' };
            setMessages((prevMessages) => [...prevMessages, botMessage]);
        } catch (error) {
            console.error('Error sending message:', error);
        } finally {
            setInput('');
        }
    };

    return (
        <div className="chat-box">
            <div className="messages">
                {messages.map((msg, index) => (
                    <div key={index} className={msg.sender}>
                        {msg.text}
                    </div>
                ))}
            </div>
            <input
                type="text"
                value={input}
                onChange={handleInputChange}
                onKeyPress={(event) => {
                    if (event.key === 'Enter') {
                        handleSendMessage();
                    }
                }}
                placeholder="Type your message..."
            />
            <button onClick={handleSendMessage}>Send</button>
        </div>
    );
};

export default ChatBox;