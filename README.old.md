# chat_test

会社の勉強会で作る簡易チャットシステムです。

## 作成手順


### docker形成

```
$ docker run \
  --rm \
  --workdir /app \
  -v ${PWD}:/app \
  -it node:12.2.0-alpine \
  /bin/sh -c \
  "npm install -g create-react-app@3.0.1 && \
  create-react-app . --typescript"
```

### Dockerfileの作成

```
FROM node:12.2.0-alpine
WORKDIR /app
COPY package.json /app/package.json
RUN npm install --silent
```

### dockerをビルド

```
$ docker build -t chat_ui:latest .
```

確認。

```
$ docker image ls | grep chat
chat_ui                             latest              7fb8d8b36b5f        17 seconds ago      312MB
```

### docker起動

```
$ docker run \
  --rm \
  -v ${PWD}:/app \
  -v /app/node_modules \
  -p 3030:3000 \
  chat_ui:latest \
  npm start
```

## 作成してく

```
$ docker run \
  --rm \
  -v ${PWD}:/app \
  -v /app/node_modules \
  -p 3030:3000 \
  chat_ui:latest \
  npm install --save styled-components
```

```
$ docker build -t chat_ui:latest .
```

```
$ docker run \
  --rm \
  -v ${PWD}:/app \
  -v /app/node_modules \
  -p 3030:3000 \
  chat_ui:latest \
  npm install @types/styled-components
```

```
$ docker build -t chat_ui:latest .
```
