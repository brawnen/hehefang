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
	
	
	this.modifyBc = function(){
		alert("modifyBc");
	};
	
	
	this.generateSku = function(obj){
		editSpec(obj);
		
		var checkedArray = $("input[name='specValue']:checked");
		var selectedSpec = {},specNames = {},specValueColorName;
		specNames.total = 0;
		
		for (var i = 0 ; i < checkedArray.length; i++) {
			var jq = $(checkedArray[i]),
			specName = jq.attr('skuSpecName'),
			specId = jq.attr('skuSpecId');
			specValueName = jq.siblings("label[name='specValueTxt']").text(),
			specValueId = jq.attr('specValueId');
			specOrder = jq.attr('specOrder');
			specValueColorName = jq.siblings("img[name='colorIcon']").attr("colorName");
			
			if(!selectedSpec[specId]){
				selectedSpec[specId] = {'skuSpecName' : specName,
    					'skuSpecId'	: specId,
    					'specOrder' : specOrder,
    					'values' : []};
			}
			
			selectedSpec[specId].values.push({'specValueId' : specValueId,
				'specValueName' : specValueName, 'specValueColorName' : specValueColorName});
			
		}
		
		var selectedArr = [];
		for (var key in selectedSpec) {
			selectedArr.push(selectedSpec[key]);
		}
		
		selectedArr.sort(function(a, b) {
			return (parseInt(a['specOrder']) < parseInt(b['specOrder']) ? -1 : 1);
		});
		
		generateSpec(selectedArr);
		
	};
	
	
	this.saveProduct = function(){
		if (!publish.checkFromData()) {
			return false;
		}
	};

}

function editSpec(obj){
	var label = $(obj).siblings('label');
	var specName = label.next();
	
	if(obj.checked){
		label.addClass("hide");
		specName.addClass("show-iblock");
		specName.val(label.text());
	}else{
		label.removeClass("hide");
		specName.removeClass("show-iblock");
	}
}


function generateSpec(selectedArr){
	var table = $('#genSpec');
	table.hide();
	table.html('');
	
	var selectedSpectLength = selectedArr.length;      		
	if (selectedSpectLength < $('ul[specId]').length) {  
		table.html("");
		return;
	}
	
	var thead = "<table class=\"table table-line\">" +
			"<colgroup><col width=\"100\" />" +
			"<col width=\"100\" />" +
			"<col width=\"100\" />";
	
	$(selectedArr).each(function() {
		thead += '<col width="100" />';
	});
	
	thead += "</colgroup><thead><tr>" ;
	
	$(selectedArr).each(function() {
		thead += "<th>" + this.skuSpecName + "</th>";
	});
	thead += "<th>单价</th>" +
			"<th>特卖价</th>" +
			"<th>数量</th>" +
			"</tr></thead>" +
			"<tbody>";

	table.append(thead);
	var rows = recurse(selectedArr, 0).a;
	
	$(rows).each(function() {
		table.find('tbody').append(this);
	});
	
	table.show();
}


function recurse(arr, i){
	var item = arr[i], a = [], specValues = [];
	var ul = $("#skuImg");
	ul.html("");
	
	if (i == (arr.length - 1)) {
		for (var j = 0; j < item.values.length; j++) {
			var specValueColorName = item.values[j].specValueColorName; 
			specValues[j] = {'skuSpecId' :  item.skuSpecId + ':::' + item.values[j].specValueId,
					'skuSpecName' : item.skuSpecName + ':::' + item.values[j].specValueName};
			
			a[j] = "<td>"+item.values[j].specValueName+"</td>";
			if(i == 0){
				a[j] = "<tr> "+ a[j] +
						"<td><input type='text' class='txt lg w-sm' name='skuSalePrice' value='' /></td>" +
						"<td><input type='text' class='txt lg w-sm' name='skuMarketPrice' value='' /></td>" +
						"<td><input type='text' class='txt lg ' name='skuStockBalance' value='' /></td>" +
						"</tr>";
				
				var specValueName = item.values[j].specValueName;
				if (specValueName != null && specValueName != "") {
					ul.append("<li><div class='mod-upload'><img src='${ctx }/static/img/upload_img.jpg' alt='' /></div>" +
							"<p>"+item.skuSpecName+"："+specValueName+"</p>" +
							"<div class='btnWrap'>" +
							"<input type='button' name='' id='' value='设为s主图' class='btn btn-def' /></div></li>");
				}
			}
		}
	}else{
		var next = recurse(arr, i + 1);
		for (var j = 0; j < item.values.length; j++) {
			for (var k = 0; k < next.a.length; k++) {
				var row = "<tr><td>"+item.values[j].specValueName+"</td>" + next.a[k];
				specValues[j * (next.a.length) + k] = 
						{'skuSpecId' :  item.skuSpecId + ':::' + item.values[j].specValueId + '|||' + next.specValues[k].skuSpecId,
						'skuSpecName' : item.skuSpecName + ':::' + item.values[j].specValueName + '|||' + next.specValues[k].skuSpecName};
				
				if (i == 0) {
					row	+= "<td><input type='text' class='txt lg w-sm' name='skuSalePrice' value='' /></td>" +
							"<td><input type='text' class='txt lg w-sm' name='skuMarketPrice' value='' /></td>" +
							"<td><input type='text' class='txt lg ' name='skuStockBalance' value='' /></td>" +
							"</tr>";		
				}
				a[j * (next.a.length) + k] = row;	
			}
			
			var specValueName = item.values[j].specValueName;
			if (specValueName != null && specValueName != "") {
				ul.append("<li><div class='mod-upload'><img src='${ctx }/static/img/upload_img.jpg' alt='' /></div>" +
						"<p>"+item.skuSpecName+"："+specValueName+"</p>" +
						"<div class='btnWrap'>" +
						"<input type='button' name='' id='' value='设为主图' class='btn btn-def' /></div></li>");
			}
		}
	}
	
	return {'a' : a, 'specValues' : specValues};
}


KindEditor.ready(function(K) {
		K.create('textarea[name="detail"]', {
		uploadJson : 'http://192.168.1.18:18080/afd_img/rc/upload?opt=1',
		allowFileManager : false,
		allowPreviewEmoticons: false,
	    urlType:'domain',
		items : ['source', '|', 'undo', 'redo', '|', 'preview', 'template', '|', 
				 'justifyleft', 'justifycenter', 'justifyright','justifyfull', 
				 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 
	             'clearhtml', 'quickformat', '|', 'fullscreen', '|', 'formatblock', 
	             'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 
	             'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', 
	             '|', 'image', 'table', 'hr', 'emoticons', 'map',  'pagebreak', 'link', 'unlink'
	            ],
		afterCreate : function() {
			var self = this;
			K.ctrl(document, 13, function() {
				self.sync();
				document.forms['frm'].submit();
			});
			K.ctrl(self.edit.doc, 13, function() {
				self.sync();
				document.forms['frm'].submit();
			});
		},
		// 失去焦点同步数据
		afterBlur:function() {
			this.sync();
		},
		afterChange:function() {
			this.sync();
			$("#detail_warn").html("");
	//		checkLength($("#detail"),'detail_warn', 40000);
		},
		// 图片地址
	    afterUpload : function(url) {
	    }
	});
});