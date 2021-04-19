FROM node:14.16.1-alpine

WORKDIR /app

COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# The build folder will be generated in the project root folder
# /app/build -> since the project resides in the /app directory

FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
