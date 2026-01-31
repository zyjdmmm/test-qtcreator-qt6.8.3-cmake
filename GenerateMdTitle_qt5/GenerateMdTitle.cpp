#include <Qdebug>
#include <QTime>
#include <QTimer>
//#include <QThread>
#include <QPushButton>
//#include <QMessageBox>
//#include <QListWidgetItem>
//#include <QPixmap>
//#include <QTreeWidget>
//#include <QTableWidget>
//#include <QTimer>
//
//#include <QSqlDatabase>
//#include <QSqlError>
//#include <QSqlQuery>
#include <QHBoxLayout>
#include <QMessageBox>
#include <QTextOption>
#include <QClipboard>
#include <QApplication>
//#include <QxtGlobalShortcut>

#include "GenerateMdTitle.h"
//#include "../../../common/tool/ApplicationTools.h"//只还需要在右侧将.cpp所在文件添进去即可，不然vs找不到.cpp文件
//#include "../../../common/log/Log.h"
//#include "../../../common/tool/Tools.h"
//#include "../../../common/tool/StringTools.h"



#include <QWidget>
#include <QLabel>
#include <QVBoxLayout>
#include <QTimer>
#include <QShortcut>


//以后再来弄，还要用队列重排多个消息
//NotifyManager *gp_notifyManager = nullptr;
//void initNotifyManager()
//{
//	gp_notifyManager = new NotifyManager();
//}

//gp_notifyManager->notify(QString::fromLocal8Bit("失败"), errorStr, filePath, "");

class NotificationWidget : public QWidget {
public:
	NotificationWidget(const QString &message, int duration, QWidget *parent = nullptr) : QWidget(parent) {
		// 设置窗口样式
		setWindowFlags(Qt::FramelessWindowHint | Qt::WindowStaysOnTopHint);
		setAttribute(Qt::WA_TranslucentBackground);

		// 创建标签并设置消息
		QLabel *label = new QLabel(message, this);
		label->setStyleSheet("background-color: rgba(0, 0, 0, 0.7); color: white; padding: 10px; border-radius: 5px;");
		label->setAlignment(Qt::AlignCenter);

		// 设置布局
		QVBoxLayout *layout = new QVBoxLayout(this);
		layout->addWidget(label);
		layout->setAlignment(Qt::AlignCenter);
		setLayout(layout);

		// 设置窗口大小
		adjustSize();

		// 获取当前活动窗口的大小和位置
		QWidget *activeWindow = QApplication::activeWindow();
		if (activeWindow) {
			int windowX = activeWindow->x();
			int windowY = activeWindow->y();
			int windowWidth = activeWindow->width();
			int windowHeight = activeWindow->height();

			// 定位到当前活动窗口的中央
			move(windowX + (windowWidth - width()) / 2,
				windowY + (windowHeight - height()) / 2);
		}

		// 设置定时器，自动关闭窗口
		QTimer::singleShot(duration, this, &NotificationWidget::close);
	}
};




