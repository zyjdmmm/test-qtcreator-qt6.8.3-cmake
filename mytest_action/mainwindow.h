#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QAction>

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
    // 文件菜单槽函数
    void onFileNew();
    void onFileOpen();
    void onFileSave();
    void onFileExit();
    
    // 编辑菜单槽函数
    void onEditCopy();
    void onEditCut();
    void onEditPaste();
    
    // 查看菜单槽函数
    void onViewToolBar();
    void onViewStatusBar();

private:
    Ui::MainWindow *ui;
    
    // 文件菜单Action
    QAction *actionNew;
    QAction *actionOpen;
    QAction *actionSave;
    QAction *actionExit;
    
    // 编辑菜单Action
    QAction *actionCopy;
    QAction *actionCut;
    QAction *actionPaste;
    
    // 查看菜单Action
    QAction *actionToolBar;
    QAction *actionStatusBar;
};

#endif // MAINWINDOW_H
