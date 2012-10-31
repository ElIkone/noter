import QtQuick 1.1

ListView {

    clip: true

    model: notesModel

    delegate: Note{
        tittle: model.modelData.tittle
        content: model.modelData.content
        date: model.modelData.date
        noteId: model.modelData.noteId
    }
}
