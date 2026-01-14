#include "mainwindow.h"

#include <QApplication>
#include <QString>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlError>
#include <QDebug>


int main(int argc, char *argv[])
{
    QString b="hello";

    QApplication a(argc, argv);
    
    // QSQL测试代码
    qDebug() << "Qt SQL测试开始...";
    
    // 检查可用的数据库驱动
    qDebug() << "可用的数据库驱动:" << QSqlDatabase::drivers();
    
    // 创建SQLite数据库连接
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName(":memory:"); // 使用内存数据库
    
    // 打开数据库
    if (!db.open()) {
        qDebug() << "数据库打开失败:" << db.lastError().text();
    } else {
        qDebug() << "数据库打开成功";
        
        // 创建表
        QSqlQuery query;
        if (query.exec("CREATE TABLE test (id INT PRIMARY KEY, name TEXT)") ) {
            qDebug() << "表创建成功";
            
            // 插入数据
            query.exec("INSERT INTO test (id, name) VALUES (1, 'Alice')");
            query.exec("INSERT INTO test (id, name) VALUES (2, 'Bob')");
            query.exec("INSERT INTO test (id, name) VALUES (3, 'Charlie')");
            qDebug() << "数据插入成功";
            
            // 查询数据
            if (query.exec("SELECT * FROM test")) {
                qDebug() << "查询结果:";
                while (query.next()) {
                    int id = query.value(0).toInt();
                    QString name = query.value(1).toString();
                    qDebug() << "ID:" << id << "Name:" << name;
                }
            } else {
                qDebug() << "查询失败:" << query.lastError().text();
            }
        } else {
            qDebug() << "表创建失败:" << query.lastError().text();
        }
        
        // 关闭数据库
        db.close();
        qDebug() << "数据库关闭";
    }
    
    qDebug() << "Qt SQL测试结束...";

    MainWindow w;
    w.show();
    return a.exec();
}
