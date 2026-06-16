#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "cubemars_hardware::cubemars_hardware" for configuration ""
set_property(TARGET cubemars_hardware::cubemars_hardware APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(cubemars_hardware::cubemars_hardware PROPERTIES
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/libcubemars_hardware.so"
  IMPORTED_SONAME_NOCONFIG "libcubemars_hardware.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS cubemars_hardware::cubemars_hardware )
list(APPEND _IMPORT_CHECK_FILES_FOR_cubemars_hardware::cubemars_hardware "${_IMPORT_PREFIX}/lib/libcubemars_hardware.so" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
