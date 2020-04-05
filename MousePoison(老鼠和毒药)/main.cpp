#include <iostream>
using namespace std;

int main() {
    std::cout << "Hello, World!" << std::endl;

    /*
     * 思路
     * 0000  1号瓶
     * 0001  2号瓶
     * 0010  3号瓶
     * 0011  4号瓶
     * 0100  5号瓶
     * 0101  6号瓶
     * 0110  7号瓶
     * 0111  8号瓶
     * 1000  9号瓶
     * 1001  10号瓶
     * 1010  11号瓶
     * 1011  12号瓶
     * 1100  13号瓶
     * 1101  14号瓶
     * 1110  15号瓶
     * 1111  16号瓶
     * ABCD  1234老鼠
     */

    cout<<"请按照编号0000（1号瓶）、0001（2号瓶）、0010（3号瓶）、0011（4号瓶）、0100（5号瓶）这样的规则给16个瓶子一次编号"<<endl;
    cout<<"\n请再依次用ABCD给4只老鼠🐀编号"<<endl;
    cout<<"\n依次从1号瓶至16号瓶，编号某一位为'1',则让对应的老鼠喝一点该编号瓶里的水，"
          "如2号瓶编号为'0001'，则只让老鼠'D'喝2号瓶里的水；12号瓶编号为'1011'，则"
          "让老鼠'A'、老鼠'C'、老鼠'D'都喝一点12号瓶里的水"<<endl;
    cout<<"\n请认真小心执行完上面说的操作，然后就可以休息等明天看结果啦"<<endl;

    cout<<"\n\n第二天早上了,请输入你看到那只老鼠死了："<<endl;

    const int MOU_NUM = 4;
    int mouses[MOU_NUM] = {};
//    int deadMouseCount = 0;
//    string endStr = "Q";
//    string inputStr;
//    while (inputStr != endStr){
//        cout<<"\n请输入："<<endl;
//        cin>>inputStr;
//        cout<<"inputStr is "<<inputStr;
//        mouses[deadMouseCount] = inputStr;
//        deadMouseCount += 1;
//    }

    int num=sizeof(mouses)/ sizeof(mouses[0]);
    cout<<mouses<<"num is "<<num<<endl;

    int drug = 0;//有毒瓶子号
    for (int i = 0; i < MOU_NUM; i++)
    {
        cin>>mouses[i];//输入老鼠喝水后的存活状态
    }
    for (int j = 0; j < MOU_NUM; j++)
    {
        drug |= (mouses[j] << (3 - j));//进行位运算
    }
    //判断是否有毒
    if (drug == 0)
    {
        cout<<"没有有毒的"<<endl;
    }
    else{
        cout<<"有毒的是第"<<drug+1<<"瓶";
    }


    return 0;

}