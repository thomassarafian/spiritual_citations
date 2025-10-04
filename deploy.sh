#!/bin/bash

# Spiritual Citations - Railway.app Deployment Script
# This script helps you deploy your Rails 8 app to Railway.app using Kamal

echo "🌸 Spiritual Citations Deployment Script 🌸"
echo "=============================================="

# Check if environment variables are set
if [ -z "$KAMAL_REGISTRY_PASSWORD" ]; then
    echo "❌ Error: KAMAL_REGISTRY_PASSWORD environment variable is not set"
    echo "Please set it with: export KAMAL_REGISTRY_PASSWORD='your_docker_hub_token'"
    exit 1
fi

if [ -z "$POSTGRES_PASSWORD" ]; then
    echo "❌ Error: POSTGRES_PASSWORD environment variable is not set"
    echo "Please set it with: export POSTGRES_PASSWORD='your_railway_postgres_password'"
    exit 1
fi

echo "✅ Environment variables are set"
echo ""

# Build and push Docker image
echo "🚀 Building and pushing Docker image to Docker Hub..."
bin/kamal build push

if [ $? -eq 0 ]; then
    echo "✅ Docker image built and pushed successfully"
else
    echo "❌ Failed to build/push Docker image"
    exit 1
fi

echo ""

# Deploy to Railway.app
echo "🚀 Deploying to Railway.app..."
bin/kamal deploy

if [ $? -eq 0 ]; then
    echo ""
    echo "🎉 Deployment successful!"
    echo "Your spiritual citations app should be available at:"
    echo "https://spiritual-citations.railway.app"
    echo ""
    echo "Mindful moment:"
    echo "Inhale: 'Deployment complete'"
    echo "Exhale: 'Wisdom shared'"
else
    echo "❌ Deployment failed"
    exit 1
fi
