FROM zmkfirmware/zmk-build-arm:stable

RUN mkdir -p workspace/config
WORKDIR /workspace

COPY zmk-config-cheakee/config/west.yml config/west.yml

RUN west init -l /workspace/config/
RUN west update
RUN west zephyr-export

WORKDIR /

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
