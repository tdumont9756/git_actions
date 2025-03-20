# Stage 1:  Build the application
FROM node:20 AS builder
# Set working directory
WORKDIR /app
RUN git submodule update --init --recursive
# Copy package.json and package-lock.json (or yarn.lock)
COPY tux-racer-js/ .
run pwd
run ls -l
# Install dependencies
RUN npm install

# Stage 2: create final image
FROM node:20
WORKDIR /app
# copy the files from the current directory into WORKDIR in the in the image filesystem
COPY --from=builder /app /app
EXPOSE 5173
CMD ["npm", "run", "dev"]
