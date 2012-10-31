/*******************************************************************************
**                                                                            **
**                                                                            **
**                                 By ElIkone                                 **
**                            copyright (C) 2012                              **
**                                                                            **
**                        http://github.com/elikone                           **
**                                                                            **
**                                                                            **
*******************************************************************************/

#ifndef NOTER_H
#define NOTER_H

#include <QDeclarativeView>
#include <QSqlDatabase>

class QSettings;
class Note;
class QSqlQuery;
class Noter : public QDeclarativeView
{
    Q_OBJECT
public:
    explicit Noter(QWidget *parent = 0);
    QSettings *settings;
    ~Noter();

public slots:
    void setSelectedColor(int index);
    void setSelectedFontSize(int index);
    void addNote(QString tittle, QString content);
    void readNotes();
    void updateNote(int id, QString tittle, QString content);
    void deleteNote(int id);

private:
    void initDB();
    int selectedUIColor();
    int selectedFontSize();
    QList<QObject*> notes;

    QString query;
    QSqlDatabase db;
};

#endif // NOTER_H
