#!/usr/bin/env bash

cmake -B build && cmake --build build
cmake --install build
./build/test
