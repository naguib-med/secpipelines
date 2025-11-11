# -----------------------------
# 🏗️ Build stage
# -----------------------------
FROM node:25-alpine3.21 AS builder
WORKDIR /app

# Copier uniquement les manifests au début
COPY . .

# Supprimer le lockfile pour forcer npm à re-résoudre les deps corrigées
RUN npm install -g npm@latest && rm -f package-lock.json && npm install --omit=dev

# Copier le reste du code
COPY . .

# -----------------------------
# 🚀 Production stage
# -----------------------------
FROM node:25-alpine3.21
WORKDIR /app

# Environnement sécurisé
ENV NODE_ENV=production

# Copier uniquement ce qui est nécessaire depuis le builder
COPY --from=builder /app /app

# Exposer le port
EXPOSE 3000

# Démarrer l'application
CMD ["node", "src/app.js"]
