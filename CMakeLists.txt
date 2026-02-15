cmake_minimum_required (VERSION 3.19) #find_package(QT NAMES Qt6 Qt5 REQUIRED) #CMake 3.19+之后，2021年Qt官方和CMake官方约定好的QT名称

project(test-qtcreator-qt6.8.3-cmake)



#-------------------------------------------#
# 默认选择RelWithDebInfo模式(因为如果用户忘记选择，cmake会可能随机选择Debug或Release,在不同的编译器不确定)

# 这样小白用户手动编译忘记选择的情况下至少能保证调试
# 如果是clion或者vscode会传递Debug/Debug/RelWithDebInfo/RelWithDebInfo会覆盖这里的值，这样就能外部指定

#有如下四种编译CMakeLists.txt的方法:
# cmake -B build -DCMAKE_BUILD_TYPE=Debug
# cmake -B build -DCMAKE_BUILD_TYPE=Release
# cmake -B build -DCMAKE_BUILD_TYPE=RelWithDebInfo
# cmake -B build -DCMAKE_BUILD_TYPE=MinSizeRel
#-------------------------------------------#
if(NOT CMAKE_BUILD_TYPE)
    # set default build type to RelWithDebInfo, we never supported multi config generators, therefore this is fine
    set(CMAKE_BUILD_TYPE "RelWithDebInfo" CACHE STRING "Choose the type of build, options are: Debug Release RelWithDebInfo MinSizeRel." FORCE)
endif()


# -------------------------------------------#
# 解决 vs2015 Update 3版本 ~vs2019编译器不识别utf-8的问题, ai从Qt、OpenCV偷来的 (固定配置不用改)
# 注意:我发现必须放在顶层CMakeLists.txt，放在子项目的CMakeLists.txt没效果
# 注意:vs2019、vs2022我测试过没问题
# 注意:mingw64不需要这段话
# -------------------------------------------#
# 仅对 MSVC 编译器设置 UTF-8 编码（兼容 VS2015 ~ VS2022）
if (MSVC)
    # 禁用 C4819 编码警告（全版本通用）
    add_compile_options("/wd4819")

    # MSVC_VERSION 对应关系：
    # VS2015 = 1900, VS2017 = 1910+, VS2019 = 1920+, VS2022 = 1930+
    if (MSVC_VERSION LESS 1920)
        # VS2015/2017：仅支持拆分式 UTF-8 选项
        add_compile_options("/source-charset:utf-8")
        add_compile_options("/execution-charset:utf-8")
    else ()
        # VS2019/2022：使用合并式 /utf-8（避免和默认配置冲突）
        add_compile_options("/utf-8")
    endif ()

    # 额外：确保不会同时出现两种 UTF-8 选项（防御性处理）
    string(REPLACE "/source-charset:utf-8" "" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
    string(REPLACE "/execution-charset:utf-8" "" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
    string(REPLACE "/utf-8" "" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
    # 重新添加适配版本的选项（覆盖可能的冲突配置）
    if (MSVC_VERSION LESS 1920)
        list(APPEND CMAKE_CXX_FLAGS "/source-charset:utf-8" "/execution-charset:utf-8")
    else ()
        list(APPEND CMAKE_CXX_FLAGS "/utf-8")
    endif ()
endif ()




# 一定要放在最后面，因为前面的设置放后面可能导致子项目先编译但是配置还没生效
add_subdirectory(mytest_minimize)
add_subdirectory(mytest_github_theme_myobject)
add_subdirectory(mytest_action)
# add_subdirectory(musicbox)


add_subdirectory(wangyiyun_music)
add_subdirectory(wangyiyun_music_test)
add_subdirectory(material_test)
add_subdirectory(GenerateMdTitle)
add_subdirectory(wangyiyun_music_test_1)
add_subdirectory(FluentWinUI3_test)
