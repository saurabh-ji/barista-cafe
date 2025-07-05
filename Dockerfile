FROM nginx:alpine

# Set working directory
WORKDIR /usr/share/nginx/html

# Remove the default nginx static assets
RUN rm -rf ./*

# Copy your static site files into the container
COPY . .

# Expose port 5000
EXPOSE 5000

# Override the default command to run Nginx on port 5000
CMD ["nginx", "-g", "daemon off;", "-c", "/etc/nginx/nginx.conf"]

