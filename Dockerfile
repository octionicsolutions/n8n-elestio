FROM n8nio/n8n:${SOFTWARE_VERSION_TAG}
USER root
RUN apk --no-cache add bash util-linux \
  ffmpeg && \
  rm -rf /var/cache/apk/*
RUN mkdir -p /home/node/.n8n/nodes \
 && cd /home/node/.n8n/nodes 
RUN mkdir -p /home/node/.n8n/custom \
 && cd /home/node/.n8n/custom \
 && npm install \
 n8n-nodes-pgp \
RUN chown -R node:node /home/node/.n8n/nodes
USER node