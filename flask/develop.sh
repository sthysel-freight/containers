#!/bin/bash

docker run -p 80:8080 -v $(pwd)/app:/app --rm sthysel/flask
