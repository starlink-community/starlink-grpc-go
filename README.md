Golang GRPC bindings for communicating with the Starlink Dish and Wifi Router. 

## Rebuilding
There should not be much of a need to do this, as this library has pregenerated bindings. However, for documenation purposes:

To get the protoset:
```
./build/get-protoc.sh 
```

To rebuild the generated go bindings:
```
./build/regen.sh
```

See [starlink-cli](https://github.com/starlink-community/starlink-cli) for a basic client.

See [technical documentation](https://github.com/starlink-community/knowledge-base/wiki) over on the knowledge base repo. 
