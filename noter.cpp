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

#include "noter.h"
#include "note.h"

#include <QSettings>
#include <QDeclarativeContext>
#include <QtSql>
#include <QDebug>

Noter::Noter(QWidget *parent) : QDeclarativeView(parent){

    settings = new QSettings("Ikone", "Noter");

    db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("Noter");

    initDB();

    readNotes();

    rootContext()->setContextProperty("Noter",this);
    rootContext()->setContextProperty("selectedUIColor",selectedUIColor());
    rootContext()->setContextProperty("selectedUIColor",selectedUIColor());
    rootContext()->setContextProperty("selectedFontSize",selectedFontSize());

    setSource(QUrl("qml/main.qml"));
}

Noter::~Noter(){
    delete settings;
}

void Noter::initDB(){

    db.open();
    QSqlQuery sqlQuery;

    query = "CREATE TABLE IF NOT EXISTS \"Notes\" (\"id\" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, \"tittle\" TEXT, \"content\" TEXT, \"date\" TEXT)";
    sqlQuery.prepare(query);

    if(!sqlQuery.exec()){
        qDebug() << "Error in initDB() "+sqlQuery.lastError().text();
        exit(0);
    }

    db.close();
}

int Noter::selectedUIColor(){
    return settings->value("selectedUIColor",0).toInt();
}

int Noter::selectedFontSize(){
    return settings->value("selectedFontSize",1).toInt();
}

void Noter::setSelectedColor(int index){
    settings->setValue("selectedUIColor",index);

    rootContext()->setContextProperty("selectedUIColor",selectedUIColor());
}

void Noter::setSelectedFontSize(int index){
    settings->setValue("selectedFontSize",index);

    rootContext()->setContextProperty("selectedFontSize",selectedFontSize());
}

void Noter::readNotes(){

    for (int var = 0; var < notes.length(); ++var) {
        delete notes.at(var);
    }

    notes.clear();

    db.open();
    QSqlQuery sqlQuery;

    query = "SELECT tittle,content,date,id FROM Notes";
    sqlQuery.prepare(query);
    if(!sqlQuery.exec()){
        qDebug() << "Error "+sqlQuery.lastError().text();
        exit(0);
    }

    while(sqlQuery.next()){
        Note *n = new Note(sqlQuery.value(0).toString(),sqlQuery.value(1).toString(),sqlQuery.value(2).toString());
        n->setNoteId(sqlQuery.value(3).toInt());
        notes.append(n);
    }

    db.close();

    rootContext()->setContextProperty("notesModel",QVariant::fromValue(notes));
}

void Noter::addNote(QString tittle, QString content){
    db.open();
    QSqlQuery sqlQuery;

    query = "INSERT INTO Notes (tittle,content,date) VALUES (:tittle,:content,:date)";
    sqlQuery.prepare(query);
    sqlQuery.bindValue(":tittle",tittle);
    sqlQuery.bindValue(":content",content);
    sqlQuery.bindValue(":date",QDate::currentDate().toString("dd/MM/yyyy"));

    if(!sqlQuery.exec()){
        qDebug() << "Error "+sqlQuery.lastError().text();
        exit(0);
    }

    db.close();
}

void Noter::deleteNote(int id){
    db.open();
    QSqlQuery sqlQuery;

    query = "DELETE FROM Notes WHERE id=:id";
    sqlQuery.prepare(query);
    sqlQuery.bindValue(":id",id);

    if(!sqlQuery.exec()){
        qDebug() << "Error "+sqlQuery.lastError().text();
        exit(0);
    }

    db.close();
}

void Noter::updateNote(int id, QString tittle, QString content){
    db.open();
    QSqlQuery sqlQuery;

    query = "UPDATE Notes SET tittle=:tittle, content=:content WHERE id=:id";
    sqlQuery.prepare(query);
    sqlQuery.bindValue(":id",id);
    sqlQuery.bindValue(":tittle",tittle);
    sqlQuery.bindValue(":content",content);

    if(!sqlQuery.exec()){
        qDebug() << "Error "+sqlQuery.lastError().text();
        exit(0);
    }

    db.close();
}