GenerateMdTitle::GenerateMdTitle(QWidget *parent)
	: QMainWindow(parent)
{
	ui.setupUi(this);

	//这里写测试代码（2023/7/25测试是可以编译的，每次配环境好麻烦）


	// 初始化日志系统
	//{
	//	// 注意：需要手动创建日志配置文件，位于exe所在的目录/configs/log4cplus.properties(log4cplus.properties文件在common库中有)
	//	Log::setDefaultLoggerName(QStringLiteral("GenerateMdTitle"));//注意：必须填入log4cplus.properties中第一行设定的"log4cplus.logger.GenerateMdTitle"中"GenerateMdTitle"完全一致，不然会报错
	//	Log::initLog4cplus();//注意要手动创建在本工程根目录的./log/log.log文件
	//	//QString str=ApplicationTools::getCurrentAppName();
	//	//Log::info(str);
	//	//Log::error(QStringLiteral("yes"));
	//}
	
	//这个皮肤要求手动设置属性，并且setProperty必须在setStyleSheet之前不然有不显示的bug
	{
		//寻找所有的QPushButton控件，qt只能一个个设置没其他方法
		for (QObject *o : this->findChildren<QPushButton *>())
		{
			qDebug() << "ui->centralwidget->findChildren<QPushButton *>:" << o->objectName();
			o->setProperty("Color", "Secondary");
		}

		//这个要特殊点，只能这样写
		for (QTabWidget *o : ui.centralWidget->findChildren<QTabWidget *>())
		{
			qDebug() << "ui->centralwidget->findChildren<QTabWidget *>:" << o->objectName();
			o->tabBar()->setProperty("Color", "Primary");
		}





		for (QObject *o : ui.centralWidget->findChildren<QSpinBox *>())
		{
			qDebug() << "ui->centralwidget->findChildren<QSpinBox *>:" << o->objectName();
			o->setProperty("Color", "Primary");
		}

		for (QObject *o : ui.centralWidget->findChildren<QCheckBox *>())
		{
			qDebug() << "ui->centralwidget->findChildren<QCheckBox *>:" << o->objectName();
			o->setProperty("Color", "Primary");
		}

		for (QObject *o : ui.centralWidget->findChildren<QComboBox *>())
		{
			qDebug() << "ui->centralwidget->findChildren<QComboBox *>:" << o->objectName();
			o->setProperty("Color", "Primary");
		}

		for (QObject *o : ui.centralWidget->findChildren<QPlainTextEdit *>())
		{
			qDebug() << "ui->centralwidget->findChildren<QPlainTextEdit *>:" << o->objectName();
			o->setProperty("Color", "Primary");
		}

		for (QObject *o : ui.centralWidget->findChildren<QLabel *>())
		{
			qDebug() << "ui->centralwidget->findChildren<QLabel *>:" << o->objectName();
			o->setProperty("Color", "Primary");
		}

		for (QObject *o : ui.centralWidget->findChildren<QTextBrowser *>())
		{
			qDebug() << "ui->centralwidget->findChildren<QTextBrowser *>:" << o->objectName();
			o->setProperty("Color", "Primary");
		}

	}



	qApp->setStyleSheet(QssTheme::getQssTheme(QString::fromLocal8Bit("QtTheme_Flat_Light_Teal_Green")));

	//这就麻烦了，每个图标似乎都要手动设置一下:
	//ui.generatePushButton2->setProperty("Color", "Primary");
	//ui.upPushButton->setProperty("Color", "Secondary");`
	//ui.generateTextBrowser3->setProperty("Color", "Danger");

	//// 假设这是在你的窗口类的构造函数或某个初始化函数中
	//QList<QPushButton*> buttons = this->findChildren<QPushButton*>();

	// 查找所有 QPushButton，包括子类的子类
	QList<QPushButton*> buttons = this->findChildren<QPushButton*>("", Qt::FindChildrenRecursively);

	//for (QPushButton* button : buttons) {
	//	button->setProperty("Color", "Secondary");
	//}






	//可以直接给MainWindow中自带的中心窗口centralWidget设置布局,但是此时不能再去ui界面中放置控件。
	//因为控件在底下，布局在上面会遮住控件
	{
		//设置布局
		//QHBoxLayout *h = new QHBoxLayout;
		//ui.centralWidget->setLayout(h);
		//h->addWidget(new QPushButton());//改这里即可！！！

	}


	//申请的局部变量变量，放到构造函数中被销毁后快捷键失效
	//要么你放在private中
	//要么放在main()函数
	{
		// 捕获全局的快捷方式。即使当前界面没有获取焦点(我发现优先级非常高，会劫持其他同样的快捷键)
		setQxtGlobalShortcut("Ctrl+Shift+up", globalShortcut1);
		connect(&globalShortcut1, &QxtGlobalShortcut::activated, this, &GenerateMdTitle::upPushButton);

		setQxtGlobalShortcut("Ctrl+Shift+down", globalShortcut2);
		connect(&globalShortcut2, &QxtGlobalShortcut::activated, this, &GenerateMdTitle::downPushButton);
	}



	


	connect(ui.generatePushButton, &QPushButton::clicked, this, &GenerateMdTitle::slotButtonClicked);
	connect(ui.generatePushButton2, &QPushButton::clicked, this, &GenerateMdTitle::slotButtonClicked);
	connect(ui.upPushButton, &QPushButton::clicked, this, &GenerateMdTitle::slotButtonClicked);
	connect(ui.downPushButton, &QPushButton::clicked, this, &GenerateMdTitle::slotButtonClicked);
	connect(ui.generatePushButton4, &QPushButton::clicked, this, &GenerateMdTitle::slotButtonClicked);


	//ui.generateTextBrowser->setReadOnly(true);


}

