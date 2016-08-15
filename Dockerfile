FROM node:5.11.1

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
COPY node_modules /usr/src/app/node_modules

#RUN npm install

#RUN npm install -g node-flint
#RUN npm install -g fs
#RUN npm install -g csv-parse
#RUN npm install -g request
#RUN npm install -g should


# Bundle app source
COPY . /usr/src/app

# Bundle app source
COPY ./api /usr/src/app/api
COPY ./static /usr/src/app/static
COPY ./config /usr/src/app/config
COPY ./app.js /usr/src/app/
COPY ./server.js /usr/src/app/

#EXPOSE 8080

#CMD [ "npm", "start" ]
CMD [ "npm", "server.js" ]