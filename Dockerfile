# Specify the Alpine-based Node image
FROM node:22-alpine

# Set the working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./


RUN npm install 
# Copy the rest of the application code
COPY . .

EXPOSE 3000

# Start the application
CMD ["node", "index.js"]
