pragma Singleton
import QtQuick

QtObject {
    property string appName: "WangYiYun Music"
    property int appVersion: 1
    
    signal dataChanged(string newData)
    
    function showMessage(msg) {
        console.log("AppSingleton:", msg)
    }
}
