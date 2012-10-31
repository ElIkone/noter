QT += declarative sql

TARGET = noter

OTHER_FILES += \
    qml/main.qml \
    qml/HeaderBar.qml \
    qml/MenuButton.qml \
    qml/Menu.qml \
    qml/ButtonOk.qml \
    qml/UI.js \
    qml/Note.qml \
    qml/Notes.qml \
    qml/NotePage.qml

SOURCES += main.cpp \
    noter.cpp \
    note.cpp

HEADERS += \
    noter.h \
    note.h
