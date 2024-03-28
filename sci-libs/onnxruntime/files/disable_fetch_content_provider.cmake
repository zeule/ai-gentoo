# Always ensure we have the policy settings this provider expects
cmake_minimum_required(VERSION 3.24)

macro(disable_fetch_provider method package_name)
    set(multi_keywords FIND_PACKAGE_ARGS)

    message(STATUS "ARGN: ${ARGN}")
    cmake_parse_arguments(ARG_ "" "" "${multi_keywords}" ${ARGN})
    message(STATUS "FPA: ${ARG_FIND_PACKAGE_ARGS}")

    if (ARG_FIND_PACKAGE_ARGS)
        list(GET ARG_FIND_PACKAGE_ARGS 1 _name)
        find_package(${_name})
    else()
        find_package(${package_name} REQUIRED)
    endif()
endmacro()

cmake_language(
  SET_DEPENDENCY_PROVIDER disable_fetch_provider
  SUPPORTED_METHODS FETCHCONTENT_MAKEAVAILABLE_SERIAL
)
