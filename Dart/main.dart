

// 
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