.PHONY: left right all clean

all: left right

left:
	docker compose run --rm --build build-left

right:
	docker compose run --rm --build build-right

clean:
	rm -rf build/*.uf2
