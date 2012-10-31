#include <QApplication>
#include "noter.h"

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    Noter n;
    n.show();

    return app.exec();
}
