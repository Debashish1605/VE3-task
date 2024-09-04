# Stage 1: Build stage
FROM node:14 AS build

# Set the working directory
WORKDIR /app

# Copy the HTML and CSS files to the container
COPY index.html styles.css /app/

# Copy the background image
COPY dima-panyukov-FBZGZdzW31U-unsplash.jpg /app/

# Stage 2: Nginx stage
FROM nginx:alpine

# Copy the files from the build stage to Nginx directory
COPY --from=build /app/index.html /usr/share/nginx/html/
COPY --from=build /app/styles.css /usr/share/nginx/html/
COPY --from=build /app/dima-panyukov-FBZGZdzW31U-unsplash.jpg /usr/share/nginx/html/

# Expose port 80 for the Nginx server
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
