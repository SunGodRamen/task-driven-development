# Use a base image with your preferred distribution (e.g., Ubuntu)
FROM ubuntu:latest

# Install dependencies and required tools
RUN apt-get update && \
    apt-get install -y neovim git taskwarrior zsh curl xdg-utils && \
    apt-get clean

# Install the draw.io desktop app (use the appropriate installation method for your base distribution)
RUN curl -L https://github.com/jgraph/drawio-desktop/releases/download/v14.6.13/draw.io-amd64-14.6.13.deb -o drawio.deb && \
    apt-get install -y ./drawio.deb && \
    rm drawio.deb

# Set up the user environment
ARG USER=developer
ARG UID=1000
ARG GID=1000
RUN groupadd --gid "$GID" "$USER" && \
    useradd --uid "$UID" --gid "$GID" --create-home --shell /bin/zsh "$USER"

USER ${USER}
WORKDIR /home/${USER}

# Copy the project configuration files
COPY ./.nvim /home/${USER}/.nvim
COPY ./.taskrc /home/${USER}/.taskrc
COPY ./.gitignore /home/${USER}/.gitignore
COPY ./project-taskwarrior.zsh /home/${USER}/.project-taskwarrior.zsh

# Set up the user's shell configuration
RUN echo 'source ~/.project-taskwarrior.zsh' >> /home/${USER}/.zshrc

# Set the entrypoint for the container
ENTRYPOINT ["zsh"]
