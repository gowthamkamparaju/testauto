FROM node:16
WORKDIR /app

# Copy only package.json + package-lock.json first
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy rest of the app code
COPY . .
EXPOSE 3000
CMD ["npm", "start"]
