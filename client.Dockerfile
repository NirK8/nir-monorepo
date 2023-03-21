FROM node:16 as builder

WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

ADD nx.json /usr/src/app/

ADD tsconfig.base.json /usr/src/app/

ADD babel.config.json /usr/src/app/

ADD apps/client /usr/src/app/apps/client

RUN npm install

RUN npx nx build client

WORKDIR ./dist/apps/client

COPY . .

FROM nginx:1.19.0
WORKDIR /usr/share/nginx/html
RUN rm -rf ./*
COPY --from=builder . .
ENTRYPOINT [ "nginx", "-g", "daemon off;" ]

# EXPOSE 4200
# CMD ["npx", "nx", "run", "client:serve:production"]