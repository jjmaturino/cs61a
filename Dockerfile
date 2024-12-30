FROM racket/racket:8.3
LABEL authors="jjmaturino"

# updates packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    git && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# installs necessary packages
RUN raco pkg install --auto \
    berkeley \
    planet-dyoo-simply-scheme1


# Set up the working directory
WORKDIR /app

# Set Racket as default command
CMD ["racket"]