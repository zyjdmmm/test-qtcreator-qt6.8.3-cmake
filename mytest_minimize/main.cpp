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
    QString c="hello";
    qDebug() << c;

    QApplication a(argc, argv);
    
    // QSQL test code
    qDebug() << "Qt SQL test started...";
    
    // Check available database drivers
    qDebug() << "Available database drivers:" << QSqlDatabase::drivers();
    
    // Create SQLite database connection
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName(":memory:"); // Use in-memory database
    
    // Open database
    if (!db.open()) {
        qDebug() << "Database open failed:" << db.lastError().text();
    } else {
        qDebug() << "Database open succeeded";
        
        // Create table
        QSqlQuery query;
        if (query.exec("CREATE TABLE test (id INT PRIMARY KEY, name TEXT)") ) {
            qDebug() << "Table created successfully";
            
            // Insert data
            query.exec("INSERT INTO test (id, name) VALUES (1, 'Alice')");
            query.exec("INSERT INTO test (id, name) VALUES (2, 'Bob')");
            query.exec("INSERT INTO test (id, name) VALUES (3, 'Charlie')");
            qDebug() << "Data inserted successfully";
            
            // Query data
            if (query.exec("SELECT * FROM test")) {
                qDebug() << "Query result:";
                while (query.next()) {
                    int id = query.value(0).toInt();
                    QString name = query.value(1).toString();
                    qDebug() << "ID:" << id << "Name:" << name;
                }
            } else {
                qDebug() << "Query failed:" << query.lastError().text();
            }
        } else {
            qDebug() << "Table creation failed:" << query.lastError().text();
        }
        
        // Close database
        db.close();
        qDebug() << "Database closed";
    }
    
    qDebug() << "Qt SQL test finished...";

    MainWindow w;
    w.show();
    return a.exec();
}
