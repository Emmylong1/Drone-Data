import subprocess
import sys
import os

# Define the paths to staging and production environments
STAGING_PATH = os.path.abspath("infrastructure/environment/staging")
PRODUCTION_PATH = os.path.abspath("infrastructure/environment/production")

def run_command(command, cwd):
    """Runs a shell command and returns success status."""
    try:
        result = subprocess.run(command, shell=True, cwd=cwd, check=True)
        return result.returncode == 0
    except subprocess.CalledProcessError:
        return False

def deploy_environment(env_name, env_path):
    """Deploys the specified environment."""
    print(f"🚀 Deploying {env_name} environment in {env_path}...")
    
    if run_command("terraform init", env_path) and run_command("terraform apply -auto-approve", env_path):
        print(f"✅ {env_name} deployment successful!")
        return True
    else:
        print(f"❌ {env_name} deployment failed!")
        return False

# Deploy Staging
if deploy_environment("staging", STAGING_PATH):
    # If Staging is successful, deploy Production
    deploy_environment("production", PRODUCTION_PATH)
else:
    print("⏹️  Stopping process: Production will not be deployed due to staging failure.")
    sys.exit(1)
