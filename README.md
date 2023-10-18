𝗠𝗲𝗱𝗶𝗰𝘂𝗿𝗲 - 𝗠𝗶𝗰𝗿𝗼𝘀𝗲𝗿𝘃𝗶𝗰𝗲 𝗜𝗺𝗽𝗹𝗲𝗺𝗲𝗻𝘁𝗮𝘁𝗶𝗼𝗻 𝘂𝘀𝗶𝗻𝗴 𝗦𝗽𝗿𝗶𝗻𝗴 𝗕𝗼𝗼𝘁 𝗮𝗻𝗱 𝗗𝗲𝘃𝗢𝗽𝘀 𝗧𝗼𝗼𝗹𝘀

This repository contains the implementation of a microservice for Medicure, a super specialty hospital based in New York, USA. The microservice is built using Spring Boot and utilizes an in-memory H2 database to store data. The service exposes various endpoints as APIs for managing doctor-related information within the hospital chain.

Key Features:
    Exposes endpoints for doctor registration, updating, searching, and deletion
    
    Utilizes in-memory H2 database for data storage
    
    Includes comprehensive JUnit test cases for thorough testing
    
    Generates detailed HTML reports using TestNG
    
    Implements Continuous Integration and Continuous Deployment using Git, Jenkins, Docker, Ansible, Selenium, Terraform, and Kubernetes
    
    Monitors the Kubernetes cluster using Prometheus and visualizes the dashboard using Grafana


Endpoints:
    POST /registerDoctor: Register a new doctor (Request Body: JSON)
    
    PUT /updateDoctor/{doctorRegNo}: Update an existing doctor (Request Body: JSON)
    
    GET /searchDoctor/{doctorName}: Search for a doctor by name (No Request Body)
    
    DELETE /deletePolicy/{doctorRegNo}: Delete a doctor by registration number (No Request Body)

This project is a Proof of Concept (POC) demonstrating the automation of the build and deployment process for Medicure's application, aiming to streamline software delivery, ensure high quality and reliability, and reduce manual efforts and maintenance costs.
