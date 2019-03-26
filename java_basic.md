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