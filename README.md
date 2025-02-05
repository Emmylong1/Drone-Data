# Temperature Data Infrastructure

## Overview
This project sets up a scalable and robust infrastructure for collecting and analyzing real-time drone data (temperature, CO2 levels, etc.) for environmental analysis in the Cleantech industry. The solution leverages cloud resources, containerization, a CI/CD pipeline, and monitoring/logging to ensure efficient data handling and system health.

## Setup Instructions
1. Clone the repository.
2. Navigate to the `environments/staging & production` directory.
3. Run `terraform init` and `terraform apply` to provision the infrastructure.


## Components
- **Terraform**: Manages cloud infrastructure.
- **Docker**: Containerizes applications.
- **Kafka**: Manages data streams.
- **PostgreSQL**: Stores temperature data.
- **Monitoring**: Tracks system health.

## Future Enhancements
- Implement CI/CD pipeline.
- Add automated IPFS storage.

## Troubleshooting
- Check the logs in CloudWatch for ECS service issues.
- Verify the IPFS daemon is running for data storage.
