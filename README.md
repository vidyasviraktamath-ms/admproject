# Chat App with Azure Deployment

This project is a chat application that utilizes a Large Language Model (LLM) for generating responses. The application is built using Python for the backend and React.js for the frontend, and it is deployed on Azure Container Environment with a focus on security and scalability.

## Project Structure

```
your-chat-app/
├── .github/workflows/        # GitHub Actions workflows for CI/CD
├── infrastructure/          # Terraform files for Azure infrastructure
│   ├── modules/             # Reusable Terraform modules
│   │   ├── network/
│   │   ├── compute/
│   │   ├── aml/
│   │   ├── aci/
│   │   ├── waf/
│   │   └── ...
│   ├── environments/        # Environment-specific configurations
│   │   ├── dev/
│   │   │   ├── terraform.tfvars
│   │   │   └── backend.tf
│   │   ├── staging/
│   │   │   ├── terraform.tfvars
│   │   │   └── backend.tf
│   │   └── prod/
│   │       ├── terraform.tfvars
│   │       └── backend.tf
│   ├── main.tf              # Root module to orchestrate all resources
│   ├── variables.tf         # Global variables
│   ├── outputs.tf           # Outputs of the infrastructure
│   └── backend.tf           # Default backend configuration
├── backend/                 # Python backend application
│   ├── app/                 # Main application code
│   │   ├── __init__.py
│   │   ├── main.py          # FastAPI or Flask entry point
│   │   ├── llm_integration/ # Code to interact with the LLM via AML
│   │   ├── security/        # Backend security-related code (auth, etc.)
│   │   └── ...
│   ├── tests/               # Backend unit and integration tests
│   ├── requirements.txt
│   ├── Dockerfile           # Dockerfile for the backend container
│   └── ...
├── frontend/                # React.js frontend application
│   ├── src/                 # Main frontend code
│   │   ├── App.js
│   │   ├── components/
│   │   ├── hooks/
│   │   ├── services/        # API interaction logic
│   │   └── ...
│   ├── public/
│   ├── tests/               # Frontend unit and integration tests (e.g., Jest, React Testing Library)
│   ├── package.json
│   ├── yarn.lock            # Or package-lock.json
│   ├── Dockerfile           # Dockerfile for the frontend container (e.g., using Nginx)
│   └── ...
├── data/                    # Sample data, scripts for data preparation (not for production data)
├── models/                  # Trained LLM artifacts (managed by AML, but might have related scripts)
├── docs/                    # Project documentation
├── .gitignore
├── README.md
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

![[View the Visio Diagram]](<Architecture diagram.vsdx>)

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
