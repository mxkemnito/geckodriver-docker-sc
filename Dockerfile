FROM rust:buster

ENV VERSION=0.30.0

RUN apt-get update -y
RUN apt-get install firefox-esr wget unzip -y
RUN wget https://github.com/mozilla/geckodriver/archive/refs/tags/v${VERSION}.zip 
RUN unzip v$VERSION.zip 
RUN cd geckodriver-${VERSION} && \
    cargo build --release && \
    mv target/release/geckodriver /usr/bin

EXPOSE 4444

ENTRYPOINT [ "/usr/bin/geckodriver" ]
