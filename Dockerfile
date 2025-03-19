FROM n8nio/n8n:latest

USER root

RUN apk --no-cache add bash util-linux \
  ffmpeg 7zip && \
  rm -rf /var/cache/apk/*

# Ensure the parent directory exists and has correct permissions
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n

# Create nodes and custom folders
RUN mkdir -p /home/node/.n8n/nodes /home/node/.n8n/custom && ls -la /home/node/.n8n

# Install custom nodes
RUN cd /home/node/.n8n/custom \
 && npm install n8n-nodes-pgp n8n-nodes-ninox

# Make sure 'node' user owns everything
RUN chown -R node:node /home/node/.n8n

USER node