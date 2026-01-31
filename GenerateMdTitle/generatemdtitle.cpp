#include "generatemdtitle.h"
#include <QClipboard>
#include <QGuiApplication>
#include <QDebug>

GenerateMdTitle::GenerateMdTitle(QObject *parent)
    : QObject(parent)
{
}

QString GenerateMdTitle::resultText() const
{
    return m_resultText;
}

void GenerateMdTitle::generateNumberSeries(int seriesIndex, QString title, int questionNum, bool addSelectStr)
{
    QString result;
    QString series;
    for (int j = 0; j < seriesIndex + 1; ++j)
    {
        series.append("#");
    }
    series.append(" ");

    for (int i = 0; i < questionNum; ++i)
    {
        QString item;
        item.append(series);
        item.append(title);
        item.append(".");
        item.append(QString("%1").arg(i + 1));
        item.append("(,)");
        item.append("\n\n\n\n\n\n");

        if (addSelectStr)
        {
            item.append("选择\n");
        }

        result.append(item);
    }

    m_resultText = result;
    emit resultTextChanged();

    QClipboard *clipboard = QGuiApplication::clipboard();
    clipboard->setText(result);
}

void GenerateMdTitle::generateTimeSeries(int seriesIndex, QString title, int questionNum, bool addSelectStr)
{
    QString result;
    QString series;
    for (int j = 0; j < seriesIndex + 1; ++j)
    {
        series.append("#");
    }
    series.append(" ");

    for (int i = 0; i < questionNum; ++i)
    {
        QString item;
        item.append(series);
        item.append(title);
        item.append("(,)");
        item.append("\n\n\n\n\n\n");

        if (addSelectStr)
        {
            item.append("选择\n");
        }

        result.append(item);
    }

    m_resultText = result;
    emit resultTextChanged();

    QClipboard *clipboard = QGuiApplication::clipboard();
    clipboard->setText(result);
}

void GenerateMdTitle::generateYearSeries(int seriesIndex, int startYear, int questionNum, bool addSelectStr)
{
    QString result;
    QString series;
    for (int j = 0; j < seriesIndex + 1; ++j)
    {
        series.append("#");
    }
    series.append(" ");

    for (int i = 0; i < questionNum; ++i)
    {
        QString item;
        item.append(series);
        item.append(QString("%1").arg(startYear + i));
        item.append("\n\n\n\n\n\n");

        if (addSelectStr)
        {
            item.append("选择\n");
        }

        result.append(item);
    }

    m_resultText = result;
    emit resultTextChanged();

    QClipboard *clipboard = QGuiApplication::clipboard();
    clipboard->setText(result);
}

void GenerateMdTitle::upTitleLevel()
{
    QClipboard *clipboard = QGuiApplication::clipboard();
    QString clipboardText = clipboard->text();
    QString modifiedText = clipboardText;

    if (clipboardText.contains("\n# "))
    {
        showNotification("警告：已经是1级标题，无法提升");
        return;
    }
    else if (!clipboardText.contains("# "))
    {
        showNotification("警告：不包含任何标题，无法提升");
        return;
    }
    else
    {
        showNotification("提升1级成功");
        modifiedText.replace("## ", "# ");
    }

    if (modifiedText != clipboardText)
    {
        clipboard->setText(modifiedText);
        m_resultText = modifiedText;
        emit resultTextChanged();
    }
}

void GenerateMdTitle::downTitleLevel()
{
    QClipboard *clipboard = QGuiApplication::clipboard();
    QString clipboardText = clipboard->text();
    QString modifiedText = clipboardText;

    if (clipboardText.contains("###### "))
    {
        showNotification("警告：已经是6级标题，无法降低");
        return;
    }
    else if (!clipboardText.contains("# "))
    {
        showNotification("警告：不包含任何标题，无法降低");
        return;
    }
    else
    {
        showNotification("降低1级成功");
        modifiedText.replace("# ", "## ");
    }

    if (modifiedText != clipboardText)
    {
        clipboard->setText(modifiedText);
        m_resultText = modifiedText;
        emit resultTextChanged();
    }
}

void GenerateMdTitle::copyToClipboard(QString text)
{
    QClipboard *clipboard = QGuiApplication::clipboard();
    clipboard->setText(text);
    showNotification("复制成功");
}

void GenerateMdTitle::showNotification(QString message)
{
    qDebug() << "Notification:" << message;
}
