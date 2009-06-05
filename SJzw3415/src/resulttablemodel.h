#ifndef RESULTTABLEMODEL_H
#define RESULTTABLEMODEL_H

#include <QtCore/QAbstractTableModel>
#include <QtCore/QTime>

QT_BEGIN_NAMESPACE

class resulttablemodel : public QAbstractTableModel
{
    Q_OBJECT
public:
    resulttablemodel(QObject * parent = 0);
    ~resulttablemodel();
    int rowCount(const QModelIndex & parent = QModelIndex()) const;
    int columnCount(const QModelIndex & parent = QModelIndex()) const;
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;
    QVariant headerData(int section, Qt::Orientation orientation,
            int role = Qt::DisplayRole) const;
    bool setData(const QModelIndex & index, const QVariant & value,
            int role = Qt::EditRole);
    //Qt::ItemFlags flags(const QModelIndex & index) const;
    bool setHeaderData(int section, Qt::Orientation orientation,
            const QVariant & value, int role = Qt::EditRole);
    bool insertRows(int row, int count, const QModelIndex & parent
            = QModelIndex());
    bool insertColumns(int column, int count, const QModelIndex & parent
            = QModelIndex());
    bool removeRows(int row, int count, const QModelIndex & parent
            = QModelIndex());
    bool removeColumns(int column, int count, const QModelIndex & parent
            = QModelIndex());

    QList<int> getAllTime();
    QList<float> * getAllData();

public slots:
    int appendData(int num, QTime & tTime, float *filteredData);

private:
    QList<QTime> testTime;
    QList<float> dataArray[6];
    QString hHeader[7];
    
};

QT_END_NAMESPACE

#endif // RESULTTABLEMODEL_H
