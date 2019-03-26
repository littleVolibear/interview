1、*抽象类和接口的区别*  
* 抽象类强调的是继承，接口强调的实现
* 抽象类只能继承一个抽象类，但是接口可以实现多个
* 抽象类变量可以包含非final,接口中只能是final
* 抽象类中成员函数可以是private protected public ,接口中只能是public
* 抽象类可以有抽象方法和非抽象方法，但是接口中只能包含抽象方法
* 抽象类不用实现抽象类中的所有方法，但是接口必须实现包含的所有方法
---
2、*创建线程的三种方式*

* 继承thread
* 实现Runnable接口  
* 使用executor框架  
---
3、*怎么发生死锁*

两个进程都要获取一个锁，但是彼此都持有对方想要获取的锁
```
public void leftRightLock{
    private final Object left = new Object();
    private final Object right = new Ojbect();
    public void leftRight(){
        synchronized(left){
            synchronized(right){
                dosomething();
            }
        }
    }
    public void rightLeft(){
        synchronized(right){
            synchronized(left){
                dosomething();
            }
        }
    }
}
```
4、如何确保n个线程访问n个锁,不发生死锁

指定获取锁的顺序,多个线程按照指定顺序获取锁
具体做法:用Ojbect.hashCode返回的值规定获取锁的顺序,System.identityHashCode返回散列值,如果散列冲撞比较厉害，可以采用加时赛获得锁;
最好的是,通过唯一不可变、具有可比性的主键,这样不需要加时赛了
---
5、*hashMap工作原理*

* hashMap是基于map接口
* key/value允许空值
* 非同步
* 不保证有序
* 也不保证顺序随着时间变化而变化

对key的hashCode()做hash，然后再计算index;
如果没碰撞直接放到bucket里；
如果碰撞了，以链表的形式存在buckets后；
如果碰撞导致链表过长(大于等于TREEIFY_THRESHOLD)，就把链表转换成红黑树；
如果节点已经存在就替换old value(保证key的唯一性)
如果bucket满了(超过load factor*current capacity)，就要resize。
---
6、*hashMap和hashTable区别*

>对key的hashCode()做hash，然后再计算index;
如果没碰撞直接放到bucket里；
如果碰撞了，以链表的形式存在buckets后；
如果碰撞导致链表过长(大于等于TREEIFY_THRESHOLD)，就把链表转换成红黑树；
如果节点已经存在就替换old value(保证key的唯一性)
如果bucket满了(超过load factor*current capacity)，就要resize。

* hashMap不是同步的,hashTable是同步的
* hashMap是单线程环境,hashTable可以用在多线程环境中
* hashMap允许key/value为空,hashTable不允许
* hashMap是基于abstractMap(最大程度的减少接口所需的工作,快速失败-fail-fast机制),而hashTable是基于Dictionary类,是一个将key映射到value的类
*table是存储Entry的数组,table的索引在逻辑上叫做桶,hashmap是数组加链表结构*
---
7、*解决hash冲突的办法*
* 开放定址法（线性探测再散列，二次探测再散列，伪随机探测再散列）
* 再哈希法
* 链地址法
* 建立一个公共溢出区
---


