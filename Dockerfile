############
# Base image
############
FROM node:16.16.0-alpine as base-image

WORKDIR /app

EXPOSE 8282

COPY package.json /app/

############
# Image for dependencies
############
FROM base-image as dependencies

COPY package-lock.json /app/

RUN npm set progress=false && \
    npm install --omit=dev

#########################
# Image for dependencies
#########################
FROM base-image as develop

ENV NODE_ENV=development

RUN npm set progress=false && \
    npm install

COPY ./ /app

RUN npm run build

#########################
# Image for Prod
#########################
FROM base-image as production

ENV NODE_ENV=production

COPY --from=dependencies /app/node_modules/ /app/node_modules/
COPY --from=develo /app/build /app/build

RUN adduser -D -h /app -u 5000 dev && \
    chown -R dev /app

USER dev

CMD ["npm", "start"]

