FROM node:0.10.36
RUN mkdir my-webapp
RUN cd my-webapp
ADD package.json package.json
ADD server.js server.js
COPY views views
RUN npm i express express-stormpath cookie-parser csurf jade forms xtend body-parser --save
RUN export STORMPATH_CLIENT_APIKEY_ID=5D657LYU4UAT3BDGLGKZ5W13Q
RUN export STORMPATH_CLIENT_APIKEY_SECRET=qWEB2zPV9FejkSeXvZi7087h73jR/UGYQugJP0uKLLA
RUN export STORMPATH_APPLICATION_HREF=https://api.stormpath.com/v1/applications/769ZizLswAsHHJedpjhWOF
EXPOSE 3000
ADD run.sh ./run.sh
RUN chmod +x ./run.sh
CMD ["./run.sh"]


