# 1. Perbaikan tag versi Ubuntu (menggunakan titik)
FROM ubuntu:24.04

# 2. Perbaikan nama library untuk engine Unity Linux tanpa typo
RUN apt-get update && apt-get install -y \
    ca-certificates \
    libglu1-mesa \
    libxi6 \
    libx11-6 \
    libxext6 \
    librender1 \
    && rm -rf /var/lib/apt/lists/*

# 3. Menentukan lokasi direktori kerja utama
WORKDIR /app

# 4. Menyalin seluruh isi build server ke dalam folder /app
COPY ./linux-server-build /app

# 5. Memberikan izin eksekusi pada binary game server
RUN chmod +x /app/ummorpg.x86_64

# 6. Membuka port komunikasi game
EXPOSE 7777/tcp
EXPOSE 7777/udp

# 7. Menjalankan server game Unity dalam mode konsol/teks
CMD ["./ummorpg.x86_64", "-batchmode", "-nographics"]
