function publish(){
	
	this.validateTitle = function(){
		var title = $("input[name=title]").val();
		if($.trim(title).length == 0 ){
			alert("请输入商品标题！");
			return;
		}else if(title.length > 20 ){
			alert("字数超长或有误，请填写20个字以内的标题！");
			return;
		}	
	};
	
	
	this.checkFromData = function(){
		ref = true;
		var title = $("input[name=title]").val(), subtitle = $("input[name=subtitle]").val();
		if(!!!title || subtitle ){
			alert("不能为空！");
		}
		return ref;
	};
	
	this.saveProduct = function(){
		if (!publish.checkFromData()) {
			return false;
		}
	};

}