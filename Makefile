escape:
	docker compose down -v --rmi local
	docker compose up -d

nuevo-juego:
	docker compose up -d

reanudar:
	docker compose start

parar:
	docker compose stop

reiniciar-todo:
	docker compose down -v --rmi local