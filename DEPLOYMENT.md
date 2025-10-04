# Spiritual Citations - Deployment Guide

## What we built
- Beautiful Rails 8 app with spiritual quotes
- Random quote on each page refresh
- Gradient background and elegant design
- Kamal deployment configuration ready

## Local Testing
```bash
cd spiritual_citations
bin/rails server
# Visit http://localhost:3000
```

## Deployment with Kamal

### Step 1: Set up Docker Hub
1. Create account at https://hub.docker.com
2. Create a repository called `spiritual_citations`
3. Get your Docker Hub access token

### Step 2: Set up server
1. Get a VPS (DigitalOcean, Linode, AWS EC2)
2. Install Docker on the server
3. Note the server IP address

### Step 3: Configure secrets
```bash
# Set your Docker Hub password
export KAMAL_REGISTRY_PASSWORD="your_docker_hub_token"

# Update config/deploy.yml with:
# - Your Docker Hub username
# - Your server IP address
# - Your domain name (optional)
```

### Step 4: Deploy
```bash
# Build and push Docker image
bin/kamal build push

# Deploy to server
bin/kamal deploy
```

## Configuration Files Explained

### config/deploy.yml
- `service: spiritual_citations` - Name of the app
- `image: thomassarafian/spiritual_citations` - Docker image name
- `servers: web: - 192.168.0.1` - Server IP to deploy to
- `proxy: ssl: true, host: spiritual-citations.example.com` - SSL and domain

### .kamal/secrets
- Contains environment variables
- `KAMAL_REGISTRY_PASSWORD` - Docker Hub token
- `RAILS_MASTER_KEY` - Rails encryption key

## Features
- ✅ Rails 8 with Solid Queue, Solid Cache, Solid Cable
- ✅ Beautiful spiritual quotes
- ✅ Responsive design
- ✅ Random quote on refresh
- ✅ Kamal deployment ready
- ✅ Docker containerization
- ✅ SSL support

## Next Steps
1. Get a server and Docker Hub account
2. Update config/deploy.yml with your details
3. Run `bin/kamal deploy`
4. Enjoy your live spiritual quotes app!
