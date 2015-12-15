cmake_minimum_required(VERSION 2.8)

function( GetVersion PACKAGE_NAME MAJOR )
    execute_process(
        COMMAND pkg-config --modversion ${PACKAGE_NAME}
        OUTPUT_VARIABLE VERSION_STRING )
    string(STRIP ${VERSION_STRING} VERSION_STRING)
    message("Stripped version: ${VERSION_STRING}")

    string( REPLACE "." ";" VERSION_DIGITS ${VERSION_STRING} )
    set(${MAJOR} ${VERSION_STRING} PARENT_SCOPE)
    #list(GET VERSION_DIGITS 0 ${MAJOR})
endfunction( GetVersion )

GetVersion( opencv OPENCV_VERSION)

message( "OpenCV major: ${OPENCV_MAJOR}" )

set (openCvVersion "nope")
execute_process(
        COMMAND pkg-config --modversion opencv
        #COMMAND ls -l
        OUTPUT_VARIABLE openCvVersion
        )

string( REPLACE "." ";" VERSION_DIGITS ${openCvVersion} )
list(GET VERSION_DIGITS 0 VERSION_MAJOR)
list(GET VERSION_DIGITS 1 VERSION_MINOR)
list(GET VERSION_DIGITS 2 VERSION_PATCH)
string(STRIP ${VERSION_PATCH} VERSION_PATCH)

message( "major: ${VERSION_MAJOR} minor: ${VERSION_MINOR} patch: ${VERSION_PATCH}")

if ( ${VERSION_MAJOR} EQUAL "2" )
    message( "equal 2" )
else()
    message( "not equal 2" )
endif()

#string(REGEX MATCH cvVersion "\d\.\d\.\d" ${openCvVersion})

message( "OpenCV version: ${openCvVersion}" )
message( "cvVersion: ${cvVersion}" )
