# stream-to-file-package
把数据流输出到文件

简单的 systemverilog 程序。

粗略地展示：

   sv和verilog的区别、
   
   面向对象设计的思路（以前的写法太烂,为什么每次写文件都要用fopen，fwrite ，fdsisplay，定义一个莫名其妙的integer handle）
   
使用说明：

直接例化使用和普通module 一样

stream_to_file #(

	.FILE_PATH		("E:/project/tpm.txt"),     // 要保存到的文件路径，最好是全路径，不然会自动保存到仿真默认路径
	
	.HEAD_MARK		("--@--Young--@--"),        //文件头标识，默认是没有的 “”
	
	.DATA_SPLIT		("     "),                  //数据分割，默认是4个空格，可以设成 "," ,  ";" "\t" ; "####"
	
	.TRIGGER_TOTAL	(1000	)                   // 抓取数量，默认 1000行
	
)stream_to_file_inst(

	.enable				(1'b1		),          //使能控制，相当于暂停 开始
	
	.posedge_trigger	(			),          //用XX上升沿，触发抓取
	
	.negedge_trigger    (clock		),          //用clock下降沿，触发抓取
	
	.signal_trigger     (			),          //用XX变化，触发抓取，（三个可同时使用）
	
	.data 		        ('{SR,SG,SB,CIE_L,CIE_A,CIE_B,rgb_to_lab_inst.X,rgb_to_lab_inst.Y,rgb_to_lab_inst.Z})
	
); //数据格式 ‘{数据0，数据1,....,数据n}  注意一定要加“{”前面的 ‘ ，不然会报错！！！


--@--Young--@--


