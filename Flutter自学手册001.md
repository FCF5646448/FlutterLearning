---
title: Dart语言学习
date: 2020-5-20
description: 主要讲解Dart语言的语法，从 基础语法——面向对象——进阶 的流程进行
---

Tips：学习Dart可以直接去官网查看相关语法，Dart提供了相关的[在线编译工具](https://dartpad.cn/ ) 来在线编辑。

## 基础语法

### 基础概念
* 一切变量都是对象，包括数字、函数、null;
* 对象是类的实例，所有类都继承自Object;
* 强类型语言，但支持类型推断;
* dynamic关键字是类似OC的id、swift的any的存在;
* 支持泛型，List<int>, List<dynamic>;
* 支持全局函数、类方法、实例方法和嵌套函数(与swift基本一致);
* 支持全局变量、类变量、实例变量、局部变量;

#### 内置类型
* 数字:

  num是int和double的基类；int为64位整型，double为64位浮点型；

* 字符串:

  字符串是utf-16字符组成；
  字符可以使用单引号或者双引号表示；
  使用${}来插入字符串，如果不与后续字符混淆的话，可以省去{};
  可以使用+来拼接字符串;
  使用三重引号来定义多行字符串;
  
* bool布尔:

  只有true和false两个值;
  
* List数组:

  类似swift的Array;

* Map哈希表:

  类似swift的[:];

* Rune字符:

  类似swift的character;


#### 变量
Dart是强类型语言。
1、**所有未初始化的变量默认值都是null，包括数字**;
2、和swift一样，使用var来定义一个变量，然后使用final定义一个常量，使用const定义一个常值（const和final的区别就是：const的值必须在编译的事情就确定，但是final的值可以在运行时确定，比如final可以接收一个表达式的值，类似swift的let）;

```
void main() {
  var name = 'xxx';
  
  print("hello $name");
  print('hello ${name}xxx');
  
  //定义一个浮点型
  double a = 1;
  print(a);
  //字符串转整型
  var a1 = int.parse('1');
  print(a1);
  //字符串转浮点型
  var a2 = double.parse('1.1');
  print(a2);
  //整型转字符串
  var s = 1.toString();
  print(s);
  //浮点型转字符串，且保留两个小数
  var s1 =  3.1415926.toStringAsFixed(2);
  print(s1);
  
  print('xxx$s');
  print('xxx${s}xx');
  print('xxx$s+$s1');
  print('xxx${s+s1}');
  
  
  //逻辑运算
  print(3 << 1);
  print(3 >> 1);
  print(3 | 4);
  
  //除0不抛异常
  var c = 0/0;
  print(c.isNaN);
  
  //数组
  var list = [1,2,3];
  print(list[0]);
  list[1] = 3;
  print(list);
  
  //定义一个不可更改的数组
  var constlist = const [1,2,3];
  print(constlist);
  
  //定义一个动态类型的数组，不像其他语言，必须统一类型
  List<dynamic> l4 = [1,'a',3,'b'];
  
  //map
  var dic = {'0':0,'1':1,'2':2,'3':3};
  print(dic);
  print(dic.keys);
  
  var dic1 = {0:'0',1:'1',2:'2'};
  print(dic1);
  print(dic1.values);
  
  var dic2 = Map();
  dic2[0] = 0;
  dic2[1] = 1;
  dic2[2] = 2;
  print(dic2);
  print(dic2.length);
  
  //Runes
  Runes r = Runes('\u2665 \u{1f605} \u{1f47b}');
  print(r);
  //将字符转成普通字符串
  print(String.fromCharCodes(r));

}
```
### 函数
每个程序都有一个main函数，它是整个程序的入口。
函数也是一种对象，类型为Function，所以它可以作为参数传递，也可以赋值给变量；
闭包是一个能访问其外层作用域变量的函数。

函数参数和返回值类型可省略，如果函数体只有一句表达式，可使用=>来定义；
如果函数没有指定返回值，则默认返回null，如果确实不想返回任何值，则可定义为void。
参数：可选参数使用{}来指定，并且可使用注解@required标注为必须；可选位置参数使用[]来指定；可选参数默认使用=来指定，如未指定，则默认值为null；
```
void main() {
  //函数
  print(isNoble(1));
  print(isNoble1(2));
  print(isNoble2(3));
  f1(p1:1,p2:2);
  f2('1','2');
  f2('1','2','3');
  f3(s2:'2');
  
  //
  var l1 = [1,2,3];
  l1.forEach(printe);
  
  //匿名函数
  l1.forEach((e){
    print(e);
  });
  
  //函数赋值给变量
  var fc = (msg) => print(msg);
  fc('123');
  
  //闭包
  Function add(num n) {
    return (num i) => n + i;
  }
  
  //先定义函数
  var f4 = add(2);
  var f5 = add(3);
  print(f4(3));
  print(f5(4));
  
}

//函数
bool isNoble(int n){
  return n == 1;
}

//省去返回值类型
isNoble1(n) {
  return n == 2;
}

//单行表达式
isNoble2(n) => n == 3;

//可选参数函数,函数调用时得指定参数名
void f1({int p1, int p2, int p3}) {
  print(p1);
  print(p2);
  print(p3);
}

//不确定参数，
void f2(String s1,String s2,[String s3]) {
  if (s3 == null) {
    print(s1 + s2);
  }else{
    print(s1 + s2 + s3);
  }
}

//参数有默认值,注意，要使用{}括起来
void f3({String s1 = '1',String s2}) {
  print(s1 + s2);
}


//函数作为参数传递
void printe(int e) {
  print(e);
}
```

### 操作符
* ?? 如果某一个变量为null，才会执行之后的赋值，类似swift的可选型判断：var b; b ?? 2;
* is 用于判断类型，as 用于转换类型
* .. 双点号操作符，用于对象的连续调用。
```
//定义一个动态类型的数组
  List<dynamic> l4 = [1,'a',3,'b'];
  if(l4[1] is String) {
    print(l4[1].toUpperCase());
  }
  print((l4[1] as String)); //注意得是字符串才能这样转，如果是l4[0]则还是无法转成字符串

//双点号操作符 .. :sb和sb1的结果是一致的。
  var sb = StringBuffer();
  sb.write('a');
  sb.write('b');
  print(sb);
  
  var sb1 = StringBuffer();
  sb1..write('a')..write('b');
  print(sb1);
 
// 双点号通常用于数据解析里面：
final addressBook = (AddressBookBuilder()
                       ..name = 'xxx'
                       ..email = 'xxx@qq.com'
                       ..phone = (PhoneBuilder()
                                  ..num = '444-222-444'
                                  ..label='home')
                       .builder()).builder();


```

### 控制流程
略，基本和swift一样。没什么区别

### 异常
略，基本和swift一样。没什么区别

这里学习Dart语言的一些面向对象特性

### 类
#### 类的定义及构造函数
eg1:
```
//创建一个最简单的类：
class Dog {  
}
void main() {
  Dog d = new Dog();
}
```
eg2:
```
//给类添加实例变量和构造函数,注意这个this的使用以及关键字new，和C++语言一致：
class Dog {
  String name;
  int age;
  Dog(String name, int age){
    this.name = name;
    this.age =age;
  }
}
void main() {
  Dog d = new Dog('duoge',2);
  print(d.name);
}
```
eg3:
```
//更直接简单的构造函数
lass Dog {
  String name;
  int age;
  Dog(this.name,this.age);
}
void main() {
  Dog d = new Dog('duoge',2);
  print(d.name);
}
```
eg4:
```
//Dart的命名构造函数，为了处理有多个构造函数的状况
class Dog {
  String name;
  int age;
  Dog.newInit(){
    name = 'cafe';
    age  = 10;
  }
}
void main() {
  Dog d = new Dog.newInit();
  print(d.name);
}
```
#### 类的继承：extends
* 注意子类中super和this的使用
* 使用@override关键字进行继承。
```
class Dog {
  String name;
  int age;
  Dog(this.name,this.age);
  Dog.newInit(){
    name = 'cafe';
    age  = 10;
  }
  brak(){
    print('wow');
  }
}

class Pug extends Dog {
//根据参数，使用super来调用父类不用的构造函数
  Pug(String name, int age): super(name, age);
  Pug.init(): super.newInit();
   
//使用this来调用当前类的不同构造函数
  Pug.new0(String name, int age): this(name,age);
  Pug.new1(String name, int age): this.new0(name,age);

  @override
  brak(){
    print('${this.name} wow1');
  }
}

void main() {
  Pug p = new Pug('Duffy',3);
  print(p.name);
  Pug p1 = new Pug.init();
  print(p1.name);
  Pug p2 = new Pug.new1('犬夜叉',2);
  print(p2.name); 
  p2.brak();
}
```
#### Getter 和 Setter
//自定义属性，但是不能是已存在的属性，比如不能给name添加set\get方法。
```
  String get newName {
    return 'get name';
  }
  
  set newName(String n){
    name = n;
  }

  Pug p = new Pug.new1('犬夜叉',2);
  p.newName = 'xxx';
  print(p.newName);

```
#### 访问控制
Dart默认的所有属性和方法都是public的，但是也可以在属性和方法名前添加'_'使其私有化。比如给name加上'_',那如果外部要访问的话，就可以重写一个set、get方法来实现私有化。

#### 抽象类和方法
使用关键字 abstract 声明抽象类；抽象类方法只声明不实现。
```
abstract class Animal {
  void bark();
  void _hidden();
}
```
#### 静态方法
在属性或者方法前添加static关键字实现静态化；

### 泛型
```
class DataHolder<T> {
  T data;
  DataHolder(this.data);
}

void main() {
  Pug p = new Pug.new1('犬夜叉',2); 
  DataHolder<Pug> p2 = new DataHolder(p);
  print(p2.data.name); 
}
```

### 库
* Dart的库使用import导入；
* 内置库的URI前缀是dart:，由包管理工具提供的库的URI前缀是package:；
* 如果导入的多个库之间出现标识符冲突，可使用as来给某个库命名；
* 如果只想使用某个库里的部分内容，可以使用show或hide来展示或隐藏；
* 如果要延时加载，可以使用deferred as来延迟加载库；
```
import 'dart:math'; //导入某一个库
import 'dart:math' as m; //给math库取一个别名，主要是可能存在mathku里的命名和本地代码命名有冲突的情况
import 'dart:math' show sqrt;//只使用math库里的sqrt分支，这样就只会导入这个分支；
import 'dart:math' deferred as m;//延迟加载。
```

### 异步
Future 表示未来要执行的某一步操作。
#### Future的基础使用:
```
//注意 Future是一个异步对象，切忌与swift的block关联
import 'dart:async';

//未来会得到一个字符串类型的值。Future是支持泛型的，所以可以使用这个格式。
Future<String> getVersion() async => '1.0.0';

//定义一个异步函数
Future<String> getJocker(){
  return new Future<String>((){
    return "This is a jocker";
  });
}

main() async{
  
  //最简单的Future
  Future((){});
  Future((){print('hi');});
  Future(()=>print('hi1'));//简化版
  
  //Future.value 指定value值
  var future = Future.value(1);
  print(future);
  
  //带返回值的Future
  var p = await Future((){
    return 'xxxx1';
  });
  print(p);
  
  
  //使用then
  Future((){
    return 'xxxx';
  }).then((a){
    print(a);
  });
  
  Future(()=>1)
    .then((v)=>v*2)
    .then((v)=>print(v));
  
  //延时
  Future.delayed(new Duration(seconds: 2),(){
    return "hello world";
  }).then((data){
    print(data);
  });
  
  //使用函数
  getJocker().then((value){
    print(value);
  });
}
```
#### Future的高级用法
* **Future.foreach(Iterable elements, FutureOr action(T element))**
根据某个集合，创建一系列的Future，并按顺序执行这些future。
```
//生成逐个Future并执行
  Future.forEach({1,2,3},(num){
    return Future.delayed(Duration(seconds:2),()=>print(num));
  });
```
* **Future.wait ( Iterable<Future> futures,{bool eagerError: false, void cleanUp(T successValue)})**
等待多个Future执行完成，并收集它们的结果。如果都执行完成，则会返回所有future的结果集合，如果其中有一个执行失败，则只会返回那个error。
```
//使用wait获取多个执行结果
  var future1 = Future.delayed(Duration(seconds:1),()=>1);
  var future2 = Future.delayed(Duration(seconds:2),()=>2);
  var future3 = Future.delayed(Duration(seconds:3),()=>3);
  Future.wait({future1,future2,future3}).then(print).catchError(print);
//答案：[1,2,3]

  var future1 = Future.delayed(Duration(seconds:1),()=>1);
  var future2 = Future.delayed(Duration(seconds:2),()=>throw 'throw error2');
  var future3 = Future.delayed(Duration(seconds:3),()=>3);
  Future.wait({future1,future2,future3}).then(print).catchError(print);
//答案：throw error2
```
* **Future.any(futures)**
返回第一个执行完成的future的结果
```
//使用any返回第一个执行完毕的结果
  Future
      .any([1, 2, 5].map(
          (delay) => new Future.delayed(new Duration(seconds: delay), () => delay)))
      .then(print)
      .catchError(print);
//答案：1
```
* **Future.doWhile()**
循环执行，直到返回false或者Future
```
void futureDoWhile(){
  var random = new Random();
  var totalDelay = 0;
  Future
      .doWhile(() {
    if (totalDelay > 10) {
      print('total delay: $totalDelay seconds');
      return false;
    }
    var delay = random.nextInt(5) + 1;
    totalDelay += delay;
    return new Future.delayed(new Duration(seconds: delay), () {
      print('waited $delay seconds');
      return true;
    });
  })
      .then(print)
      .catchError(print);
}
```
#### 总结：
使用三种方法来监听Future的结果：Future.then()、Future.cathcError()、Future.whenComplete()
* Futuren.then() then()的返回值也是Future，所以可以将前一个Future的输出结果作为后一个Future的输入。实现链式调用。
* Future.cathcError() 用于捕获异常
* Future.whenComplete() 总是在Future完成之后调用，无论future的结果是正确的还是错误的。
* Future自动就是异步执行的，可以查看[Dart的消息循环机制](https://github.com/FCF5646448/FlutterLearning/wiki/Dart%E8%AF%AD%E8%A8%80%E8%BF%9B%E9%98%B6%E2%80%94%E2%80%94%E6%B6%88%E6%81%AF%E5%BE%AA%E7%8E%AF%E6%9C%BA%E5%88%B6)里Future的使用方法。但是一味地使用链式编程让代码难以理解，所以可以使用**async**和**wait**.注意：await只能在async函数出现，async函数返回一个Future对象，如果没有返回Future对象，则将自动包装成Future对象。


### 生成器
生成器是一种惰性地产生序列值。
生成器分为同步生成器Iterable和异步生成器Stream；
使用sync*/yield来定义同步生成器，使用async*/yield来定义异步生成器，使用yield*来优化从嵌套的生成器里读取序列值。
```
//同步生成器
Iterable<int> naturalsTo(int n) sync* {
  int k = 0;
  while(k<n) yield k++; 
}

//异步生成器
Stream<int> asyncNaturalsTo(int n) async* {
  int k = 0;
  while(k<n) yield k++; 
}

//递归
Iterable<int> naturalsTo2(int n) sync* {
  if(n > 0){
    yield n; //先返回n
    yield*  naturalsTo2(n-1); //递归执行n-1
  }
}

main(){
  for(var n in naturalsTo(3)){
    print(n);
  }
  
  await for(var n in asyncNaturalsTo(3)){
    print(n);
  }
  
  for(var n in naturalsTo2(3)){
    print(n);
  }
}

```

### 可调用类
如想让类像函数一样执行，这可以用call定义一个可以调用类：
```
class WannaFunc{
  call(int a,int b)=>a+b;
}
mian(){
  var wf = WannaFunc();
  print(wf(1,2));
}
```

### 函数类型 Function
略
### 元数据
略
### 注释
略



### Dart的线程：
Dart是基于单线程模型的语言，也就是说它同时只在一个线程上运行，只能执行一个任务。它本身也有一些自己的类似线性的机制，叫**isolate**。其中flutter的入口main函数就是一个isolate。开发者可以通过‘dart:isolate’来创建自己的isolate，对多核CPU来说，多个isolate可以显著提高运行效率。但是**isolate**之间是无法共享内存的，只允许isolate api进行通信。除了有明确指出运行在额外的isolate中的代码外（比如Dart命令行应用），所有的应用代码都应该是运行在main isolate中的。

为了处理不同的任务，dart提供了一个**消息循环**和**消息队列**。
* 消息循环（event loop）：就是不断地对队列中的消息进行处理，直到为空为止。
* 消息队列： 消息队列分为两种：**event queue**和**microtask queue**。**event queue**用于装载所有外来事件：mouse events，drawing events，timers，isolate之间的message等。**microtask queue**则是一种优先级比event高的队列，用于装载需要马上处理的消息。一般来讲：event队列包含Dart和来自系统其它位置的事件；microtask队列包含来自当前isolate的内部代码。

所有消息循环的机制是：先执行microtask消息，直到所有microtask消息执行完毕后，才开始执行event消息。所以插入的microtask的优先级永远是最高的。

![x](https://user-gold-cdn.xitu.io/2018/4/15/162c9218b810b52e?imageView2/0/w/1280/h/960/format/webp/ignore-error/1)


### Event队列

### Microtask队列
使用new Future或者new Future.delayed()来向event队列中添加事件。
```
new Future((){
});
```
使用then链式输出
```
new Future(()=>2).then((v)=>v*2).then((v)=>print(v));
```
使用delayed延时
```
new Future.delayed(const Duration(seconds:1),(){
});
```
注意几点：
* 被添加到then()的方法会在future中立即执行，它不是一个任务，只是一个回调而已；
* Future和Future.delayed()方法不会立即执行，只是会添加到队列中而已；
* Future.value()构造方法会在一个microtask中完成；
* Future.sync()构造方法会立马执行，并在microtask中完成

### Microtask队列：scheduleMicrotask()方法
```
scheduleMicrotask((){
});
```

### 使用
eg1:
```
import 'dart:async';
main() {
  print('main #1 of 2');
  scheduleMicrotask(() => print('microtask #1 of 2'));

  new Future.delayed(new Duration(seconds:1),
                     () => print('future #1 (delayed)'));
  new Future(() => print('future #2 of 3'));
  new Future(() => print('future #3 of 3'));

  scheduleMicrotask(() => print('microtask #2 of 2'));

  print('main #2 of 2');
}

//答案：
main #1 of 2
main #2 of 2
microtask #1 of 2
microtask #2 of 2
future #2 of 3
future #3 of 3
future #1 (delayed)

```
eg2:
```
import 'dart:async';
main() {
  print('main #1 of 2');
  scheduleMicrotask(() => print('microtask #1 of 3'));

  new Future.delayed(new Duration(seconds:1),
      () => print('future #1 (delayed)'));

  new Future(() => print('future #2 of 4'))
      .then((_) => print('future #2a'))
      .then((_) {
        print('future #2b');
        scheduleMicrotask(() => print('microtask #0 (from future #2b)'));
      })
      .then((_) => print('future #2c'));

  scheduleMicrotask(() => print('microtask #2 of 3'));

  new Future(() => print('future #3 of 4'))
      .then((_)=>print('future 3a'))
      .then((_) => new Future(
                   () => print('future #3b (a new future)')))
      .then((_) => print('future #3c'));

  new Future(() => print('future #4 of 4'))
    .then((_){
      print('future #4a');
      scheduleMicrotask(() => print('microtask #0 (from future #4a)'));
    });
  scheduleMicrotask(() => print('microtask #3 of 3'));
  print('main #2 of 2');
}

//答案：
main #1 of 2
main #2 of 2
microtask #1 of 3
microtask #2 of 3
microtask #3 of 3
future #2 of 4
future #2a
future #2b
future #2c
microtask #0 (from future #2b)
future #3 of 4
future 3a
future #4 of 4
future #4a
microtask #0 (from future #4a)
future #3b (a new future)
future #3c
future #1 (delayed)
```
结果细细品味！！！