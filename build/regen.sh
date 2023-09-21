#!/bin/bash

set -x
set -e

COMMON_ARGS="--go_out=pkg/ --go-grpc_out=pkg/ --descriptor_set_in=proto/dish.protoset"

# spacex/api/satellites/network/ut_disablement_codes.proto
COMMON_ARGS="${COMMON_ARGS} --go_opt=Mspacex/api/satellites/network/ut_disablement_codes.proto=spacex.com/api/satellites/network"
COMMON_ARGS="${COMMON_ARGS} --go-grpc_opt=Mspacex/api/satellites/network/ut_disablement_codes.proto=spacex.com/api/satellites/network"

# spacex/api/telemetron/public/common/time.proto
COMMON_ARGS="${COMMON_ARGS} --go_opt=Mspacex/api/telemetron/public/common/time.proto=spacex.com/api/telemetron/public/common"
COMMON_ARGS="${COMMON_ARGS} --go-grpc_opt=Mspacex/api/telemetron/public/common/time.proto=spacex.com/api/telemetron/public/common"

protoc    ${COMMON_ARGS}    spacex/api/device/device.proto
protoc    ${COMMON_ARGS}    spacex/api/common/status/status.proto
protoc    ${COMMON_ARGS}    spacex/api/device/command.proto
protoc    ${COMMON_ARGS}    spacex/api/device/common.proto
protoc    ${COMMON_ARGS}    spacex/api/device/dish.proto
protoc    ${COMMON_ARGS}    spacex/api/device/dish_config.proto
protoc    ${COMMON_ARGS}    spacex/api/device/wifi.proto
protoc    ${COMMON_ARGS}    spacex/api/device/wifi_config.proto
protoc    ${COMMON_ARGS}    spacex/api/device/wifi_util.proto
protoc    ${COMMON_ARGS}    spacex/api/device/transceiver.proto
protoc    ${COMMON_ARGS}    spacex/api/satellites/network/ut_disablement_codes.proto
protoc    ${COMMON_ARGS}    spacex/api/telemetron/public/common/time.proto

find pkg/spacex.com -name "*.go" | xargs sed -i.bak 's|spacex.com/api|github.com/starlink-community/starlink-grpc-go/pkg/spacex.com/api|g'
find pkg/spacex.com -name "*.bak" | xargs rm

