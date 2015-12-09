cmake_minimum_required(VERSION 2.8)

set (openCvVersion "nope")
execute_process(
        COMMAND pkg-config --modversion opencv
        #COMMAND ls -l
        OUTPUT_VARIABLE openCvVersion
        )

string(REGEX MATCH cvVersion "\d\.\d\.\d" ${openCvVersion})

message( "OpenCV version: ${openCvVersion}" )
message( "cvVersion: ${cvVersion}" )
