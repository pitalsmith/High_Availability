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
# CHANGE THIS LINE TO 'dist'
COPY --from=build /app/dist /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]