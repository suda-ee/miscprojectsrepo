/*CRC-16 check*/
/*=========================
  CrC 计算子程序 (??不知是本函数的问题还是青智的问题，竟然不用倒字节序了)
  ==========================*/
unsigned short CrcCal(unsigned char Buf[], unsigned short count)
{
    unsigned short CrcData = 0xffff, i;
    unsigned short TmpI;
    unsigned short Data, GenPoly = 0xa001;
    for (i = 0; i < count; i++)
    {
        Data = Buf[i];
        Data = Data << 1;
        for(TmpI = 8; TmpI > 0; TmpI--)
        {
            Data = Data >> 1;
            if((Data ^ CrcData) & 1)
                CrcData = (CrcData >> 1) ^ GenPoly;
            else
                CrcData = CrcData >> 1;
        }
    }
    return CrcData;
}

/*========================
  公共变量
  ==========================*/
union
{
    unsigned char uc[4];
    long lda;
    unsigned long ul;
    float fda;
}un_4b;
union
{
    unsigned char uc[2];
    short sda;
    unsigned short us;
}un_2b;
long lda;
short sda;
float real;
unsigned char uca[4];
unsigned char ucb[2];

/*=================================================
  浮点数据转换为字节数据
  入口数据：real 放入要转换的浮点数据;
  出口数据：转换的四字节数据在uca[]中
  顺序是反序
  ===================================================*/
void FtoBr(void)
{
    un_4b.fda=real;
    uca[0]=un_4b.uc[3];
    uca[1]=un_4b.uc[2];
    uca[2]=un_4b.uc[1];
    uca[3]=un_4b.uc[0];
}

/*=================================================
  字节数据转换为浮点数据
  入口数据：要转换的四字节数据在uca[]中
  顺序是反序
  出口数据：real 存放的为已转换的浮点数据;
  ===================================================*/
void BtoFr(void)
{
    un_4b.uc[0]=uca[3];
    un_4b.uc[1]=uca[2];
    un_4b.uc[2]=uca[1];
    un_4b.uc[3]=uca[0];
    real=un_4b.fda;
}

/*===========================================================
  长整形数据转换为字节数据
  入口数据：要转换的长整形放在lda 中
  出口数据：转换完的四字节数据在uca[]中
  顺序是从反序
  ============================================================*/
void LtoBr(void)
{
    un_4b.lda=lda;
    uca[0]=un_4b.uc[3];
    uca[1]=un_4b.uc[2];
    uca[2]=un_4b.uc[1];
    uca[3]=un_4b.uc[0];
}

/*===========================================================
  字节数据换为长整形数据转
  入口数据：转换完的四字节数据在uca[]中
  顺序是反序
  出口数据：转换完毕的长整形放在lda 中
  ============================================================*/
void BtoLr(void)
{
    un_4b.uc[0]=uca[3];
    un_4b.uc[1]=uca[2];
    un_4b.uc[2]=uca[1];
    un_4b.uc[3]=uca[0];
    lda=un_4b.lda;
}

/*===========================================================
  整形数据换为字节数据
  入口数据：要转换的整形放在ida 中
  出口数据：转换完的２字节数据在ucb[]中
  顺序是同序
  ============================================================*/
void StoB(void)
{
    un_2b.sda=sda;
    ucb[0]=un_2b.uc[0];
    ucb[1]=un_2b.uc[1];
}

/*===========================================================
  字节数据转换为整形数据
  入口数据：要转换的２字节数据在ucb[]中
  顺序是同序
  出口数据：转换完毕的整形放在ida 中
  ============================================================*/
void BtoS(void)
{
    un_2b.uc[0]=ucb[0];
    un_2b.uc[1]=ucb[1];
    sda=un_2b.sda;
}
