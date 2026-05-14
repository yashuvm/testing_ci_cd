# Build Stage
FROM node:18 AS builder

WORKDIR /build

COPY package*.json ./

RUN npm install

COPY src ./src
COPY tsconfig.json ./

RUN npm run build


# Production Stage
FROM node:18 AS runner

WORKDIR /app

COPY --from=builder /build/package*.json ./
COPY --from=builder /build/node_modules ./node_modules
COPY --from=builder /build/dist ./dist

EXPOSE 3000

CMD ["npm", "start"]