#include <iostream>
using namespace std;

/*Cuboid类表示长方体*/
class Cuboid {
public:
    /*构造函数*/
    Cuboid(int l,int w,int h);
    /*计算长方体的体积*/
    int volumn(){
        return length * width * height;
    }

private:
    /*定义长、宽、高*/
    int length,width,height;
};

/*外部定义的构造函数*/
Cuboid::Cuboid(int l, int w, int h) {
    /*初始化数据成员*/
    length = l;
    width = w;
    height = h;
    cout<<"Cuboid:: length is "<<l<<"\nwidth is "<<w<<"\nheight is "<<h<<endl;
}




class Person{
public:
    int age = 25;
    float  height = 178;
    Person(int a, float h, string n);
    Person();
    void sayHello();

private:
    string name;
};

Person::Person(int a, float h, string n) {
    age = a;
    height = h;
    name = n;
    cout<<"\n\n这个人"<<a<<"岁，"<<h<<"cm,姓名 = "<<n<<endl;
}

Person::Person() {
    cout<<"默认初始化了一个人，age ="<<age<<"，height ="<<height<<endl;
}

void Person::sayHello() {
    cout<<"\nHello,Teacher!";
}


int main() {
    std::cout << "Hello, World!" << std::endl;
    /*定义长方体对象a，调用构造函数初始化*/
    Cuboid a(1,2,3);
    /*输出a的体积*/
    cout<<"体积is "<<a.volumn()<<endl;

    //person1
    Person p1;
    p1.sayHello();

    Person p2(30,180,"ppabner");
    p2.sayHello();
    return 0;
}

/*
 * 创建一个对象时，通常最需要立即去做的就是初始化对象，
 * 构造函数就是用来在创建对象时初始化对象，为对象数据成员赋初始值；
 * */

/*
 * 构造函数(constructor)是类的一种特殊成员函数，不需要人为调用，而是在建立对象时自动被执行。
 * 构造函数的定义形式（有形参和无形参）：
 * 类名(形式参数)
 * {
 *    函数体;
 * }
 *
 * //无形参
 * 类名()
 * {
 *    函数体;
 * }
 * //or
 * 类名(void)
 * {
 *    函数体;
 * }
 */


