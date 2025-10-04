# Railway.app Deployment Guide for Spiritual Citations

## What we configured

### 1. Kamal Configuration (`config/deploy.yml`)
- **Service name**: `spiritual_citations`
- **Docker image**: `thomassarafian/spiritual_citations`
- **Server**: `railway.app`
- **Domain**: `spiritual-citations.railway.app`
- **SSL**: Enabled with Let's Encrypt
- **Database**: PostgreSQL 15

### 2. Secrets (`.kamal/secrets`)
- **Docker Hub token**: Set via environment variable `KAMAL_REGISTRY_PASSWORD`
- **Rails master key**: Automatically loaded from `config/master.key`
- **PostgreSQL password**: Set via environment variable `POSTGRES_PASSWORD`

### 3. Database Configuration (`config/database.yml`)
- **Development**: `spiritual_citations_development`
- **Test**: `spiritual_citations_test`
- **Production**: `spiritual_citations_production`
- **Adapter**: PostgreSQL (changed from SQLite)

### 4. Gemfile Updates
- **Removed**: `sqlite3` gem
- **Added**: `pg` gem for PostgreSQL support

## Deployment Steps

### Step 1: Set up Railway.app Account
1. Go to https://railway.app
2. Sign up with GitHub
3. Create a new project

### Step 2: Set up PostgreSQL Database
1. In Railway.app dashboard, click "New"
2. Select "Database" → "PostgreSQL"
3. Note the connection details (host, port, password)

### Step 3: Set Environment Variables
Before deploying, set these environment variables:
```bash
export KAMAL_REGISTRY_PASSWORD="your_docker_hub_token"
export POSTGRES_PASSWORD="your_railway_postgres_password"
```

### Step 4: Deploy with Kamal
```bash
# Build and push Docker image to Docker Hub
bin/kamal build push

# Deploy to Railway.app
bin/kamal deploy
```

### Step 5: Set Environment Variables in Railway
In Railway.app dashboard, add these environment variables:
- `RAILS_ENV=production`
- `RAILS_MASTER_KEY=<your_master_key>`
- `POSTGRES_PASSWORD=<your_postgres_password>`
- `DB_HOST=<railway_postgres_host>`
- `DB_PORT=5432`

## Configuration Files Explained

### `config/deploy.yml` - Kamal Deployment Configuration
```yaml
service: spiritual_citations          # App name
image: thomassarafian/spiritual_citations  # Docker image name
servers:                             # Where to deploy
  web:
    - railway.app
proxy:                               # SSL and domain
  ssl: true
  host: spiritual-citations.railway.app
registry:                            # Docker Hub credentials
  username: thomassarafian
  password:
    - KAMAL_REGISTRY_PASSWORD
env:                                 # Environment variables
  secret:
    - RAILS_MASTER_KEY
  clear:
    SOLID_QUEUE_IN_PUMA: true
    PORT: 3000
    RAILS_ENV: production
```

### `.kamal/secrets` - Secret Environment Variables
```bash
KAMAL_REGISTRY_PASSWORD=$KAMAL_REGISTRY_PASSWORD
RAILS_MASTER_KEY=$(cat config/master.key)
POSTGRES_PASSWORD=$POSTGRES_PASSWORD
```

### `config/database.yml` - Database Configuration
```yaml
production:
  adapter: postgresql
  database: spiritual_citations_production
  username: postgres
  password: <%= ENV["POSTGRES_PASSWORD"] %>
  host: <%= ENV["DB_HOST"] || "localhost" %>
  port: <%= ENV["DB_PORT"] || 5432 %>
```

## Troubleshooting

### Common Issues
1. **Docker Hub authentication**: Make sure your token is set as environment variable
2. **PostgreSQL connection**: Verify Railway database credentials
3. **Environment variables**: Ensure all required vars are set in Railway
4. **SSL certificate**: Railway handles SSL automatically

### Useful Commands
```bash
# Check deployment status
bin/kamal app details

# View logs
bin/kamal app logs

# Access Rails console
bin/kamal app exec --interactive "bin/rails console"

# Restart app
bin/kamal app restart
```

## Features Ready for Deployment
- ✅ Beautiful spiritual quotes with random selection
- ✅ Responsive design with gradient background
- ✅ Rails 8 with Solid Queue, Solid Cache, Solid Cable
- ✅ PostgreSQL database
- ✅ SSL/HTTPS support
- ✅ Docker containerization
- ✅ Kamal deployment configuration

## Next Steps After Deployment
1. Visit your Railway.app URL
2. Test the spiritual quotes functionality
3. Set up custom domain (optional)
4. Monitor logs and performance
5. Set up automated deployments from GitHub

## Mindful Deployment
- Inhale: "Prepared and ready"
- Exhale: "Deploy with confidence"
- Inhale: "Serve others"
- Exhale: "Share wisdom"
