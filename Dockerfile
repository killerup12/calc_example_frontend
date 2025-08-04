# Stage 1: Build the Flutter web app
FROM ghcr.io/cirruslabs/flutter:stable as build

WORKDIR /app

# Copy pubspec files to leverage Docker cache
COPY pubspec.yaml .
RUN flutter pub get

# Copy the rest of the application
COPY . .

# Build the web app
RUN flutter build web --release

# Stage 2: Serve the built web app using Nginx
FROM nginx:stable-alpine

# Remove default nginx static assets
RUN rm -rf /usr/share/nginx/html/*

# Copy the built app from the previous stage
COPY --from=build /app/build/web /usr/share/nginx/html

# Copy custom nginx config
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 8081
EXPOSE 8081

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
