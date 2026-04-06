# Build stage
FROM node:20-alpine AS builder

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm ci

# Copy source code
COPY . .

# Build the application
RUN npm run build

# Production stage
FROM caddy:2-alpine

# Copy built assets from builder
COPY --from=builder /app/dist /usr/share/caddy

# Copy Caddyfile for SPA routing
RUN echo $'{\n\
    auto_https off\n\
}\n\
\n\
:80 {\n\
    root * /usr/share/caddy\n\
    encode gzip\n\
    try_files {path} /index.html\n\
    file_server\n\
}' > /etc/caddy/Caddyfile

EXPOSE 80

CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile"]
