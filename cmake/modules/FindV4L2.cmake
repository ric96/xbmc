#.rst:
# FindV4L2
# -------
# Finds the V4L2 header
#
# This will will define the following variables::
#
# V4L2_FOUND - system has V4L2
# V4L2_LIBRARY - the V4L2 library
# V4L2_INCLUDE_DIRS - the V4L2 include directory
# V4L2_DEFINITIONS - the V4L2 definitions
#

if(PKG_CONFIG_FOUND)
  pkg_check_modules(PC_V4L2 v4l2 QUIET)
endif()

find_path(V4L2_INCLUDE_DIR NAMES libv4l2.h
                           PATHS ${PC_V4L2_INCLUDEDIR})

find_library(V4L2_LIBRARY NAMES v4l2
                          PATHS ${PC_V4L2_LIBDIR})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(V4L2
                                  REQUIRED_VARS V4L2_INCLUDE_DIR V4L2_LIBRARY)

if(V4L2_FOUND)
  set(V4L2_LIBRARIES ${V4L2_LIBRARY})
  set(V4L2_INCLUDE_DIRS ${V4L2_INCLUDE_DIR})
  set(V4L2_DEFINITIONS -DHAVE_V4L2=1)
endif()

mark_as_advanced(V4L2_INCLUDE_DIRS V4L2_LIBRARIES)
