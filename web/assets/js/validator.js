var Validator=new Object;
Validator.result=true;
Validator.checkSubmit=function(formE){
	Validator.result=true;
	var elements=formE.elements;
	Validator.hiddenMsg();
	for(var i=0;i<elements.length;i++){
		var element=elements[i];
		
		var mode=element.getAttribute('mode');
		if(mode!=null){
			switch(mode.toLowerCase()){
				case 'requireselect'://这里的值一定要小字，因为上一句转了小写
				Validator.isRequireSelect(element,element.getAttribute('firstvalue'));//列表框第一项的value值
				break;
				case 'lessthan':
				Validator.isLessThan(element,element.getAttribute('to'));//不大于的整数
				break;
				
				case 'between':
				Validator.isBetween(element,element.getAttribute('from'),element.getAttribute('to'));//在from到to值之(from,to]
				break;
				
				case 'require_digital':
				Validator.isDigital(element,element.getAttribute('to'));//数字位数
				break;
				case 'require_minlen':
				Validator.minLen(element,element.getAttribute('to'));//最少位数
				break;
				case 'islong':
				Validator.isLong(element,false);//验证长整形（允许空）
				break;
				case 'require_islong':
				Validator.isLong(element,true);//验证长整形（不允许空）
				break;
				case 'require':
				Validator.require(element);
				break;
				case 'require_email':
				Validator.isEmail(element,true);
				break;
				case 'email':
				Validator.isEmail(element,false);
				break;
				case 'require_bankaccount':
				Validator.isBankAccount(element,true);
				break;
				case 'require_url':
				Validator.isURL(element,true);
				break;
				case 'url':
				Validator.isURL(element,false);
				break;
				case 'isnumber':
				Validator.isNumber(element,false);
				break;
				case 'require_isnumber':
				Validator.isNumber(element,true);
				break;
				case 'compare':
				Validator.compare(element,element.getAttribute('to'));
				break;
				case 'require_time':
				Validator.isTime(element,true);
				break;
				case 'require_tel':
				Validator.isTel(element,true);
				break;
				case 'tel':
				Validator.isTel(element,false);
				break;
				case 'require_mobile':
				Validator.isMobile(element,true);
				break;
				case 'mobile':
				Validator.isMobile(element,false);
				break;
				case 'require_idcard':
				Validator.isIdCard(element,true);
				break;
				case 'idcard':
				Validator.isIdCard(element,false);
				break;
				case 'length':
				Validator.isLength(element,false,element.getAttribute('len'));
				break;
				case 'require_length':
				Validator.isLength(element,true,element.getAttribute('len'));
				break;
				case 'require_nonnegative'://非负数
				Validator.isNonNegative(element,true);
				break;
				case 'nonnegative'://非负数
				Validator.isNonNegative(element,false);
				break;
				case 'require_nonegativeint'://非负整数
				Validator.isNoNegativeInt(element,true);
				break;
				case 'nonegativeint'://非负整数
				Validator.isNoNegativeInt(element,false);
				break;
				
				case 'require_positiveint'://正整数必填
				Validator.isPositiveInt(element,true);
				break;
				case 'ispositiveint'://正整数非必填
				Validator.isPositiveInt(element,false);
				break;
				case 'require_isnonegativeint'://非负整数必填
				Validator.isNoNegativeInt(element,true);
				break;
				case 'require_isnonegativeint_min'://非负整数必填
				Validator.isNoNegativeInt(element,true,element.getAttribute('len'));
				break;
				case 'isnonegativeint'://非负整数非必填
				Validator.isNoNegativeInt(element,false);
				break;
				
				
				case 'isfloat'://正负数
				Validator.isFloat(element,false);
				break;
				case 'islessthenpositivenumber'://不大于的正数
				Validator.islessthenPositiveNumber(element,element.getAttribute('to'));
				break;
				case 'require_positivenumber'://正数
					Validator.isPositiveNumber(element,true);
					break;
				case 'positivenumber'://正数
					Validator.isPositiveNumber(element,false);
					break;
				case 'require_numberorletter':// 数字与字母组成
				Validator.isPositiveNumber(element,true);
				break;
				case 'numberorletter':// 数字与字母组成
				Validator.isPositiveNumber(element,false);
				break;
				default:
				break;
			}
		}
	}
	return Validator.result;
}
//数字与字母组成
Validator.isNumberOrLetter=function(element,require){
	 var num = Utils.trim(Utils.getValue(element));
    if ( ! require && num == '')
    {
      return;
    }

    if ( ! Utils.isNumberOrLetter(num))
    {
      Validator.showMsg(element.id);
	  Validator.result=false;
    }
};
//正数
Validator.isPositiveNumber=function(element,require){
	 var num = Utils.trim(Utils.getValue(element));
    if ( ! require && num == '')
    {
      return;
    }

    if ( ! Utils.isPositiveNumber(num))
    {
      Validator.showMsg(element.id);
	  Validator.result=false;
    }
};
Validator.islessthenPositiveNumber=function(element,to){
	
	 var num = Utils.trim(Utils.getValue(element));
    if ( num == '')
    {
      Validator.showMsg(element.id);
	  Validator.result=false;
    }

    else if ( ! Utils.isPositiveNumber(num))
    {
      Validator.showMsg(element.id);
	  Validator.result=false;
    }
	else if(parseFloat(num)>=parseFloat(to))
	{
		Validator.showMsg(element.id);
	  Validator.result=false;
	}
};
Validator.isNonNegative=function(element,require){
	 var num = Utils.trim(Utils.getValue(element));
    if ( ! require && num == '')
    {
      return;
    }

    if ( ! Utils.isNonNegative(num))
    {
      Validator.showMsg(element.id);
	  Validator.result=false;
    }
}
//按整数比较大于to属性值则提示错误
Validator.isLessThan=function(element,to){
	var value= Utils.trim(Utils.getValue(element));
    if (value == '')
    {
      Validator.showMsg(element.id);
	  Validator.result=false;
    }
    else if ( ! Utils.isInt(value))
    {
      Validator.showMsg(element.id);
	  Validator.result=false;
    }
    else if ( Number(value)>Number(to))
    {
      Validator.showMsg(element.id);
	  Validator.result=false;
    }
}

