cmake_minimum_required(VERSION 2.8.9)  
project(hlp/cpp/boost/asio)  


set(BOOST_ROOT /opt/boost)
set(Boost_USE_STATIC_LIBS ON)
find_package(Threads)
include_directories(${Boost_INCLUDE_DIR})

find_package(Boost COMPONENTS system)


add_executable(client2 client2.cpp)
target_link_libraries(client2 ${Boost_LIBRARIES})
target_link_libraries(client2 ${CMAKE_THREAD_LIBS_INIT} )
