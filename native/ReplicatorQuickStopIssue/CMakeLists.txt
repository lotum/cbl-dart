cmake_minimum_required (VERSION 3.1)
cmake_policy(VERSION 3.1)

project(Root)

if(${CMAKE_SYSTEM_NAME} STREQUAL "Linux")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -stdlib=libc++")
endif()

get_filename_component(ROOT_DIR ../ ABSOLUTE)

add_subdirectory(
    ${CMAKE_CURRENT_SOURCE_DIR}/../vendor/couchbase-lite-C 
    ${CMAKE_CURRENT_SOURCE_DIR}/build/vendor/couchbase-lite-C
)

set(CMAKE_POSITION_INDEPENDENT_CODE ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_STANDARD 17)

add_executable(
    main
    main.cpp
)

target_include_directories(main
    PRIVATE
    ${ROOT_DIR}/vendor/couchbase-lite-C/include
    ${ROOT_DIR}/vendor/couchbase-lite-C/vendor/couchbase-lite-core/vendor/fleece/API
)

target_link_libraries(main 
    CouchbaseLiteC
)
