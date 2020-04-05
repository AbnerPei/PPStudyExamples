//
//  ViewController.m
//  BlockExample
//
//  Created by PPAbner on 2019/10/31.
//  Copyright © 2019 艾波er. All rights reserved.
//

#import "ViewController.h"
#import "LRShop.h"
#import <objc/runtime.h>

#define LRWeakSelf(type)  __weak typeof(type) weak##type = type;
#define LRStrongSelf(type)  __strong typeof(type) type = weak##type;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    LRShop *shop = [[LRShop alloc]init];
//    shop.string = @"welcome to our company";
//    LRWeakSelf(shop)
//    shop.myBlock = ^{
//        NSLog(@"block线程 %@",[NSThread currentThread]);
//        LRStrongSelf(shop)
//
//       dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            NSLog(@"weakshop.string is %@",shop.string);
//        });
//    };
//    shop.myBlock();
    
//    unsigned int count = 0;
//    Ivar *var = class_copyIvarList([UINavigationController class], &count);
//    for (int i = 0; i < count; i++) {
//        Ivar _var = *(var + 1);
//        NSLog(@"%s",ivar_getTypeEncoding(_var));
//        NSLog(@"%s",ivar_getName(_var));
//    }
    
//    u_int count;
//    // 传递count的地址过去 &count
//    objc_property_t *properties  =class_copyPropertyList([UIViewController class], &count);
//    //arrayWithCapacity的效率稍微高那么一丢丢
//    NSMutableArray *propertiesArray = [NSMutableArray arrayWithCapacity:count];
//
//    for (int i = 0; i < count ; i++)
//    {
//        //此刻得到的propertyName为c语言的字符串
//        const char* propertyName =property_getName(properties[i]);
//        //此步骤把c语言的字符串转换为OC的NSString
//        [propertiesArray addObject: [NSString stringWithUTF8String: propertyName]];
//    }
//    //class_copyPropertyList底层为C语言，所以我们一定要记得释放properties
//    // You must free the array with free().
//    free(properties);
//
//            NSLog(@"%@",propertiesArray);


    [self getAllMethods];
}


/**
 *  获取对象的所有方法
 */
- (NSArray *)getAllMethods
{
    unsigned int count_f =0;
    //获取方法链表
    Method *methodList_f = class_copyMethodList([UINavigationController class],&count_f);
    
    NSMutableArray *methodsArray = [NSMutableArray arrayWithCapacity:count_f];
    
    for(int i=0;i<count_f;i++)
    {
        Method temp_f = methodList_f[i];
        //方法的调用地址
        IMP imp_f = method_getImplementation(temp_f);
        //方法
        SEL name_f = method_getName(temp_f);
        //方法名字符串
        const char* name_s =sel_getName(method_getName(temp_f));
        //参数数量
        int arguments = method_getNumberOfArguments(temp_f);
        //返回方法的参数和返回值的描述的字串
        const char* encoding =method_getTypeEncoding(temp_f);
        NSLog(@"方法名：%@,参数个数：%d,编码方式：%@",[NSString stringWithUTF8String:name_s],
              arguments,[NSString stringWithUTF8String:encoding]);
        
        NSString *methodStr = NSStringFromSelector(name_f);
        [methodsArray addObject:methodStr];
        
    }
    free(methodList_f);
    
    return methodsArray;
}



@end
