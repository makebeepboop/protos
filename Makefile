PROTO_DIR = ./proto
GEN_DIR = ./gen/go
PROTO_FILES = \
    $(PROTO_DIR)/task/task.proto

generate:
	protoc -I $(PROTO_DIR) \
	$(PROTO_FILES) \
	--go_out=$(GEN_DIR) \
	--go_opt=paths=source_relative \
	--go-grpc_out=$(GEN_DIR) \
	--go-grpc_opt=paths=source_relative

last-tag:
	@echo "Last tag:"
	@git describe --tags --abbrev=0

new-tag:
	@read -p "Enter new tag: " tag; \
	git tag "$$tag"; \
	git push origin "$$tag"; \
	echo "Tag '$$tag' has been successfully added and pushed."

push: generate last-tag new-tag