void GenerateMdTitle::setQxtGlobalShortcut(QString key,QxtGlobalShortcut& globalShortcut1)
{
	QKeySequence shortcut1(key);
	globalShortcut1.setShortcut(shortcut1);

	/*const QKeySequence shortcut2("Ctrl+A");
	const QxtGlobalShortcut globalShortcut2(shortcut2);*/

	if (!globalShortcut1.isValid())
	{
		qWarning() << QString("Error: Failed to set shortcut %1").arg(shortcut1.toString());
		return ;
	}
	
}

void GenerateMdTitle::upPushButton()
{
	//清空上次内容
	ui.generateTextBrowser3->clear();


	QString modifiedText;
	QString clipboardText;
	{
		// 获取剪贴板
		QClipboard *clipboard = QApplication::clipboard();
		// 获取剪贴板内容
		clipboardText = clipboard->text();
		modifiedText = clipboardText;


		if (clipboardText.contains(QString::fromLocal8Bit("\n# ")))
		{
			// 创建并显示通知窗口，持续时间为3000毫秒（3秒）
			NotificationWidget *notification = new NotificationWidget(QString::fromLocal8Bit("错误:含有1级标题,无法整体提升"), 3000);
			notification->show();

		}
		else if (!clipboardText.contains(QString::fromLocal8Bit("# ")))
		{
			// 创建并显示通知窗口，持续时间为3000毫秒（3秒）
			NotificationWidget *notification = new NotificationWidget(QString::fromLocal8Bit("错误:无任何标题,无法整体提升"), 3000);
			notification->show();

		}
		else
		{
			// 创建并显示通知窗口，持续时间为3000毫秒（3秒）
			NotificationWidget *notification = new NotificationWidget(QString::fromLocal8Bit("整体提升1级成功"), 3000);
			notification->show();

			// 替换所有的 "#" 为 "##"
			modifiedText.replace("## ", "# ");
		}
	}



	//输出结果
	{
		//注意：我发现windows粘贴板不能疯狂复制，有概率丢失报错为OleSetClipboard: Failed to set mime data (text/plain) on clipboard: COM error 0x800401d0  (Unknown error 0x0800401d0) ( 参数错误。)
		//猜测原因：上一次复制没完成还在占用粘贴板，这一次又来了就会报错
		//解决方法:只发生修改才粘贴，减少复制次数
		if (modifiedText == clipboardText)
		{

		}
		else
		{
			//自动复制到用户粘贴板
			QClipboard* clipboard = QApplication::clipboard();
			clipboard->setText(modifiedText);
		}

		ui.generateTextBrowser3->append(modifiedText);

	}
}

