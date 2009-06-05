/*
 * SJzw3415_test.cpp
 *
 */

#include "fzw3415.h"
#include "SJzw3415_test.h"
void SJZW3415_test::getBundleVals_test()
{
    float vals[5];
    FZW3415 *pfzw3415 = new FZW3415(this, 1, "COM1", 19200);
    pfzw3415->getBundleVals(vals);
    qDebug()<<vals[0]<<vals[1]<<vals[2]<<vals[3]<<vals[4];
}
