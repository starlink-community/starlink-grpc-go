#/bin/bash

protoc --go_out=pkg/    --go-grpc_out=pkg/  --descriptor_set_in=proto/dish.protoset spacex/api/device/device.proto
protoc --go_out=pkg/    --go-grpc_out=pkg/  --descriptor_set_in=proto/dish.protoset spacex/api/common/status/status.proto
protoc --go_out=pkg/    --go-grpc_out=pkg/  --descriptor_set_in=proto/dish.protoset spacex/api/device/command.proto
protoc --go_out=pkg/    --go-grpc_out=pkg/  --descriptor_set_in=proto/dish.protoset spacex/api/device/common.proto
protoc --go_out=pkg/    --go-grpc_out=pkg/  --descriptor_set_in=proto/dish.protoset spacex/api/device/dish.proto
protoc --go_out=pkg/    --go-grpc_out=pkg/  --descriptor_set_in=proto/dish.protoset spacex/api/device/wifi.proto
protoc --go_out=pkg/    --go-grpc_out=pkg/  --descriptor_set_in=proto/dish.protoset spacex/api/device/wifi_config.proto
protoc --go_out=pkg/    --go-grpc_out=pkg/  --descriptor_set_in=proto/dish.protoset spacex/api/device/transceiver.proto

find pkg/spacex.com -name "*.go" | xargs sed -i.bak 's|spacex.com/api|github.com/starlink-community/starlink-grpc-go/pkg/spacex.com/api|g'
find pkg/spacex.com -name "*.bak" | xargs rm

