#ifndef GENERATEMDTITLE_H
#define GENERATEMDTITLE_H

#include <QObject>
#include <QString>
#include <QClipboard>
 // #include <QApplication>

class GenerateMdTitle : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString resultText READ resultText NOTIFY resultTextChanged)

public:
    explicit GenerateMdTitle(QObject *parent = nullptr);

    Q_INVOKABLE void generateNumberSeries(int seriesIndex, QString title, int questionNum, bool addSelectStr);
    Q_INVOKABLE void generateTimeSeries(int seriesIndex, QString title, int questionNum, bool addSelectStr);
    Q_INVOKABLE void generateYearSeries(int seriesIndex, int startYear, int questionNum, bool addSelectStr);
    Q_INVOKABLE void upTitleLevel();
    Q_INVOKABLE void downTitleLevel();
    Q_INVOKABLE void copyToClipboard(QString text);
    Q_INVOKABLE void showNotification(QString message);

    QString resultText() const;

signals:
    void resultTextChanged();

private:
    QString m_resultText;
};

#endif
