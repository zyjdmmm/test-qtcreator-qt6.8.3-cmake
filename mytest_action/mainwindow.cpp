#include "mainwindow.h"
#include "./ui_mainwindow.h"
#include <QMenu>
#include <QMessageBox>
#include <QToolBar>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    
    // 创建菜单栏
    QMenuBar *menuBar = this->menuBar();
    
    // 创建文件菜单
    QMenu *fileMenu = menuBar->addMenu(tr("文件(&F)"));
    
    // 创建文件菜单的Action
    actionNew = new QAction(tr("新建(&N)"), this);
    actionNew->setShortcut(QKeySequence::New);
    actionNew->setStatusTip(tr("创建新文件"));
    
    actionOpen = new QAction(tr("打开(&O)"), this);
    actionOpen->setShortcut(QKeySequence::Open);
    actionOpen->setStatusTip(tr("打开文件"));
    
    actionSave = new QAction(tr("保存(&S)"), this);
    actionSave->setShortcut(QKeySequence::Save);
    actionSave->setStatusTip(tr("保存文件"));
    
    actionExit = new QAction(tr("退出(&E)"), this);
    actionExit->setShortcut(QKeySequence::Quit);
    actionExit->setStatusTip(tr("退出应用程序"));
    
    // 将Action添加到文件菜单
    fileMenu->addAction(actionNew);
    fileMenu->addAction(actionOpen);
    fileMenu->addAction(actionSave);
    fileMenu->addSeparator(); // 添加分隔线
    fileMenu->addAction(actionExit);
    
    // 创建编辑菜单
    QMenu *editMenu = menuBar->addMenu(tr("编辑(&E)"));
    
    // 创建编辑菜单的Action
    actionCopy = new QAction(tr("复制(&C)"), this);
    actionCopy->setShortcut(QKeySequence::Copy);
    actionCopy->setStatusTip(tr("复制选中内容"));
    
    actionCut = new QAction(tr("剪切(&X)"), this);
    actionCut->setShortcut(QKeySequence::Cut);
    actionCut->setStatusTip(tr("剪切选中内容"));
    
    actionPaste = new QAction(tr("粘贴(&P)"), this);
    actionPaste->setShortcut(QKeySequence::Paste);
    actionPaste->setStatusTip(tr("粘贴内容"));
    
    // 将Action添加到编辑菜单
    editMenu->addAction(actionCopy);
    editMenu->addAction(actionCut);
    editMenu->addAction(actionPaste);
    
    // 创建查看菜单
    QMenu *viewMenu = menuBar->addMenu(tr("查看(&V)"));
    
    // 创建查看菜单的Action
    actionToolBar = new QAction(tr("工具栏(&T)"), this);
    actionToolBar->setCheckable(true);
    actionToolBar->setChecked(true);
    actionToolBar->setStatusTip(tr("显示或隐藏工具栏"));
    
    actionStatusBar = new QAction(tr("状态栏(&S)"), this);
    actionStatusBar->setCheckable(true);
    actionStatusBar->setChecked(true);
    actionStatusBar->setStatusTip(tr("显示或隐藏状态栏"));
    
    // 将Action添加到查看菜单
    viewMenu->addAction(actionToolBar);
    viewMenu->addAction(actionStatusBar);
    
    // 连接信号和槽
    connect(actionNew, &QAction::triggered, this, &MainWindow::onFileNew);
    connect(actionOpen, &QAction::triggered, this, &MainWindow::onFileOpen);
    connect(actionSave, &QAction::triggered, this, &MainWindow::onFileSave);
    connect(actionExit, &QAction::triggered, this, &MainWindow::onFileExit);
    
    connect(actionCopy, &QAction::triggered, this, &MainWindow::onEditCopy);
    connect(actionCut, &QAction::triggered, this, &MainWindow::onEditCut);
    connect(actionPaste, &QAction::triggered, this, &MainWindow::onEditPaste);
    
    connect(actionToolBar, &QAction::triggered, this, &MainWindow::onViewToolBar);
    connect(actionStatusBar, &QAction::triggered, this, &MainWindow::onViewStatusBar);
    
    // 添加状态栏
    this->setStatusBar(ui->statusbar);
    
    // 为了使例子更简洁，这里不添加工具栏，只保留菜单栏
    // 如果需要工具栏，可以取消下面的注释
    /*
    QToolBar *toolBar = this->addToolBar(tr("工具栏"));
    toolBar->addAction(actionNew);
    toolBar->addAction(actionOpen);
    toolBar->addAction(actionSave);
    toolBar->addSeparator();
    toolBar->addAction(actionCopy);
    toolBar->addAction(actionCut);
    toolBar->addAction(actionPaste);
    */
}

MainWindow::~MainWindow()
{
    delete ui;
}

// 文件菜单槽函数实现
void MainWindow::onFileNew()
{
    QMessageBox::information(this, tr("新建"), tr("新建文件功能"));
}

void MainWindow::onFileOpen()
{
    QMessageBox::information(this, tr("打开"), tr("打开文件功能"));
}

void MainWindow::onFileSave()
{
    QMessageBox::information(this, tr("保存"), tr("保存文件功能"));
}

void MainWindow::onFileExit()
{
    this->close();
}

// 编辑菜单槽函数实现
void MainWindow::onEditCopy()
{
    QMessageBox::information(this, tr("复制"), tr("复制功能"));
}

void MainWindow::onEditCut()
{
    QMessageBox::information(this, tr("剪切"), tr("剪切功能"));
}

void MainWindow::onEditPaste()
{
    QMessageBox::information(this, tr("粘贴"), tr("粘贴功能"));
}

// 查看菜单槽函数实现
void MainWindow::onViewToolBar()
{
    QList<QToolBar*> toolBars = this->findChildren<QToolBar*>();
    foreach (QToolBar *toolBar, toolBars) {
        toolBar->setVisible(actionToolBar->isChecked());
    }
}

void MainWindow::onViewStatusBar()
{
    ui->statusbar->setVisible(actionStatusBar->isChecked());
}
