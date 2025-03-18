# Stage 1:  Build the application
FROM node:20 AS builder
# Set working directory
WORKDIR /app
# RUN cd tux-racer-js &&  git submodule update --init --recursive
# Copy package.json and package-lock.json (or yarn.lock)
COPY tux-racer-js/ .
# Install dependencies
RUN npm install

# Stage 2: create final image
FROM node:20
# RUN apt update -y
# RUN apt install -y nodejs
# RUN apt install -y npm 
WORKDIR /app
# copy the files from the current directory into WORKDIR in the in the image filesystem
COPY --from=builder /app /app
EXPOSE 5173
CMD ["npm", "run", "dev"]
