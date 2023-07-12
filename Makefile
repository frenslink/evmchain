include .env

build:
	docker-compose build
run:
	docker-compose up
start:
	docker-compose up -d
stop:
	docker-compose down
clean:
	docker-compose down -v

add_peer:
	docker-compose exec -ti geth-rpc-endpoint geth attach --exec 'admin.addPeer("enode://af22c29c316ad069cf48a09a4ad5cf04a251b411e45098888d114c6dd7f489a13786620d5953738762afa13711d4ffb3b19aa5de772d8af72f851f7e9c5b164a@geth-bootnode:30303")'
	docker-compose exec -ti geth-rpc-endpoint geth attach --exec 'admin.addTrustedPeer("enode://af22c29c316ad069cf48a09a4ad5cf04a251b411e45098888d114c6dd7f489a13786620d5953738762afa13711d4ffb3b19aa5de772d8af72f851f7e9c5b164a@geth-bootnode:30303")'
	docker-compose exec -ti geth-rpc-endpoint geth attach --exec 'admin.peers'

