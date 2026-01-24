project(wangyiyun_music)

#-------------------------------------------#
# Qt 核心自动编译工具(固定的不用改)
#-------------------------------------------#
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)



#-------------------------------------------#
# 这句找qt自定义的函数狗屎必须放在最开头
# 注意:最后链接qt提供的库还要再链接一次(你去看qt的任意添加库的文档就是要添加两次)
#-------------------------------------------#
find_package(Qt6 REQUIRED COMPONENTS QuickControls2 Quick) #cmake与qt有狗屁交易，找到了qt自定义的函数

#-------------------------------------------#
#手动添加你的源文件
#-------------------------------------------#
qt_add_executable(${PROJECT_NAME}
    main.cpp
)

#-------------------------------------------#
# 资源文件
#
# 用qt_add_resources：只能通过 engine.load(QUrl(":/xxx.qml")) 直接加载，无法 import
# 用qt_add_qml_module：可通过 import 模块名导入使用，是 Qt 6 推荐的 QML 组件化方式
#-------------------------------------------#
qt_add_qml_module(${PROJECT_NAME}
    URI ${PROJECT_NAME}
    VERSION 1.0
    RESOURCES image.qrc

    # 这里是qt自动添加
    QML_FILES main.qml pages/LeftPage.qml pages/PlayMusicPage.qml pages/RightPage.qml
    QML_FILES pages/AGiaoMusicMainWindows.qml
    QML_FILES components/SearchRow.qml
)

#-------------------------------------------#
#最后链接qt提供的库
#-------------------------------------------#
target_link_libraries(${PROJECT_NAME}
    PRIVATE
    Qt6::Quick
    Qt6::QuickControls2
)


#-------------------------------------------#
# 属性配置(固定的不用改)
#-------------------------------------------#
set_target_properties(${PROJECT_NAME} PROPERTIES
    WIN32_EXECUTABLE TRUE                        # 如果没有这个，双击exe即使在release模式也会弹出黑控制台
)

