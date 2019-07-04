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

add_executable(client-https client-https.cpp)
target_link_libraries(client-https ${Boost_LIBRARIES})
target_link_libraries(client-https ${CMAKE_THREAD_LIBS_INIT} )


# beast
# add_library(boost_beast INTERFACE)

# target_include_directories(boost_beast SYSTEM PUBLIC "${CMAKE_CURRENT_LIST_DIR}/../beast/include")

# add_library(my_lib ${SOURCE_FILES})
# target_link_libraries(my_lib boost_beast)

                         
