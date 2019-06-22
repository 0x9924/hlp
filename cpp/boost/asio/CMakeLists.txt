cmake_minimum_required(VERSION 2.8.9)  
project(hlp/cpp/boost/asio)  


set(BOOST_ROOT /opt/boost)
set(Boost_USE_STATIC_LIBS ON)
find_package(Threads)
include_directories(${Boost_INCLUDE_DIR})

find_package(Boost COMPONENTS system)


add_executable(client client.cpp)
target_link_libraries(client ${Boost_LIBRARIES})
target_link_libraries(client ${CMAKE_THREAD_LIBS_INIT} )

add_executable(client-http client-http.cpp)
target_link_libraries(client-http ${Boost_LIBRARIES})
target_link_libraries(client-http ${CMAKE_THREAD_LIBS_INIT} )
