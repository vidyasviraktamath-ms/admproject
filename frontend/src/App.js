import React, { useState } from 'react';
import ChatBox from './components/ChatBox';

function App() {
  const [messages, setMessages] = useState([]);

  const addMessage = (message) => {
    setMessages((prevMessages) => [...prevMessages, message]);
  };

  return (
    <div className="App">
      <h1>Chat Application</h1>
      <ChatBox messages={messages} addMessage={addMessage} />
    </div>
  );
}

export default App;