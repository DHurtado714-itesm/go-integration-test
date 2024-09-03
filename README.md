# Go Test Containers Project 🚀

This repository contains examples of Go code using **TestContainers** for testing purposes. It includes implementations for a **Rate Limiter** and a **Calculator**, along with unit tests to ensure their proper functionality. Future additions are planned for a **pub/sub** component (currently pending). 📚

## Requirements 📋

- [Go](https://golang.org/doc/install) (version 1.16 or higher)
- [Docker](https://www.docker.com/) (to run containers for testing)
- Dependencies managed with `go mod`

## Project Structure 🏗️

- `ratelimit/` - Contains the implementation and tests for the **Rate Limiter**.
- `calculator/` - Contains the implementation and tests for the **Calculator**.
- `pubsub/` - **(Pending)** - Planned module for pub/sub functionality.

## Getting Started 🏁

1. **Clone the repository**:

   ```sh
   git clone https://github.com/yourusername/go-test-containers.git
   cd go-test-containers
   ```

2. **Install dependencies**:

   ```sh
   go mod tidy
   ```

3. **Run tests**🧪:

   ```sh
    go test ./...
   ```

This will execute both unit and integration tests, utilizing Docker containers for the integration tests.

## Using TestContainers 🐳

This project leverages [TestContainers-Go](https://github.com/testcontainers/testcontainers-go) to run integration tests that depend on external services like Redis.

## Examples 📝

### Rate Limiter Tests

The `ratelimit` package includes a rate-limiting implementation that interacts with Redis. The integration tests spin up a temporary Redis container using TestContainers to validate the rate limiter's behavior.

```go
req := testcontainers.ContainerRequest{
    Image:        "redis:7.2",
    ExposedPorts: []string{"6379/tcp"},
    WaitingFor:   wait.ForLog("Ready to accept connections"),
}
container, err := testcontainers.GenericContainer(ctx, testcontainers.GenericContainerRequest{
    ContainerRequest: req,
    Started:          true,
})
```

### Calculator Tests

The `calculator` package includes a simple calculator implementation with unit tests. The tests validate the calculator's basic arithmetic operations.

```go
func TestCalculator_Add(t *testing.T) {
    c := NewCalculator()
    result := c.Add(1, 2)
    assert.Equal(t, 3, result)
}
```

## Contributing 🤝

Contributions are welcome! Please fork the repository and submit a pull request with your changes.
