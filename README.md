# stream-to-file-package
把数据流输出到文件

简单的 systemverilog 程序。
粗略地展示：
   sv和verilog的区别、
   面向对象设计的思路（每次写文件都要用fopen，fwrite ，fdsisplay，定义一个莫名其妙的integer handle）
   
使用说明：
1-->首先载入package（因为我在class 外又加了一层 package---强迫症又犯了:(）
import StreamFilePkg::*;

2-->定义一个类
StreamFileClass 实例名 = new("文件路径（默认使用modelsim仿真的路径）");

3-->>使用类方法
（1）实例名.put_1d(数据）
（2）实例名.put_2d(数据1，数据2，分割符--可选参数‘默认是空格’）
 (3) 实例名.puts({数据1，数据2，数据3，......,数据n}，分割符--可选参数‘默认是空格’）
 
4-->>关闭文件
实例名.close_file(); 其实关不关无所谓


--@--Young--@--


