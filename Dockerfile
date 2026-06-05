# Stage 1: Build the React app
FROM node:22 AS build
WORKDIR /app

# Copy package files first to leverage Docker layer caching
COPY package*.json ./
RUN npm install

# Copy the rest of the project files
COPY . .
RUN npm run build

# Stage 2: Serve with Nginx
FROM nginx:alpine

# Copy the built React app from Stage 1 to the Nginx html folder
COPY --from=build /app/dist /usr/share/nginx/html

# COPY the custom nginx.conf into the Nginx configuration directory
# This overwrites the default nginx config to use your settings
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]




# # Stage 1: Build the React app
# FROM node:22 AS build
# WORKDIR /app

# # Copy package files first to leverage Docker layer caching
# COPY package*.json ./
# RUN npm install

# # Copy the rest of the project files
# COPY . .
# RUN npm run build

# # Stage 2: Serve with Nginx
# FROM nginx:alpine
# # CHANGE THIS LINE TO 'dist'
# COPY --from=build /app/dist /usr/share/nginx/html

# # Expose port 80
# EXPOSE 80

# # Start Nginx
# CMD ["nginx", "-g", "daemon off;"]