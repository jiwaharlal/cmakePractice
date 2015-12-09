set (LocalList
    source1.cpp
    source1.h
    main.cpp
    )

set( folders
    Common
    )

AppendLocalList( LocalList AllSources )
IncludeFolders( folders )
