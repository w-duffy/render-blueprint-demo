# Use a Node.js base image
# FROM node:latest

# # Set the working directory in the container
# WORKDIR /app

# # Copy package.json and package-lock.json (or yarn.lock if you're using Yarn)
# COPY package*.json ./

# # Install project dependencies
# RUN npm install

# # Copy the rest of your app's source code from your host to your image filesystem.
# COPY . .

# # Make port 3000 available to the world outside this container
# EXPOSE 5173

# # Run the app in development mode with hot module replacement
# CMD ["npm", "run", "dev"]
FROM node:18-bullseye-slim

ENV YARN_CACHE_FOLDER=/cache/npm

WORKDIR /app

# install dependencies
# COPY web/package.json web/yarn.lock ./
COPY package*.json ./
RUN --mount=type=cache,target=/cache/npm \
  npm install

# copy app source
COPY . .

ENV VITE_HOST=0.0.0.0
ENV VITE_PORT=5173
CMD ["npm", "run", "dev"]
