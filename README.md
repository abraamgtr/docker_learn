# 🐳 Django Docker Learning App

> A hands-on project for learning Docker containerization with Django

[![Django Version](https://img.shields.io/badge/Django-5.2.5-green.svg)](https://djangoproject.com/)
[![Python Version](https://img.shields.io/badge/Python-3.10-blue.svg)](https://python.org/)
[![Docker](https://img.shields.io/badge/Docker-Ready-blue.svg)](https://docker.com/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

## 📖 About

This project is designed as a practical learning resource for understanding how to containerize Django applications using Docker. It demonstrates best practices for Docker development workflows, multi-container setups with Docker Compose, and production-ready configurations.

## 🚀 Features

- **Django 5.2.5** web framework
- **Docker & Docker Compose** containerization
- **PostgreSQL** database integration
- **Development-ready** configuration
- **Clean project structure** following Django best practices
- **Volume mounting** for live code reloading

## 🏗️ Project Structure

```
docker_learn/
├── 📁 config/              # Django project configuration
│   ├── settings.py         # Main settings file
│   ├── urls.py            # URL routing
│   └── wsgi.py            # WSGI configuration
├── 📁 pages/              # Simple pages app
│   ├── views.py           # View functions
│   └── urls.py            # App-specific URLs
├── 🐳 Dockerfile          # Docker image configuration
├── 🐳 docker-compose.yml  # Multi-container setup
├── 📋 requirements.txt    # Python dependencies
└── 🗃️ manage.py           # Django management script
```

## 🛠️ Prerequisites

Before you begin, ensure you have the following installed:

- [Docker](https://docs.docker.com/get-docker/) (v20.10+)
- [Docker Compose](https://docs.docker.com/compose/install/) (v2.0+)

## ⚡ Quick Start

### 1. Clone the Repository

```bash
git clone <your-repo-url>
cd docker_learn
```

### 2. Build and Run with Docker Compose

```bash
# Build and start all services
docker-compose up --build

# Or run in detached mode
docker-compose up -d --build
```

### 3. Access the Application

Open your browser and navigate to:
- **Application**: http://localhost:8000
- **Admin Panel**: http://localhost:8000/admin (after creating superuser)

## 🐳 Docker Commands Reference

### Basic Operations

```bash
# Build the Docker image
docker-compose build

# Start services
docker-compose up

# Start services in background
docker-compose up -d

# Stop services
docker-compose down

# View logs
docker-compose logs

# View logs for specific service
docker-compose logs web
```

### Django Management Commands

```bash
# Run Django commands inside container
docker-compose exec web python manage.py <command>

# Create superuser
docker-compose exec web python manage.py createsuperuser

# Run migrations
docker-compose exec web python manage.py migrate

# Collect static files
docker-compose exec web python manage.py collectstatic
```

### Development Workflow

```bash
# Enter the container shell
docker-compose exec web bash

# Run Django shell
docker-compose exec web python manage.py shell

# Run tests
docker-compose exec web python manage.py test
```

## 📊 Services Overview

| Service | Description | Port | Image |
|---------|-------------|------|-------|
| **web** | Django application | 8000 | Custom (built from Dockerfile) |
| **db** | PostgreSQL database | 5432 | postgres:15 |

## 🔧 Configuration Details

### Dockerfile Highlights

- **Base Image**: `python:3.10-slim` for optimal size and security
- **Environment Variables**: 
  - `PYTHONDONTWRITEBYTECODE=1` - Prevents Python from writing .pyc files
  - `PYTHONUNBUFFERED=1` - Ensures output is displayed in real-time
- **Working Directory**: `/code` for organized container structure
- **Volume Mounting**: Live code reloading during development

### Docker Compose Features

- **Service Dependencies**: Web service waits for database
- **Volume Mounting**: Local code changes reflect immediately
- **Environment Variables**: Proper Django configuration
- **Network**: Services can communicate using service names

## 🎯 Learning Objectives

By working with this project, you'll learn:

1. **Docker Fundamentals**
   - Writing Dockerfiles
   - Building and running containers
   - Managing container lifecycle

2. **Docker Compose**
   - Multi-container applications
   - Service orchestration
   - Volume and network management

3. **Django in Containers**
   - Environment configuration
   - Database connectivity
   - Development vs production setups

4. **Best Practices**
   - Container optimization
   - Security considerations
   - Development workflows

## 🔍 Troubleshooting

### Common Issues

**Port already in use:**
```bash
# Find and kill process using port 8000
lsof -ti:8000 | xargs kill -9
```

**Database connection issues:**
```bash
# Restart database service
docker-compose restart db

# Check database logs
docker-compose logs db
```

**Permission issues:**
```bash
# Reset container permissions
docker-compose down
docker-compose up --build
```

## 📚 Next Steps

To extend your learning:

1. **Add more Django apps** - Create additional functionality
2. **Implement database models** - Add PostgreSQL integration
3. **Add Redis caching** - Introduce another service
4. **Configure Nginx** - Add reverse proxy
5. **Set up CI/CD** - Automate testing and deployment
6. **Production deployment** - Learn about production Docker setups

## 🤝 Contributing

This is a learning project! Feel free to:

- Add new features for learning purposes
- Improve documentation
- Share your Docker learning experiences
- Submit issues or suggestions

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 🙏 Acknowledgments

- Django Software Foundation for the amazing framework
- Docker Inc. for containerization technology
- The open-source community for continuous inspiration

---

**Happy Learning! 🚀**

*Remember: The best way to learn Docker is by doing. Experiment with the configurations, break things, and rebuild them!*
