redis 单线程，五种数据结构
String hash list set sortedset
String 底层是可变的字符数组,可以用作原子计数器，对字符串crud,最大值是512M
hash 修改对象的属性 crud用户属性
list 消息队列 双向链表
set 利用并集差集交集，求共同好友、独立ip 
sortedset 利用带有权重的元素，对元素进行排序，比如积分排行榜


redis rdb aof 淘汰策略