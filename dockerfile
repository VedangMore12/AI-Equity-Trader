# Use an official Python runtime
FROM python:3.11-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Install system dependencies if needed (e.g., git, curl, build-essential)
# Some MCP servers require git to fetch packages. Uncomment if needed.
# RUN apt-get update && apt-get install -y --no-install-recommends git && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy requirements and install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire project
COPY . .

# Ensure the MCP server scripts are executable (just in case)
RUN chmod +x *.py

# Expose the port your main app.py uses (change 8000 if needed)
EXPOSE 8000

# Run the main app
CMD ["python", "app.py"]