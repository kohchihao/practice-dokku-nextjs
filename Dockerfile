FROM mhart/alpine-node:10 AS builder
WORKDIR /app
COPY package.json .
RUN yarn install
COPY . .
RUN yarn build && yarn --production

FROM mhart/alpine-node:10
WORKDIR /app
COPY --from=builder /app .

# 3. run this web-application
EXPOSE 5000
ENV NODE_ENV production

CMD [ "npm", "run", "start" ]