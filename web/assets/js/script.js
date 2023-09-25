// JavaScript Document
$(function(){
	$(".isdel").click(function(){
		return confirm("真的要删除吗？");
		});
	$(".tblist th:odd").addClass("even");
	$(".tblist tr:odd").addClass("odd");
	
	});