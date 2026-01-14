#include "mainwindow.h"

#include <QApplication>
#include<qstring.h>

int main(int argc, char *argv[])
{
    QString b="hello";

    QApplication a(argc, argv);
    MainWindow w;
    w.show();
    return a.exec();
}
