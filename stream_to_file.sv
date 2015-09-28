/****************************************
______________                ______________
______________ \  /\  /|\  /| ______________
______________  \/  \/ | \/ | ______________
--Module Name:  stream_to_file.sv
--Project Name: stream-to-file-package
--Data modified: 2015-09-28 11:02:56 +0800
--author:Young-ÎâÃ÷
--E-mail: wmy367@Gmail.com
****************************************/
`timescale 1ns/1ps
module stream_to_file #(
	parameter string			FILE_PATH	= "",
	parameter string			HEAD_MARK	= "",
	parameter string			DATA_SPLIT	= "     ",
	parameter TRIGGER_TOTAL		= 1000
)(
	input		enable			,
	input		posedge_trigger	,
	input		negedge_trigger ,
	input		signal_trigger  ,
	input int	data []	
);

import StreamFilePkg::*;

StreamFileClass streamfile = new(FILE_PATH);

initial begin
	streamfile.head_mark	= HEAD_MARK;
	$display("AT TIME: %t --->>SAVING TO FILE(%s) .....",$time,FILE_PATH);
	repeat(TRIGGER_TOTAL)begin
		wait(enable);
		@(posedge posedge_trigger,negedge negedge_trigger,signal_trigger);
		streamfile.puts(data);
	end
	streamfile.close_file();
	$display("AT TIME: %t --->>SAVING TO FILE(%s) DONE!",$time,FILE_PATH);
end

endmodule


		
