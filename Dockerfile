FROM rust
ENV http_proxy http://proxy.lsy.bud.dlh.de:3128
ENV https_proxy http://proxy.lsy.bud.dlh.de:3128
ENV RUST_LOG info wasm-pack build
ENV NPM_TOKEN ea1c9ed1-c91d-4205-b1ca-c2808ff6590c
WORKDIR /src
ADD . /src

RUN apt-get install -y curl \
  && curl -sL https://deb.nodesource.com/setup_11.x | bash - \
  && apt-get install -y nodejs \
  && curl -L https://www.npmjs.com/install.sh | sh

RUN echo "//registry.npmjs.org/:_authToken=$NPM_TOKEN" > .npmrc
RUN cat .npmrc

RUN cargo install wasm-pack
RUN wasm-pack build --scope romesz
RUN wasm-pack pack pkg
#RUN npm i ../romesz-hello-wasm-0.1.0.tgz
RUN wasm-pack publish pkg