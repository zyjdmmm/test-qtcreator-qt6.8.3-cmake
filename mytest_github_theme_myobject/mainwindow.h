#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>

QT_BEGIN_NAMESPACE
namespace Ui {
class MainWindow;
}
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

private slots:
    void on_login_btn_clicked();
    void on_close_btn_clicked();
    void on_mini_btn_clicked();
    void on_home_btn_clicked();
    void on_personal_btn_clicked();
    void on_report_btn_clicked();
    void on_notes_btn_clicked();
    void on_pay_btn_clicked();

private:
    Ui::MainWindow *ui;
    void loadQSS();
};
#endif // MAINWINDOW_H