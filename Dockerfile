# Use a base image with your preferred distribution (e.g., Ubuntu)
FROM ubuntu:latest

# Install dependencies and required tools
RUN apt-get update && \
    apt-get install -y neovim git taskwarrior zsh curl xdg-utils build-essential && \
    apt-get clean

# Install Node.js for React development
#RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
#    apt-get install -y nodejs

# Install Ruby for Ruby HTTP endpoint development
#RUN apt-get install -y ruby ruby-dev

# Install Rust for Rust development
#RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
#ENV PATH="/home/developer/.cargo/bin:${PATH}"

# Install C and C++ compilers and tools
#RUN apt-get install -y gcc g++ make cmake

# Install Java for Java development
#RUN apt-get install -y default-jdk maven

# Install Kafka for Kafka development
#RUN apt-get install -y zookeeperd kafka-server

# Install Python for Python development
#RUN apt-get install -y python3 python3-pip

# Install Lisp for Lisp development
#RUN apt-get install -y sbcl

# Install Lua for Lua development
#RUN apt-get install -y lua5.3

# Set up the user environment
ARG USER=developer
ARG UID=4000
ARG GID=1111
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
