docker-ratelimit:
	docker-compose -f ratelimit/compose.yml up -d

test-ratelimit:
	go test ./ratelimit

test-calculator:
	go test ./calculator