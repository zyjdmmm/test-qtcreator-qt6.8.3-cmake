project(mytest_minimize)

#-------------------------------------------#
# Qt 核心自动编译工具(固定的不用改)
#-------------------------------------------#
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)


#-------------------------------------------#
#

#-------------------------------------------#
# 兼容查找 Qt6/Qt5 Widgets（核心：Windows GUI 必需）和SQL模块
find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Widgets Sql)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Widgets Sql)

add_executable(${PROJECT_NAME} 
        main.cpp
        mainwindow.cpp
        mainwindow.h
        mainwindow.ui
        # 如有.qrc资源文件，添加到这里，比如：resources.qrc
)


# 链接 Qt 库（必需：PRIVATE 表示仅当前项目使用）
target_link_libraries(${PROJECT_NAME} PRIVATE Qt${QT_VERSION_MAJOR}::Widgets Qt${QT_VERSION_MAJOR}::Sql)


#-------------------------------------------#
# 属性配置(固定的不用改)
#-------------------------------------------#

# 如果没有这个，双击exe即使在release模式也会弹出黑控制台
set_target_properties(${PROJECT_NAME} PROPERTIES
    WIN32_EXECUTABLE TRUE
)


