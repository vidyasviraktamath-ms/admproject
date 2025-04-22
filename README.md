# Chat App with Azure Deployment

This project is a chat application that utilizes a Large Language Model (LLM) for generating responses. The application is built using Python for the backend and React.js for the frontend, and it is deployed on Azure Container Environment with a focus on security and scalability.

## Project Structure

```
chat-app-azure-deployment
├── backend
│   ├── app.py                # Main entry point for the backend application
│   ├── requirements.txt      # Python dependencies for the backend
│   └── models
│       └── model_handler.py   # Handles interactions with the Azure Machine Learning model
├── frontend
│   ├── public
│   │   └── index.html        # Main HTML file for the React application
│   ├── src
│   │   ├── App.js            # Main component of the React application
│   │   ├── components
│   │   │   └── ChatBox.js    # Component for handling chat messages
│   │   └── index.js          # Entry point for the React application
│   └── package.json          # Configuration file for npm
├── infrastructure
│   ├── main.tf               # Main Terraform configuration file
│   ├── variables.tf          # Variables for Terraform configuration
│   ├── outputs.tf            # Outputs for Terraform configuration
│   └── modules
│       ├── network
│       │   ├── main.tf       # Network infrastructure configuration
│       │   ├── variables.tf   # Variables for network module
│       │   └── outputs.tf     # Outputs for network module
│       ├── compute
│       │   ├── main.tf       # Compute resources configuration
│       │   ├── variables.tf   # Variables for compute module
│       │   └── outputs.tf     # Outputs for compute module
│       └── security
│           ├── main.tf       # Security measures configuration
│           ├── variables.tf   # Variables for security module
│           └── outputs.tf     # Outputs for security module
├── .gitignore                # Files and directories to ignore by Git
└── README.md                 # Project documentation
```

## Setup Instructions

1. **Clone the Repository**
   ```
   git clone <repository-url>
   cd chat-app-azure-deployment
   ```

2. **Backend Setup**
   - Navigate to the `backend` directory.
   - Install the required Python packages:
     ```
     pip install -r requirements.txt
     ```

3. **Frontend Setup**
   - Navigate to the `frontend` directory.
   - Install the required npm packages:
     ```
     npm install
     ```

4. **Infrastructure Setup**
   - Navigate to the `infrastructure` directory.
   - Initialize Terraform:
     ```
     terraform init
     ```
   - Apply the Terraform configuration:
     ```
     terraform apply
     ```

## Architecture Overview

The application is designed with a Hub & Spoke network architecture on Azure, ensuring that all resources are deployed within a private network. The backend communicates with an Azure Machine Learning instance to generate responses using the LLM. Security measures, including a Web Application Firewall (WAF), are implemented to protect the application at layer 7.

## Usage Guidelines

- Start the backend server by running:
  ```
  python app.py
  ```
- Start the frontend application by running:
  ```
  npm start
  ```
- Access the chat application through the provided frontend URL.

## Security Considerations

This project follows a "Security by Design" approach, ensuring that security measures are integrated at all levels, including the application, models, data, and infrastructure components. Regular security assessments and updates are recommended to maintain a secure environment.

## Contributing

Contributions are welcome! Please submit a pull request or open an issue for any enhancements or bug fixes.