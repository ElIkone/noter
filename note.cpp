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

#include "note.h"

Note::Note(QObject *parent) : QObject(parent){
}

Note::Note(QString tittle,QString content, QString date, QObject *parent) : QObject(parent),m_tittle(tittle),m_content(content),m_date(date){
}

void Note::setNoteId(int noteId){
    if (noteId!=m_noteId){
        m_noteId=noteId;
        emit noteIdChanged();
    }
}
