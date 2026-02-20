pragma Singleton
import QtQuick

QtObject {
    //第二步：声明信号
    signal openLoginPopup()   //扫码弹窗登录

    readonly property  string commonFont: "微软雅黑 Light"
}