//介于from到to之间的数，包括两端，即属于(from,to]
Validator.isBetween=function(element,from,to){
	var value= Utils.trim(Utils.getValue(element));
    if (value == '')
    {
      Validator.showMsg(element.id);
	  Validator.result=false;
    }
    else if (!Utils.isFloat(value))
    {
      Validator.showMsg(element.id);
	  Validator.result=false;
    }
    else if ( Number(value)<=Number(from)||Number(value)>Number(to))
    {
      Validator.showMsg(element.id);
	  Validator.result=false;
    }
}

    //是否长整形
    Validator.isLong=function(element,require){
	var value= Utils.trim(Utils.getValue(element));
    if (!require&&value == '')
    {
      return;
    }
    else if ( ! Utils.isInt(value))
    {
      Validator.showMsg(element.id);
	  Validator.result=false;
    }
    else if ( Number(value)>9223372036854775807)
    {
      Validator.showMsg(element.id);
	  Validator.result=false;
    }
}

//如果选中值为firstvalue的第一项就提示没选
Validator.isRequireSelect=function(element,firstvalue){
	var value=element.value;
	if(value==firstvalue)
	{
		Validator.showMsg(element.id);
		Validator.result=false;
	}
}

//必需输入指定位数的数字
Validator.isDigital=function(element,to){
	var value=Utils.getValue(element);
	if(Utils.trim(value).length!=to||! Utils.isInt(value))
	{
		Validator.showMsg(element.id);
		Validator.result=false;
	}
}

//最少位数
Validator.minLen=function(element,to){
	var value=Utils.getValue(element);
	if(Utils.trim(value).length<Number(to))
	{
		Validator.showMsg(element.id);
		Validator.result=false;
	}
}

Validator.require=function(element){
	if(Utils.isEmpty(Utils.getValue(element))){
		
		Validator.showMsg(element.id);
		Validator.result=false;
	}
}
Validator.isEmail=function(element,require){
	 var email = Utils.trim(Utils.getValue(element));

    if ( ! require && email == '')
    {
      return;
    }

    if ( ! Utils.isEmail(email))
    {
      Validator.showMsg(element.id);
	  Validator.result=false;
    }
}

Validator.isBankAccount=function(element,require){
	 var account = Utils.trim(Utils.getValue(element));

    if ( ! require && account == '')
    {
      return;
    }

    if ( ! Utils.isBankAccount(account))
    {
      Validator.showMsg(element.id);
	  Validator.result=false;
    }
}

