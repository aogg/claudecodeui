FROM node:22-slim

WORKDIR /app

# Install build dependencies for native modules
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 make g++ git procps \
    && rm -rf /var/lib/apt/lists/*

# Copy package files and scripts needed for postinstall
COPY package*.json ./
COPY scripts ./scripts

# Install dependencies and rebuild native modules for the container runtime
RUN npm ci --production=false \
    && npm rebuild node-pty --build-from-source

# Copy source code
COPY . .

# Build the application
RUN npm run build

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git \
        curl \
    && npm install -g \
        @anthropic-ai/claude-code \
        @google/gemini-cli \
        @openai/codex \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /root/.npm

ENV WORKSPACES_ROOT=/

ENV ANTHROPIC_BASE_URL ""
ENV ANTHROPIC_AUTH_TOKEN ""

ENV GOOGLE_GEMINI_BASE_URL ""
ENV GEMINI_API_KEY ""

# Expose port
EXPOSE 3001

# Start the server
CMD ["npm", "run", "server"]
