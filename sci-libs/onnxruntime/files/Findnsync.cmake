find_path(NSYNC_INCLUDE_DIR nsync.h)
find_library(NSYNC_LIBRARY nsync)
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(${CMAKE_FIND_PACKAGE_NAME}
	FOUND_VAR ${CMAKE_FIND_PACKAGE_NAME}_FOUND
	REQUIRED_VARS
		NSYNC_LIBRARY
		NSYNC_INCLUDE_DIR
)

if (${CMAKE_FIND_PACKAGE_NAME}_FOUND)
	add_library(nsync::nsync_cpp SHARED IMPORTED GLOBAL)
	set_target_properties(nsync::nsync_cpp
		PROPERTIES
			INTERFACE_INCLUDE_DIRECTORIES "${NSYNC_INCLUDE_DIR}"
			INTERFACE_LINK_LIBRARIES ${NSYNC_INCLUDE_DIR}
   )
endif()
