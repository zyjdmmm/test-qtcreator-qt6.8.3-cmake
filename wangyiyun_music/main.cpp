#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/wangyiyun_music/main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    engine.load(url);

    //注册单例(其实不需要注册单例，只需要qmldir)
    // qmlRegisterSingletonType(QUrl::fromLocalFile("./BasicConfig.qml"),"BasicConfig",1,0,"BasicConfig");

    return app.exec();
}
