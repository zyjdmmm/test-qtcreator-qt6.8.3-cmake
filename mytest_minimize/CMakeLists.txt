project(mytest_minimize)

#-------------------------------------------#
# Qt 核心自动编译工具(固定的不用改)
#-------------------------------------------#
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)


#-------------------------------------------#
#手动添加你的源文件
#-------------------------------------------#
add_executable(${PROJECT_NAME} 
        main.cpp
        mainwindow.cpp
        mainwindow.h
        mainwindow.ui
        # 如有.qrc资源文件，添加到这里，比如：resources.qrc
)

#-------------------------------------------#
#查找qt提供的库
#-------------------------------------------#
#
find_package(QT NAMES Qt6 Qt5 REQUIRED) #CMake 3.19+之后，2021年Qt官方和CMake官方约定好的QT名称，cmake会去找到QT6Config.cmake，首先查找QT6，如果没有查找QT5，随后定义QT_VERSION_MAJOR变量
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Widgets Sql)

# 链接 Qt 库（必需：PRIVATE 表示仅当前项目使用）
target_link_libraries(${PROJECT_NAME} PRIVATE
    Qt${QT_VERSION_MAJOR}::Widgets
    Qt${QT_VERSION_MAJOR}::Sql
)


#-------------------------------------------#
# 属性配置(固定的不用改)
#-------------------------------------------#
set_target_properties(${PROJECT_NAME} PROPERTIES
    WIN32_EXECUTABLE TRUE                        # 如果没有这个，双击exe即使在release模式也会弹出黑控制台
)


