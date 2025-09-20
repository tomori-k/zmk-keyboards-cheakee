.PHONY: left right all clean left-debug right-debug

all: left right

left:
	docker compose run --rm --build build-left

right:
	docker compose run --rm --build build-right

left-debug:
	docker compose run --rm --build build-left-debug

right-debug:
	docker compose run --rm --build build-right-debug

reset:
	docker compose run --rm --build build-reset

clean:
	rm -rf build/*.uf2
