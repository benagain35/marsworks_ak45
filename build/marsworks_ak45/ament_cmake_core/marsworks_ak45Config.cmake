# generated from ament/cmake/core/templates/nameConfig.cmake.in

# prevent multiple inclusion
if(_marsworks_ak45_CONFIG_INCLUDED)
  # ensure to keep the found flag the same
  if(NOT DEFINED marsworks_ak45_FOUND)
    # explicitly set it to FALSE, otherwise CMake will set it to TRUE
    set(marsworks_ak45_FOUND FALSE)
  elseif(NOT marsworks_ak45_FOUND)
    # use separate condition to avoid uninitialized variable warning
    set(marsworks_ak45_FOUND FALSE)
  endif()
  return()
endif()
set(_marsworks_ak45_CONFIG_INCLUDED TRUE)

# output package information
if(NOT marsworks_ak45_FIND_QUIETLY)
  message(STATUS "Found marsworks_ak45: 0.0.0 (${marsworks_ak45_DIR})")
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "Package 'marsworks_ak45' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  # optionally quiet the deprecation message
  if(NOT ${marsworks_ak45_DEPRECATED_QUIET})
    message(DEPRECATION "${_msg}")
  endif()
endif()

# flag package as ament-based to distinguish it after being find_package()-ed
set(marsworks_ak45_FOUND_AMENT_PACKAGE TRUE)

# include all config extra files
set(_extras "")
foreach(_extra ${_extras})
  include("${marsworks_ak45_DIR}/${_extra}")
endforeach()
