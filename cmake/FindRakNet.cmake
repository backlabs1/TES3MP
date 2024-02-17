# Copyright © 2024 backlabs1 <backlabs1@mailbox.org>
#
# Distributed under the GNU General Public License version 3 as published by
# the Free Software Foundation.

#[=======================================================================[.rst:
FindRakNet
-------

Finds the RakNet library.

Imported Targets
^^^^^^^^^^^^^^^^

This module provides the following imported targets, if found:

``RakNet::RakNet``
  The RakNet library

Result Variables
^^^^^^^^^^^^^^^^

This will define the following variables:

``RakNet_FOUND``
  True if the system has the RakNet library.
``RakNet_INCLUDE_DIRS``
  Include directories needed to use RakNet.
``RakNet_LIBRARIES``
  Libraries needed to link to RakNet.

Cache Variables
^^^^^^^^^^^^^^^

The following cache variables may also be set:

``RakNet_INCLUDE_DIR``
  The directory containing ``RakPeer.h``.
``RakNet_LIBRARY_DEBUG``
  The path to the RakNet library (Debug configuration).
``RakNet_LIBRARY_RELEASE``
  The path to the RakNet library (Release configuration).

#]=======================================================================]

find_path(RakNet_INCLUDE_DIR
  NAMES RakPeer.h
  PATHS /usr /usr/local /opt/local ${RakNet_INCLUDES}
        ENV CPATH ENV RAKNET_ROOT
  PATH_SUFFIXES include include/raknet RakNet raknet
)
find_library(RakNet_LIBRARY_RELEASE
  NAMES RakNetLibStatic
  PATHS /usr /usr/local /opt/local
        ENV LD_LIBRARY_PATH ENV LIBRARY_PATH ENV RAKNET_ROOT
  PATH_SUFFIXES lib lib64
)
find_library(RakNet_LIBRARY_DEBUG
  NAMES RakNetLibStaticd
  PATHS /usr /usr/local /opt/local
        ENV LD_LIBRARY_PATH ENV LIBRARY_PATH ENV RAKNET_ROOT
  PATH_SUFFIXES lib lib64
)

include(SelectLibraryConfigurations)
select_library_configurations(RakNet)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(RakNet
  FOUND_VAR RakNet_FOUND
  REQUIRED_VARS
    RakNet_LIBRARY
    RakNet_INCLUDE_DIR
)

if(RakNet_FOUND)
  if(WIN32)
    set(RakNet_LIBRARY "${RakNet_LIBRARY}" ws2_32.lib)
  endif()
  set(RakNet_LIBRARIES ${RakNet_LIBRARY})
  set(RakNet_INCLUDE_DIRS ${RakNet_INCLUDE_DIR})
  if (NOT TARGET RakNet::RakNet)
    add_library(RakNet::RakNet UNKNOWN IMPORTED)
  endif()
  if (RakNet_LIBRARY_RELEASE)
    set_property(TARGET RakNet::RakNet APPEND PROPERTY
      IMPORTED_CONFIGURATIONS RELEASE
    )
    set_target_properties(RakNet::RakNet PROPERTIES
      IMPORTED_LOCATION_RELEASE "${RakNet_LIBRARY_RELEASE}"
    )
  endif()
  if (RakNet_LIBRARY_DEBUG)
    set_property(TARGET RakNet::RakNet APPEND PROPERTY
      IMPORTED_CONFIGURATIONS DEBUG
    )
    set_target_properties(RakNet::RakNet PROPERTIES
      IMPORTED_LOCATION_DEBUG "${RakNet_LIBRARY_DEBUG}"
    )
  endif()
  set_target_properties(RakNet::RakNet PROPERTIES
    INTERFACE_INCLUDE_DIRECTORIES "${RakNet_INCLUDE_DIR}"
  )
  message(STATUS "Found RakNet_INCLUDE_DIRS: ${RakNet_INCLUDE_DIRS}")
endif()

mark_as_advanced(
  RakNet_INCLUDE_DIR
  RakNet_LIBRARY_DEBUG
  RakNet_LIBRARY_RELEASE
)
