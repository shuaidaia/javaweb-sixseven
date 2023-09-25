// JavaScript Document
$(function(){
	$(".item li a").click(function(){
		$(".item li a.cur").removeClass("cur");
		$(this).addClass("cur");
	})
	$(".item li:has(.subitems) h3").addClass("hasitems");
	$('#subsider .item h2').click(function(){
			if($(this).hasClass("cur")){
				$(this).removeClass("cur");
				$(this).parent().find("ul").slideUp("fast");
			}
			else{
				$("h2.cur").removeClass("cur");
			$(this).addClass("cur").parent().find("ul").slideDown("normal").end().siblings().find("ul").slideUp("fast");
			}
		});
	// $('#subsider .item h2').toggle(function(){
	// 		$("h2.cur").removeClass("cur");
	// 		$(this).addClass("cur").parent().find("ul").slideDown("normal").end().siblings().find("ul").slideUp("fast");
	// 	},function(){
	// 		$(this).removeClass("cur");
	// 		$(this).parent().find("ul").slideUp("fast");
	// 		});
	// $('#subsider .item li h3').click(function(){
	// 		$("h3.cur").removeClass("cur");
	// 		$(this).addClass("cur").parent().find(".subitems").slideDown("normal").end().siblings().find(".subitems").slideUp("fast");
	// 	});

	});