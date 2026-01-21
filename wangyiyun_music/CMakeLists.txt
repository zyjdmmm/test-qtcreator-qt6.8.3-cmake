project(wangyiyun_music)

#-------------------------------------------#
# Qt 核心自动编译工具(固定的不用改)
#-------------------------------------------#
# set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
# set(CMAKE_AUTORCC ON)
# qt_standard_project_setup() # Qt6新增：自动设置C++标准、AUTOMOC等默认配置

#-------------------------------------------#
#手动添加你的源文件
#-------------------------------------------#
find_package(Qt6 6.2 COMPONENTS Quick REQUIRED) #cmake与qt有狗屁交易，找到了qt自定义的函数

qt_add_executable(${PROJECT_NAME}
    main.cpp
)



#-------------------------------------------#
#查找qt提供的库
#-------------------------------------------#
target_link_libraries(${PROJECT_NAME}
    PRIVATE Qt6::Quick)


#-------------------------------------------#
#资源文件
#-------------------------------------------#
qt_add_qml_module(${PROJECT_NAME}
    URI wangyiyun_music
    VERSION 1.0
    QML_FILES main.qml
)


#-------------------------------------------#
# 属性配置(固定的不用改)
#-------------------------------------------#
set_target_properties(${PROJECT_NAME} PROPERTIES
    WIN32_EXECUTABLE TRUE                        # 如果没有这个，双击exe即使在release模式也会弹出黑控制台
)

