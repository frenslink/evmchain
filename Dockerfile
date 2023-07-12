FROM ethereum/client-go:v1.12.0

ARG PASSPHRASE
ARG PRIVATEKEY


RUN echo "${PASSPHRASE}" > /tmp/passphrase
RUN echo "${PRIVATEKEY}" > /tmp/privatekey

RUN geth --password /tmp/passphrase account import /tmp/privatekey
COPY genesis.json /root/.ethereum/
RUN geth --nodiscover init /root/.ethereum/genesis.json \
    && rm -f /root/.ethereum/keystore/geth/nodekey \
    && mv /root/.ethereum/geth /datadir \
    && rm /tmp/privatekey && mv /tmp/passphrase /root/.ethereum/keystore/

COPY ./entrypoint.sh /bin/entrypoint.sh
RUN chmod a+x /bin/entrypoint.sh
ENTRYPOINT ["/bin/entrypoint.sh"]
