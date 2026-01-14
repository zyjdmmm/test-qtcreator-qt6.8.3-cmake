# 最低版本：Qt5 推荐3.5+，Qt6 推荐3.16+，取兼容值
cmake_minimum_required(VERSION 3.16)
# 项目名（可自定义）、版本（可选）、仅C++
project(mytest_minimize)

# Qt 核心自动编译工具（必需：处理.ui/.qrc/Q_OBJECT）
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

# C++标准：Qt5/Qt6 都兼容 C++17，足够用
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# 兼容查找 Qt6/Qt5 Widgets（核心：Windows GUI 必需）
find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Widgets)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Widgets)

# 源文件列表（替换为你的实际文件）
set(PROJECT_SOURCES
        main.cpp
        mainwindow.cpp
        mainwindow.h
        mainwindow.ui
        # 如有.qrc资源文件，添加到这里，比如：resources.qrc
)

# 生成可执行文件（Windows 桌面程序核心）
add_executable(${PROJECT_NAME} ${PROJECT_SOURCES})

# 链接 Qt 库（必需：PRIVATE 表示仅当前项目使用）
target_link_libraries(${PROJECT_NAME} PRIVATE Qt${QT_VERSION_MAJOR}::Widgets)

# Windows 专属配置（GUI 程序关键：隐藏控制台窗口）
set_target_properties(${PROJECT_NAME} PROPERTIES
    WIN32_EXECUTABLE TRUE  # 核心：双击exe不弹出黑控制台
)
