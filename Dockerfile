# Use the official Open Source Trino image as base
FROM trinodb/trino:latest

# Add our custom catalog configuration
# This enables the 'memory' connector so we can query data immediately
COPY etc/catalog/memory.properties /etc/trino/catalog/memory.properties

# The base image already sets up the user and entrypoint
# We just need to expose the UI port
EXPOSE 8080

# Healthcheck to ensure Trino is ready
HEALTHCHECK --interval=30s --timeout=30s --start-period=60s --retries=3 \
  CMD curl -f http://localhost:8080/v1/info || exit 1

