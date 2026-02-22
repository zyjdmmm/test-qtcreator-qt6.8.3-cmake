pragma Singleton
import QtQuick

QtObject {
    //第二步：声明信号
    signal openLoginPopup()   //扫码弹窗登录

    readonly property  string commonFont: "微软雅黑 Light"
    readonly property color fieldTextColor: "#d9d9da"           // 输入文本框中的默认字体颜色
    readonly property color defaultFontNormalColor: "#a1a1a3"   // 文字正常状态下的默认颜色
    readonly property color fieldBgColor: "#222"                // 输入文本框当中的背景色
}

