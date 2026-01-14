#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QFile>
#include <QDebug>
#include<qstring.h>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    loadQSS();
    
    // 手动连接信号槽
    connect(ui->login_btn, &QPushButton::clicked, this, &MainWindow::on_login_btn_clicked);
    connect(ui->close_btn, &QPushButton::clicked, this, &MainWindow::on_close_btn_clicked);
    connect(ui->mini_btn, &QPushButton::clicked, this, &MainWindow::on_mini_btn_clicked);
    connect(ui->home_btn, &QPushButton::clicked, this, &MainWindow::on_home_btn_clicked);
    connect(ui->personal_btn, &QPushButton::clicked, this, &MainWindow::on_personal_btn_clicked);
    connect(ui->report_btn, &QPushButton::clicked, this, &MainWindow::on_report_btn_clicked);
    connect(ui->notes_btn, &QPushButton::clicked, this, &MainWindow::on_notes_btn_clicked);
    connect(ui->pay_btn, &QPushButton::clicked, this, &MainWindow::on_pay_btn_clicked);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::loadQSS()
{
    QFile file("://light.qss");
    if (file.open(QFile::ReadOnly)) {
        QString styleSheet = QLatin1String(file.readAll());
        
        qDebug() << "QSS file loaded successfully, length:" << styleSheet.length();
        
        // 将样式应用到整个应用程序
        qApp->setStyleSheet(styleSheet);
        
        file.close();
    } else {
        qDebug() << "Failed to open QSS file:" << file.errorString();
    }
}

void MainWindow::on_login_btn_clicked()
{
    qDebug() << "Login button clicked";
}

void MainWindow::on_close_btn_clicked()
{
    this->close();
}

void MainWindow::on_mini_btn_clicked()
{
    this->showMinimized();
}

void MainWindow::on_home_btn_clicked()
{
    ui->stackedWidget->setCurrentIndex(0);
}

void MainWindow::on_personal_btn_clicked()
{
    ui->stackedWidget->setCurrentIndex(1);
}

void MainWindow::on_report_btn_clicked()
{
    qDebug() << "Report button clicked";
}

void MainWindow::on_notes_btn_clicked()
{
    qDebug() << "Notes button clicked";
}

void MainWindow::on_pay_btn_clicked()
{
    qDebug() << "Pay button clicked";
}
