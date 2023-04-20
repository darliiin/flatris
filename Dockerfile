ARG BUILDPLATFORM
# Use an official Node runtime as a parent image
FROM --platform=$BUILDPLATFORM node:19.9.0

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install the dependencies
RUN git clone https://github.com/udaltsovra/flatris && \
    cd flatris  

RUN yarn install && \
    yarn test && \ 
    NODE_OPTIONS=--openssl-legacy-provider yarn build

ENTRYPOINT ["yarn", "start"]

