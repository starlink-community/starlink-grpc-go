#!/bin/bash

# requires https://github.com/fullstorydev/grpcurl
grpcurl -plaintext -protoset-out proto/dish.protoset 192.168.100.1:9200 describe SpaceX.API.Device.Device
