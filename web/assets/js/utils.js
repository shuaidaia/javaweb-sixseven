// JavaScript Document
var Utils = new Object();

Utils.htmlEncode = function(text)
{
  return text.replace(/&/g, '&amp;').replace(/"/g, '&quot;').replace(/</g, '&lt;').replace(/>/g, '&gt;');
}
Utils.isNonNegative=function(evalue)
{
	var pattern = /(^[0-9]\d+$)|(^\d+\.?\d*$)/;
	return pattern.test(evalue);
}
Utils.isNumberOrLetter=function(text)
{
	var pattern = /^[0-9a-zA-Z]*$/g;
	return pattern.text(text);
}
Utils.isPositiveNumber=function(evalue)
{

	if(Utils.isNonNegative(evalue)){
		var value=parseFloat(evalue);
		if(value>0){
			return true;
		}
		return false;
	}
	return false;
};
Utils.trim = function( text )
{
  if (typeof(text) == "string")
  {
    return text.replace(/^\s*|\s*$/g, "");
  }
  else
  {
    return text;
  }
}
Utils.TrimAll=function(str)
{
		var result;
		result = str.replace(/(^\s+)|(\s+$)/g,"");
		result = result.replace(/\s/g,"");
		return result;
}
Utils.isLength=function(val,len)
{
	if(Utils.trim(val).length>len){
		return 0;
	}
	else
	return 1;
}
Utils.isEmpty = function( val )
{
  switch (typeof(val))
  {
    case 'string':
      return Utils.trim(val).length == 0 ? true : false;
      break;
    case 'number':
      return val == 0;
      break;
    case 'object':
      return val == null;
      break;
    case 'array':
      return val.length == 0;
      break;
    default:
      return true;
  }
}

Utils.isNumber = function(val)
{
  var reg = /^[\d|\.|,]+$/;
  return reg.test(val);
}
Utils.isFloat=function(val)
{
  var reg=/^[\-|\+]{0,1}[\d]{1,10}[\.|\d]{0,10}$/;
  return reg.test(val);
}
Utils.isInt = function(val)
{
  if (val == "")
  {
    return false;
  }
  var reg = /\D+/;
  return !reg.test(val);
}
Utils.isNoNegativeInt=function(val)//非负整数
{
	if(val=="")
	{
		return false;
	}
	//var reg=/^[0-9]*[1-9][0-9]*$/;
	var reg=/^(0|[1-9]\d*)$/;	
	return reg.test(val);
}
Utils.isPositiveInt=function(val)//正整数
{
	if(val=="")
	{
		return false;
	}
	var reg=/^[1-9][0-9]*$/;
	return reg.test(val);
}
Utils.isBankAccount=function(account)
{
	//var reg=/^\d{19}$/g;
	var reg=/^\d{19}|^\d{16}$/g;
	return reg.test(account);
}
Utils.isEmail = function( email )
{
  var reg1 = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)/;

  return reg1.test( email );
}

Utils.isTel = function ( tel )
{
  var reg = /^\d{3,4}-?\d{6,8}$/; //只允许使用数字-空格等
  var reg2=/^\d{6,8}$/;

  return reg.test( tel )||reg2.test(tel);
}
Utils.isMobile = function (phone)
{
  //var reg = /^(1[3,5,8][0-9])\d{8}$/; //只允许使用数字-空格等
  var reg = /^1\d{10}$/; //只允许使用数字-空格等
  return reg.test(phone);
}

Utils.fixEvent = function(e)
{
  var evt = (typeof e == "undefined") ? window.event : e;
  return evt;
}

Utils.srcElement = function(e)
{
  if (typeof e == "undefined") e = window.event;
  var src = document.all ? e.srcElement : e.target;

  return src;
}

