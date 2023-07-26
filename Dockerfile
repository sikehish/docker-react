#BUILD phase
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#RUN phase
FROM nginx  
# EB is working fine without EXPOSE 80 command, need to investigate!
# Update: EXPOSE 80 isnt probably required as we're already doing port mapping in docker-compose.yml, that's why ts wokring fine without the EXPOSE 80 stmt
EXPOSE 80 
COPY --from=builder /app/build /usr/share/nginx/html
