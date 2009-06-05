#include "resulttablemodel.h"

resulttablemodel::resulttablemodel(QObject * parent)
    : QAbstractTableModel(parent)
{
    insertColumns(0, 7);
    setHeaderData(0, Qt::Horizontal, trUtf8("时间 (ms)"), Qt::DisplayRole);
    setHeaderData(1, Qt::Horizontal, trUtf8("电压 (V)"), Qt::DisplayRole);
    setHeaderData(2, Qt::Horizontal, trUtf8("电流 (A)"), Qt::DisplayRole);
    setHeaderData(3, Qt::Horizontal, trUtf8("平均功率 (W)"), Qt::DisplayRole);
    setHeaderData(4, Qt::Horizontal, trUtf8("功率因数"), Qt::DisplayRole);
    setHeaderData(5, Qt::Horizontal, trUtf8("频率 (Hz)"), Qt::DisplayRole);
    setHeaderData(6, Qt::Horizontal, trUtf8("指定功率 (W)"), Qt::DisplayRole);
}

resulttablemodel::~resulttablemodel()
{
}

int resulttablemodel::rowCount(const QModelIndex & parent) const
{
    if (parent == QModelIndex())
        return dataArray[0].count();
    else
        return 0;
}

int resulttablemodel::columnCount(const QModelIndex & parent) const
{
    if (parent == QModelIndex())
        return 7;
    else
        return 0;
}

QVariant resulttablemodel::data(const QModelIndex & index, int role) const
{
    if (role == Qt::DisplayRole || role == Qt::EditRole)
    {
        if (index.column() == 0)
            return testTime.at(0).msecsTo(testTime.at(index.row())) ;
        else
            return dataArray[index.column() - 1].at(index.row());
    }
    else
    {
        return QVariant();
    }
}

QVariant resulttablemodel::headerData(int section, Qt::Orientation orientation,
        int role) const
{
    if (orientation == Qt::Horizontal && role == Qt::DisplayRole)
        return hHeader[section];
    else
        return QAbstractItemModel::headerData(section, orientation, role);
}

//Qt::ItemFlags resulttablemodel::flags(const QModelIndex & index) const
//{
//    if (!index.isValid())
//        return Qt::ItemIsEnabled;
//
//    return QAbstractTableModel::flags(index) | Qt::ItemIsEditable;
//}

bool resulttablemodel::setData(const QModelIndex & index,
        const QVariant & value, int role)
{
    if (role == Qt::EditRole || role == Qt::DisplayRole)
    {
        if (index.column() == 0)
        {
            testTime[index.row()] = value.toTime();
            emit dataChanged(index, index);
            return true;
        }
        else
        {
            dataArray[index.column() - 1][index.row()] = value.toDouble();
            emit dataChanged(index, index);
            return true;
        }
    }
    else
        return QAbstractItemModel::setData(index, value, role);
}

bool resulttablemodel::setHeaderData(int section, Qt::Orientation orientation,
        const QVariant & value, int role)
{
    if (orientation == Qt::Horizontal && role == Qt::DisplayRole)
    {
        hHeader[section] = value.toString();
        emit headerDataChanged(orientation, section, section);
        return true;
    }
    else
        return QAbstractItemModel::setHeaderData(section, orientation, value,
                role);
}
bool resulttablemodel::insertRows(int row, int count, const QModelIndex & parent)
{
    int i, j;
    beginInsertRows(parent, row, row + count - 1);
    for (i = count; i > 0; i--)
    {
        testTime.insert(row, QTime::currentTime());
        for (j = 0; j < 6; j++)
            dataArray[j].insert(row, 0.);
    }
    endInsertRows();
    return true;
}

bool resulttablemodel::insertColumns(int column, int count, const QModelIndex & parent)
{
    int i;
    if (count == 7 && column == 0)
    {
        beginInsertColumns(parent, column, column + count - 1);
        for (i = 0; i < count; i++)
        {
            hHeader[i].append("");
        }
        endInsertColumns();
        return true;
    }
    else
        return false;
}

bool resulttablemodel::removeRows(int row, int count, const QModelIndex & parent)
{
    int i, j;
    beginRemoveRows(parent, row, row + count - 1);
    for (i = 0; i < count; i++)
    {
        testTime.removeAt(row);
        for (j = 0; j < 6; j++)
            dataArray[j].removeAt(row);
    }
    endRemoveRows();
    return true;
}

bool resulttablemodel::removeColumns(int column, int count, const QModelIndex & parent)
{
    return false;
}

int resulttablemodel::appendData(int num, QTime & tTime, float *filteredData)
{
    int row;
    int i;
    row = dataArray[0].size();
    insertRows(row, 1);
    setData(index(row, 0), tTime, Qt::DisplayRole);
    for (i = 0; i < num; i++)
    {
        setData(index(row, i + 1), filteredData[i], Qt::DisplayRole);
    }
    return num;
}

QList<int> resulttablemodel::getAllTime()
{
    QList<int> tmsecs;
    int i;
    for (i = 0; i < testTime.size(); i++)
        tmsecs.append(testTime.at(0).msecsTo(testTime.at(i)));
    return tmsecs;
}

QList<float> * resulttablemodel::getAllData()
{
    return dataArray;
}
