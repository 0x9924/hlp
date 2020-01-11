cmake_minimum_required(VERSION 2.8.9)  
project(asio_tutorial)  

set(Boost_USE_STATIC_LIBS ON)

# find_package(Threads)
find_package(Boost COMPONENTS system)
find_package(Boost COMPONENTS thread)

include_directories(SYSTEM ${Boost_INCLUDE_DIR})


file( GLOB SOURCES "*.cpp")

foreach(source_file ${SOURCES})
  string( REPLACE ".cpp" "" namepath ${source_file} )
  get_filename_component(fname ${namepath} NAME)
  set(name ${fname})
  add_executable( ${name} ${source_file} )
  target_compile_options(${name} PRIVATE -lboost_system -lboost_thread -pthread)
  target_link_libraries(${name} ${Boost_LIBRARIES})
  target_link_libraries(${name} ${CMAKE_THREAD_LIBS_INIT} )

endforeach(source_file)
