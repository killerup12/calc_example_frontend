# Переменные
BINARY_NAME=calc_example_frontend

# Docker Hub configuration
# Используем переменные окружения или значения по умолчанию
DOCKER_IMAGE_NAME ?= calc_example_frontend
DOCKER_IMAGE_TITLE ?= calc-example-frontend
DOCKER_TAG ?= latest

# Цвета для вывода
GREEN=\033[0;32m
YELLOW=\033[1;33m
NC=\033[0m # No Color

generate_code:
	flutter pub run build_runner build --delete-conflicting-outputs

docker-build: ## Собрать Docker образ
	@echo "$(GREEN)Сборка Docker образа...$(NC)"
	docker build --platform linux/amd64 -t $(DOCKER_HUB_USERNAME)/$(DOCKER_IMAGE_NAME):$(DOCKER_TAG) .
	@echo "$(GREEN)Docker образ собран: $(NC)$(DOCKER_HUB_USERNAME)/$(DOCKER_IMAGE_NAME):$(DOCKER_TAG)"

deploy: docker-build ## Загрузить образ в Docker Hub
	@echo "$(GREEN)Переименование образа для Docker Hub...$(NC)"
	docker tag $(DOCKER_HUB_USERNAME)/$(BINARY_NAME) $(DOCKER_HUB_USERNAME)/$(DOCKER_IMAGE_NAME):$(DOCKER_TAG)
	@echo "$(GREEN)Загрузка образа в Docker Hub...$(NC)"
	docker push $(DOCKER_HUB_USERNAME)/$(DOCKER_IMAGE_NAME):$(DOCKER_TAG)
	ssh root@109.107.182.160 '\
		echo "$(DOCKER_HUB_TOKEN)" | docker login -u killerup12 --password-stdin && \
    	docker pull $(DOCKER_HUB_USERNAME)/$(DOCKER_IMAGE_NAME):$(DOCKER_TAG) && \
    	docker stop calc-example-frontend || true && \
    	docker rm calc-example-frontend || true && \
    	docker run -itd --restart always --name calc-example-frontend -p 0.0.0.0:8081:8081 $(DOCKER_HUB_USERNAME)/$(DOCKER_IMAGE_NAME):$(DOCKER_TAG) && \
    	docker image prune -f \
  	'