Validator.isURL=function(element,require){
	 var url = Utils.trim(Utils.getValue(element));
	 
    if ( ! require && url == '')
    {
      return;
    }
    if ( ! Utils.isURL(url))
    {
      Validator.showMsg(element.id);
	  Validator.result=false;
    }
}
Validator.isTel=function(element,require){
	 var tel = Utils.trim(Utils.getValue(element));
	 
    if ( ! require && tel == '')
    {
      return;
    }
    if ( ! Utils.isTel(tel))
    {
      Validator.showMsg(element.id);
	  Validator.result=false;
    }
}
Validator.isMobile=function(element,require){
	 var phone = Utils.trim(Utils.getValue(element));
	 
    if ( ! require && phone == '')
    {
      return;
    }
    if ( ! Utils.isMobile(phone))
    {
      Validator.showMsg(element.id);
	  Validator.result=false;
    }
}
//非负整数
Validator.isNoNegativeInt=function(element,require){
	 var num = Utils.trim(Utils.getValue(element));
	
    if ( ! require && num == '')
    {
      return;
    }
	
    if ( ! Utils.isNoNegativeInt(num))
    {
      Validator.showMsg(element.id);
	  Validator.result=false;
    }
}
//非负整数，并且要求长度为len
Validator.isNoNegativeIntMin=function(element,require,len){
	 var num = Utils.trim(Utils.getValue(element));
	
    if ( ! require && num == '')
    {
      return;
    }
	if ( ! Utils.isLength(num,len))
    {
      Validator.showMsg(element.id);
	  Validator.result=false;
    }
	
    if ( ! Utils.isNoNegativeInt(num))
    {
      Validator.showMsg(element.id);
	  Validator.result=false;
    }
}

//正整数
Validator.isPositiveInt=function(element,require){
	 var num = Utils.trim(Utils.getValue(element));
	 
    if ( ! require && num == '')
    {
      return;
    }
    if ( ! Utils.isPositiveInt(num))
    {
      Validator.showMsg(element.id);
	  Validator.result=false;
    }
}

//非负整数
Validator.isNoNegativeInt=function(element,require){
	 var num = Utils.trim(Utils.getValue(element));
	 
    if ( ! require && num == '')
    {
      return;
    }
    if ( ! Utils.isNoNegativeInt(num))
    {
      Validator.showMsg(element.id);
	  Validator.result=false;
    }
}

Validator.isIdCard=function(element,require){
	 var idCard = Utils.trim(Utils.getValue(element));
    if ( ! require && idCard == '')
    {
      return;
    }
    if (Utils.isIdCard(idCard)>0)
    {
      Validator.showMsg(element.id);
	  Validator.result=false;
    }
}

Validator.isTime=function(element,require){
	 var time = Utils.trim(Utils.getValue(element));
	 
    if ( ! require && time == '')
    {
      return;
    }

    if ( ! Utils.isTime(time))
    {
      Validator.showMsg(element.id);
	  Validator.result=false;
    }
}

Validator.isLength=function(element,require,len){
	 var val = Utils.trim(Utils.getValue(element));
	 
    if ( require && val == '')
    {
       Validator.showMsg(element.id);
	  Validator.result=false;
	  return;
    }

    if ( ! Utils.isLength(val,len))
    {
      Validator.showMsg(element.id);
	  Validator.result=false;
    }
}

Validator.isNumber=function(element,require){
	
	 var number= Utils.trim(Utils.getValue(element));
    if ( ! require&& number == '')
    {
      return;
    }

    if ( ! Utils.isNumber(number))
    {
      Validator.showMsg(element.id);
	  Validator.result=false;
    }
}
Validator.isFloat=function(element,require){
	
	 var number= Utils.trim(Utils.getValue(element));
    if ( ! require&& number == '')
    {
      return;
    }

    if ( ! Utils.isFloat(number))
    {
      Validator.showMsg(element.id);
	  Validator.result=false;
    }
}
Validator.compare=function(element,to){
	var elvalue1=Utils.getValue(element);
	var elvalue2=document.getElementById(to).value;
	if(elvalue1==elvalue2)
		return;
	else{
		Validator.showMsg(element.id);
		Validator.result=false;
	}
}
Validator.showMsg=function(elementId){
	var errorid="ck"+elementId;
	document.getElementById(errorid).style.display="inline";
}
Validator.hiddenMsg=function()
{
	var errors=document.getElementsByTagName("span");
	for(var i=0;i<errors.length;i++)
		if(errors[i].className=="errorinfo"){
			var erid=errors[i].id;
			document.getElementById(erid).style.display="none";
		}
}