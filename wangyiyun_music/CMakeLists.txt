project(wangyiyun_music)

#-------------------------------------------#
# Qt 核心自动编译工具(固定的不用改)
# 注意：qtcreator不会添加图片的qrc时自动添加set(CMAKE_AUTORCC ON)，简直是有大病
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
qt_add_executable(app${PROJECT_NAME}
    main.cpp
)

#-------------------------------------------#
# 资源文件
#
# 用qt_add_resources：只能通过 engine.load(QUrl(":/xxx.qml")) 直接加载，无法 import
# 用qt_add_qml_module：可通过 import 模块名导入使用，是 Qt 6 推荐的 QML 组件化方式

# 注意：qt官方写法所有地方都要添加app前缀为app${PROJECT_NAME}，除了这里URI ${PROJECT_NAME}。
# 原因：加入没有app前缀，在windows系统可以编译成功，但是linux会报错找不到程序，我发现根本原因是在build文件夹会生成比如aaa文件夹和aaa可执行文件，因为aaa可执行文件在linux没有exe后缀，所以qtcreator错误找到了aaa文件夹
#-------------------------------------------#
qt_add_qml_module(app${PROJECT_NAME}
    URI ${PROJECT_NAME}     # 注意只有这里不加app前缀，这是官方写法
    VERSION 1.0
    RESOURCES image.qrc

    # 这里是qt自动添加
    QML_FILES main.qml pages/LeftPage.qml pages/PlayMusicPage.qml pages/RightPage.qml
    QML_FILES pages/AGiaoMusicMainWindows.qml
    QML_FILES components/SearchRow.qml
    QML_FILES basic/BasicConfig.qml basic/qmldir
    QML_FILES pages/LoginPopupPage.qml
#    QML_FILES pages/LoginPopupByOtherMeansPage.qml
)

#-------------------------------------------#
#最后链接qt提供的库
#-------------------------------------------#
target_link_libraries(app${PROJECT_NAME}
    PRIVATE
    Qt6::Quick
    Qt6::QuickControls2
)


#-------------------------------------------#
# 属性配置(固定的不用改)
#-------------------------------------------#
set_target_properties(app${PROJECT_NAME} PROPERTIES
    WIN32_EXECUTABLE TRUE                        # 如果没有这个，双击exe即使在release模式也会弹出黑控制台
)

