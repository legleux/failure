cmake_minimum_required(VERSION 3.16)

project(test)

add_library(doit STATIC src/doit.cpp)
add_executable(test src/main.cpp)
target_link_libraries(test doit)

set(CMAKE_INSTALL_PREFIX test_INSTALL)

install(TARGETS doit DESTINATION include)

install(TARGETS test DESTINATION bin)
# install_target() # make a library and header to install
