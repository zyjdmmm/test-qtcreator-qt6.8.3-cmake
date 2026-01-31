#ifndef GenerateMdTitle_H
#define GenerateMdTitle_H

#include "../../../common/tool/QxtGlobalShortcut/qxtglobalshortcut.h"


#include <QtWidgets/QMainWindow>
#include "ui_GenerateMdTitle.h"

#include <QDebug>

class QssTheme :public QObject
{
public:
	static QString getQssTheme(const QString &QssDirName);
};


class GenerateMdTitle : public QMainWindow
{
	Q_OBJECT

public:
	GenerateMdTitle(QWidget *parent = 0);






private:
	Ui::GenerateMdTitleClass ui;



	void slotButtonClicked();

	QxtGlobalShortcut globalShortcut1;
	QxtGlobalShortcut globalShortcut2;
	void setQxtGlobalShortcut(QString key, QxtGlobalShortcut& globalShortcut1);

	void upPushButton();
	void downPushButton();

};

#endif // GenerateMdTitle_H
