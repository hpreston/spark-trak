FROM node:5.11.1

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
RUN npm install

RUN npm install -g node-flint
RUN npm install -g fs
RUN npm install -g csv-parse
RUN npm install -g request
RUN npm install -g should
RUN npm install


# Bundle app source
COPY . /usr/src/app

EXPOSE 8080

CMD [ "npm", "start" ]