# Use official Apache image as base
FROM httpd:2.4

# Set working directory inside the container
WORKDIR /usr/local/apache2/htdocs/

# Remove any default content
RUN rm -rf ./*

# Copy your website files into the Apache root
COPY . .

# Expose port 5000 (Apache default is 80, but we want 5000 externally)
EXPOSE 5000

# Override Apache's default listening port from 80 to 5000
RUN sed -i 's/Listen 80/Listen 5000/' /usr/local/apache2/conf/httpd.conf

# Entry point to run Apache in foreground
CMD ["httpd-foreground"]


