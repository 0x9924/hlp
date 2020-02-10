cmake_minimum_required(VERSION 2.8.9)  
project(asio_tutorial)  

set(Boost_USE_STATIC_LIBS ON)

find_package(Boost COMPONENTS system)
find_package(Boost COMPONENTS thread)

include_directories(SYSTEM ${Boost_INCLUDE_DIR})


function(add_exec_with_boost NAME)
  add_executable(${NAME} ${NAME}.cpp)
  target_compile_options(${NAME} PRIVATE -lboost_system -lboost_thread -pthread)
  target_link_libraries(${NAME} ${Boost_LIBRARIES} ${CMAKE_THREAD_LIBS_INIT})
  install(TARGETS ${NAME} DESTINATION bin)
endfunction(add_exec_with_boost)

add_exec_with_boost(http_server_async)


