cmake_minimum_required( version 2.8 )

set (FULL_LIB_LIST
   /usr/lib/libboost_thread.so
   /usr/lib/libboost_serialization.so
   /usr/lib/libboost_chrono.so
   )

set (REDUNDANT_LIBS
   thread
   )

SET (ALIAS_POSITION 0)

FOREACH (LIB_ALIAS ${REDUNDANT_LIBS})
   FOREACH (LIB_NAME ${FULL_LIB_LIST})
      STRING (FIND ${LIB_NAME} ${LIB_ALIAS} ALIAS_POSITION)
      message ("lib ${LIB_NAME} alias ${LIB_ALIAS} position ${ALIAS_POSITION}")
      IF (${ALIAS_POSITION} GREATER 0)
         message ("${LIB_ALIAS} found")
         LIST (REMOVE_ITEM FULL_LIB_LIST ${LIB_NAME})
      ENDIF()
   ENDFOREACH()
ENDFOREACH()

message ("Resulting full list: ${FULL_LIB_LIST}")