Utils.isTime = function(val)
{
	var r = val.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/); 
	if(r==null)return false; 
	var d= new Date(r[1], r[3]-1, r[4]); 
	return (d.getFullYear()==r[1]&&(d.getMonth()+1)==r[3]&&d.getDate()==r[4]);
	
}
Utils.isURL=function(val)
{
	var reg= /^http:\/\/([\w-]+\.)+[\w-]+(\/[\w- .\/?%&=]*)?$/;
	return reg.test(val);
}
Utils.getValue=function(element)
{
	var tagname=element.tagName.toLowerCase();
	if(tagname=="input"){
		switch(element.type.toLowerCase()){
			case 'checkbox':
			case 'radio':
			return Utils.getcheckBoxValue(element);
			default:
			return element.value;
			break;
		}
	}
	if(tagname=="select"){
		return Utils.getSelectValue(element);
	}
	if(tagname=="textarea"){
		return element.value;
	}
}
Utils.getcheckBoxValue=function(element)
{
	var result="";
	var boxes=document.getElementsByName(element.name);
	for(var i=0;i<boxes.length;i++){
		if(boxes[i].checked)
			result+=boxes[i].value;
	}
	return result;
}
Utils.getSelectValue=function(selectE)
{
	var result="";
	for(var i=0;i<selectE.options.length;i++){
		if(selectE.options[i].selected && selectE.options[i].value!=0)
		result+=selectE.options[i].value;
	}
	return result;
}
Utils.IntCompare=function(val1,val2,mode)
{
	if(!Utils.isInt(val1)||!Utils.isInt(val2))
	{
		return false;
	}
	else
	{
		switch(mode.toLowerCase())
		{
			case '<'://小于
			return val1<val2;
			break;
			case '<='://小于等于
			return val1<=val2;
			break;
			case '>'://大于
			return val1>val2;
			break;
			case '>='://大于等于
			return val1>=val2;
			break;
			case '=='://等于
			return val1==val2;
			break;
			default:
			return false;
			break;
		}
	}
}
Utils.isIdCard=function(obj)
{
	 var aCity={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙 江",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖 北",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西 藏",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国 外"};
	  var iSum = 0;
	 //var info = "";
	 var strIDno = obj;
	 var idCardLength = strIDno.length;
	 if(!/^\d{17}(\d|x)$/i.test(strIDno)&&!/^\d{15}$/i.test(strIDno))
			return 1; //非法身份证号
	
	 if(aCity[parseInt(strIDno.substr(0,2))]==null)
	 return 2;// 非法地区
	
	  // 15位身份证转换为18位
	 if (idCardLength==15)
	 {
		sBirthday = "19" + strIDno.substr(6,2) + "-" + Number(strIDno.substr(8,2)) + "-" + Number(strIDno.substr(10,2));
	  var d = new Date(sBirthday.replace(/-/g,"/"))
	  var dd = d.getFullYear().toString() + "-" + (d.getMonth()+1) + "-" + d.getDate();
	  if(sBirthday != dd)
					return 3; //非法生日
				  strIDno=strIDno.substring(0,6)+"19"+strIDno.substring(6,15);
				  strIDno=strIDno+GetVerifyBit(strIDno);
	 }
	
		   // 判断是否大于2078年，小于1900年
		   var year =strIDno.substring(6,10);
		   if (year<1900 || year>2078 )
			   return 3;//非法生日
	
		//18位身份证处理
	
	   //在后面的运算中x相当于数字10,所以转换成a
		strIDno = strIDno.replace(/x$/i,"a");
	
	  sBirthday=strIDno.substr(6,4)+"-"+Number(strIDno.substr(10,2))+"-"+Number(strIDno.substr(12,2));
	  var d = new Date(sBirthday.replace(/-/g,"/"))
	  if(sBirthday!=(d.getFullYear()+"-"+ (d.getMonth()+1) + "-" + d.getDate()))
					return 3; //非法生日
		// 身份证编码规范验证
	  for(var i = 17;i>=0;i --)
	   iSum += (Math.pow(2,i) % 11) * parseInt(strIDno.charAt(17 - i),11);
	  if(iSum%11!=1)
					return 1;// 非法身份证号
	
	   // 判断是否屏蔽身份证
		var words = new Array();
		words = new Array("11111119111111111","12121219121212121");
	
		for(var k=0;k<words.length;k++){
			if (strIDno.indexOf(words[k])!=-1){
				return 1;
			}
		}
	
	 return 0;
}
Utils.getRound=function(number,fractionDigits){
    with(Math){
        return round(number*pow(10,fractionDigits))/pow(10,fractionDigits);   
	}
};
Utils.getOwnExpense=function(total,eispatchRatio){
	if(eispatchRatio<=0.8){
		return total/eispatchRatio*0.2;
	}
	else{
		return total/eispatchRatio*(1-eispatchRatio);
	}
};
var UtilsDate=new Object();
//转换日期为YYYY-mm-dd的格式
UtilsDate.converToDate=function(date){
	if(Utils.isTime(date)){
		var r =date.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/); 
		var cdate = r[1]+"-"+r[3]+"-"+r[4];
		return cdate;
	}
	else{
		alert("日期格式不对！");
	}
	
};
//两个日期相减
UtilsDate.DateDiff=function(sdate,edate){
	sdate=UtilsDate.converToDate(sdate);
	edate=UtilsDate.converToDate(edate);
	var day = 24 * 60 * 60 *1000;
	var dateArr = sdate.split("-");
	var checkDate = new Date();
	checkDate.setFullYear(dateArr[0], dateArr[1]-1, dateArr[2]);
	var checkTime = checkDate.getTime();
	
	var dateArr2 = edate.split("-");
	var checkDate2 = new Date();
	checkDate2.setFullYear(dateArr2[0], dateArr2[1]-1, dateArr2[2]);
	var checkTime2 = checkDate2.getTime();
	
	var cha = (checkTime - checkTime2)/day; 
	return cha;
};
//日期加多少天
UtilsDate.addDays=function(date,days){
	
	var datearr=date.split("-");
	var nd=new Date(datearr[0],datearr[1]-1,datearr[2]);
	
	nd=nd.valueOf();
	nd=nd+days*24*60*60*1000;
	nd=new Date(nd);
 
	var y = nd.getFullYear();
	var m = nd.getMonth()+1;
	var d = nd.getDate();
	if(m <= 9) m = "0"+m;
	if(d <= 9) d = "0"+d; 
	var cdate = y+"-"+m+"-"+d;
	return cdate;
};
//获得门诊特病的开始日期
UtilsDate.clinicSdate=function(pSdate,cSdate){
	if(UtilsDate.DateDiff(pSdate,cSdate)>0){
		return pSdate;
	}
	else{
		return cSdate;
	}
};
UtilsDate.clinicEdate=function(pEdate,cEdate){
	if(UtilsDate.DateDiff(pEdate,cEdate)>0){
		return cEdate;
	}
	else{
		return pEdate;
	}
};
//换算金额
UtilsDate.clinicTotal=function(pSdate,pEdate,cSdate,cEdate,cTotal){
	var sDate=UtilsDate.clinicSdate(pSdate,cSdate);
	var eDate=UtilsDate.clinicEdate(pEdate,cEdate);

	var vDay=UtilsDate.DateDiff(eDate,sDate)+1;
	var tDay=UtilsDate.DateDiff(cEdate,cSdate)+1;
	return cTotal/tDay*vDay;
};

