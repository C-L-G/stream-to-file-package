/****************************************
______________                ______________
______________ \  /\  /|\  /| ______________
______________  \/  \/ | \/ | ______________
--Module Name:  streamfilepkg.sv
--Project Name: stream-to-file-package
--Data modified: 2015-09-28 11:02:56 +0800
--author:Young-ÎâÃ÷
--E-mail: wmy367@Gmail.com
****************************************/
`timescale 1ns/1ps
package StreamFilePkg;

class StreamFileClass;

string filepath = "";
string head_mark = "";

integer handle;

function new (string file_path);
	filepath	= file_path;
	handle = $fopen(filepath,"w");
	if(handle == 0)begin
		$display("StreamFileError: can't open file %s",filepath);
		$stop;
	end else begin
		$fdisplay(handle,head_mark);
	end
endfunction: new

task close_file;
	if( handle != 0)begin
		$fclose(handle);
		$display("StreamFileInf: close file %s",filepath);
	end else begin
		$display("StreamFileWarning: the file (%s) has not be open",filepath);
	end
endtask: close_file

task automatic printf(longint data);
	$fwrite(handle,"%d",data);
endtask: printf

task automatic str_write(string str);
    $fwrite(handle,str);
endtask:str_write

task automatic put_1d(integer data0);
	this.printf(data0);
	$fwrite(handle,"\n");
endtask: put_1d

task automatic put_2d(integer data0,integer data1,string split = "     ");
	this.printf(data0);
	$fwrite(handle,"%s",split);
	this.printf(data1);
	$fwrite(handle,"\n");
endtask: put_2d

task automatic puts(longint data [],string split = "    ");
	int s;
	s = data.size();
	if (s > 0)begin
		foreach (data[i])begin
			this.printf(data[i]);
			$fwrite(handle,"%s",split);
		end
		$fwrite(handle,"\n");
	end
endtask: puts

endclass: StreamFileClass

endpackage: StreamFilePkg
