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

#ifndef NOTE_H
#define NOTE_H

#include <QObject>

class Note : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString tittle READ tittle NOTIFY tittleChanged)
    Q_PROPERTY(QString content READ content NOTIFY contentChanged)
    Q_PROPERTY(QString date READ date NOTIFY dateChanged)
    Q_PROPERTY(int noteId READ noteId WRITE setNoteId NOTIFY tittleChanged)

public:
    explicit Note(QObject *parent = 0);
    Note(QString tittle,QString content,QString date, QObject *parent = 0);

    QString tittle(){ return m_tittle; }
    QString content() { return m_content; }
    QString date() { return m_date; }
    int noteId() { return m_noteId; }

    void setNoteId(int noteId);

signals:
    void tittleChanged();
    void contentChanged();
    void dateChanged();
    void noteIdChanged();
    
private:
    QString m_tittle;
    QString m_content;
    QString m_date;
    int m_noteId;
    
};

#endif // NOTE_H
