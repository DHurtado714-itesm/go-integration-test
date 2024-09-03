docker-ratelimit:
	docker-compose -f ratelimit/compose.yml up -d

test-ratelimit:
	go test ./ratelimit