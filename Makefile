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
