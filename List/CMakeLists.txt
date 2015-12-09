function( AppendLocalList subList fullList )
    if ( NOT &{fullList} )
        set (${fullList} "" PARENT_SCOPE)
    endif()

    set (localList "")
    foreach( srcFile ${${subList}})
        #message( "Source file: " ${srcFile} )
        list( APPEND localList "${CMAKE_CURRENT_LIST_DIR}/${srcFile}" )
        #set(localList ${localList} "${CMAKE_CURRENT_LIST_DIR}/${srcFile}" )
    endforeach()

    #list( APPEND ${fullList} ${localList} )
    set(${fullList} ${${fullList}} ${localList} PARENT_SCOPE)

    #message( "Sources list: " ${localList} )
    #message( "AllSources: " ${${fullList}} )

    #set(${fullLIst} ${${fullList}} PARENT_SCOPE)
endfunction()

macro( IncludeFolders folderList )
#function( IncludeFolders folderList )
    foreach( folder ${${folderList}} )
        #message( "Folder: " ${folder} )
        include( "${CMAKE_CURRENT_LIST_DIR}/${folder}/SourcesList.cmake" )
    endforeach(folder)
#endfunction()
endmacro()

#set(AllSources "")

include( SourcesList.cmake )

foreach( srcFile ${AllSources} )
    message( "src file: " ${srcFile} )
endforeach()
