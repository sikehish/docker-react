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
EXPOSE 80 
COPY --from=builder /app/build /usr/share/nginx/html