void GenerateMdTitle::downPushButton()
{
	//清空上次内容
	ui.generateTextBrowser3->clear();


	QString modifiedText;
	QString clipboardText;
	{
		// 获取剪贴板
		QClipboard *clipboard = QApplication::clipboard();
		// 获取剪贴板内容
		clipboardText = clipboard->text();
		modifiedText = clipboardText;

		if (clipboardText.contains(QString::fromLocal8Bit("###### ")))
		{
			// 创建并显示通知窗口，持续时间为3000毫秒（3秒）
			NotificationWidget *notification = new NotificationWidget(QString::fromLocal8Bit("错误:含有6级标题,无法整体降低"), 3000);
			notification->show();


		}
		else if (!clipboardText.contains(QString::fromLocal8Bit("# ")))
		{
			// 创建并显示通知窗口，持续时间为3000毫秒（3秒）
			NotificationWidget *notification = new NotificationWidget(QString::fromLocal8Bit("错误:无任何标题,无法整体降低"), 3000);
			notification->show();

		}
		else
		{
			// 创建并显示通知窗口，持续时间为3000毫秒（3秒）
			NotificationWidget *notification = new NotificationWidget(QString::fromLocal8Bit("整体降低1级成功"), 3000);
			notification->show();

			// 替换所有的 "#" 为 "##"
			modifiedText.replace("# ", "## ");
		}
	}



	//输出结果
	{
		//注意：我发现windows粘贴板不能疯狂复制，有概率丢失报错为OleSetClipboard: Failed to set mime data (text/plain) on clipboard: COM error 0x800401d0  (Unknown error 0x0800401d0) ( 参数错误。)
		//猜测原因：上一次复制没完成还在占用粘贴板，这一次又来了就会报错
		//解决方法:只发生修改才粘贴，减少复制次数
		if (modifiedText == clipboardText)
		{

		}
		else
		{
			//自动复制到用户粘贴板
			QClipboard* clipboard = QApplication::clipboard();
			clipboard->setText(modifiedText);
		}

		ui.generateTextBrowser3->append(modifiedText);


	}
}

void GenerateMdTitle::slotButtonClicked()
{
	QPushButton* button = (QPushButton*)sender();

	if (button == ui.generatePushButton)
	{
		//清空上次内容
		ui.generateTextBrowser->clear();
		//ui.generatePlainTextEdit->setWordWrapMode(QTextOption::NoWrap);//似乎没啥用


		//我测试发现扯淡是QPlainTextEdit QTextBrowser控件生成#符号且复制到typora会出现变为\#的现象？
		//但是复制到其他编辑器不会变为\#
		//试过fromLocal8Bit无效
		//我怀疑typora本身也有点问题
		if(0)
		{
			QString series;
			series.append(QString::fromLocal8Bit("!!! \\# \# # 111 222 ddd ,,, $$$ ^^^ *** ,,, ... ;;;"));
			//series.append(QString::fromUtf8("####"));
			//ui.generatePlainTextEdit->appendPlainText(series);
			//ui.generateTextEdit->append(series);
			ui.generateTextBrowser->append(series);


			return;
		}


		// 创建并显示通知窗口，持续时间为3000毫秒（3秒）
		NotificationWidget *notification = new NotificationWidget(QString::fromLocal8Bit("复制成功"), 3000);
		notification->show();



		//级别 ######
		QString series;
		for (int j = 0; j < ui.seriesComboBox->currentIndex() + 1; ++j)
		{
			series.append("#"); 
		}
		series.append(" ");

		QString result;
		for (int i = 0; i < ui.questionNumSpinBox->value(); ++i)
		{
			QString title;
			title.append(series);
			title.append(ui.titlePlainTextEdit->toPlainText());
			title.append(".");
			title.append(QString::fromLocal8Bit("%1").arg(i + 1));
			title.append("(,)");

			title.append("\n\n\n\n\n\n\n");//6行空格

			if (ui.addSelectStrCheckBox->isChecked()==true)
			{
				title.append(QString::fromLocal8Bit("选择\n"));
			}

			result.append(title);
		}

		////最后一次再添加一个空行，方便用户粘贴组合多个生成结果
		//QString emptyString;
		//emptyString.append("\n");
		//result.append(emptyString);


		//输出结果
		{
			ui.generateTextBrowser->append(result);

			//自动复制到用户粘贴板
			QClipboard* clipboard = QApplication::clipboard();
			clipboard->setText(result);
		}


	}
	else if (button == ui.generatePushButton2)
	{
		//清空上次内容
		ui.generateTextBrowser2->clear();

		// 创建并显示通知窗口，持续时间为3000毫秒（3秒）
		NotificationWidget *notification = new NotificationWidget(QString::fromLocal8Bit("复制成功"), 3000);
		notification->show();

		//级别 ######
		QString series;
		for (int j = 0; j < ui.seriesComboBox2->currentIndex() + 1; ++j)
		{
			series.append("#");
		}
		series.append(" ");

		QString result;
		for (int i = 0; i < ui.questionNumSpinBox2->value(); ++i)
		{
			QString title;
			title.append(series);
			title.append(ui.titlePlainTextEdit2->toPlainText());
			title.append("(,)");

			title.append("\n\n\n\n\n\n\n");//6行空格

			if (ui.addSelectStrCheckBox2->isChecked() == true)
			{
				title.append(QString::fromLocal8Bit("选择\n"));
			}

			result.append(title);
		}


		//输出结果
		{
			ui.generateTextBrowser2->append(result);

			//自动复制到用户粘贴板
			QClipboard* clipboard = QApplication::clipboard();
			clipboard->setText(result);
		}

	}
	else if (button == ui.downPushButton)
	{
		downPushButton();


	}
	else if (button == ui.upPushButton)
	{
		upPushButton();

	}
	else if (button == ui.generatePushButton4)
	{
		//清空上次内容
		ui.generateTextBrowser4->clear();

		// 创建并显示通知窗口，持续时间为3000毫秒（3秒）
		NotificationWidget *notification = new NotificationWidget(QString::fromLocal8Bit("复制成功"), 3000);
		notification->show();

		//级别 ######
		QString series;
		for (int j = 0; j < ui.seriesComboBox4->currentIndex() + 1; ++j)
		{
			series.append("#");
		}
		series.append(" ");

		QString result;
		for (int i = 0; i < ui.questionNumSpinBox4->value(); ++i)
		{
			QString title;
			title.append(series);
			title.append(QString("%1").arg(ui.yearsSpinBox->value() + i));
			//title.append("(,)");//没什么用不要

			title.append("\n\n\n\n\n\n\n");//6行空格

			if (ui.addSelectStrCheckBox4->isChecked() == true)
			{
				title.append(QString::fromLocal8Bit("选择\n"));
			}

			result.append(title);
		}


		//输出结果
		{
			ui.generateTextBrowser4->append(result);

			//自动复制到用户粘贴板
			QClipboard* clipboard = QApplication::clipboard();
			clipboard->setText(result);
		}

	}
	else
	{	

		assert(0);
	}
}


//读取qss主题，只需要一个qss文件夹即可
QString QssTheme::getQssTheme(const QString &QssDirName)
{
	static QString styleSheet;
	if (styleSheet.isEmpty())
	{



		//读取.qss文件
		QFile *qssFile;
		{
			QString filePath = QString("%1/theme/%2/theme.qss").arg(qApp->applicationDirPath()).arg(QssDirName);
			qssFile = new QFile(filePath);

			qssFile->open(QFile::ReadOnly);
			// 读取文件全部内容，使用tr()函数将其转换为QString类型
			styleSheet = tr(qssFile->readAll());
		}

		//读取图片文件，替换图片路径为theme下相对路径(否则每次都要手动添加qrc资源文件，很麻烦)
		{
			//替换前：image: url(test.png);
			QString picPath = "url(";
			//替换后：E:/project/other_project/qssTest-vs2015/Win32/Debug/GenerateMdTitle/theme/MacOS/pic/test.png
			QString picPathReplaced = QString::fromLocal8Bit("url(%1/theme/%2/pic/").arg(qApp->applicationDirPath()).arg(QssDirName);
			styleSheet.replace(picPath, picPathReplaced);
		}

		qssFile->close();
		delete qssFile;
	}

	return styleSheet;
}




