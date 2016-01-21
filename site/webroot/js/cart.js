$(function(){
 checkoutAddrSelect();
/**全选**/
	$(".selectall").click(function() {
		if(this.checked){
			$('#cartForm input.tpx:checkbox').each(function(){
				$(this).attr("checked", true);									   
			});
			$(".bt_ck").attr("disabled",false);
			//$("input.prolist_input").attr("name","qts[]");
			//$("#not_c").hide();
			eachTdm();
			//eachTdj();
		}else{
			$('#cartForm input.tpx:checkbox').each(function(){
				
				$(this).attr("checked", false);									   
			});
			$(".price_last").html("0.00");
			$(".last-p").html("0.00");
		}
	});
	var $submitBox = $("#cartForm input.tpx");
	$submitBox.attr("checked",false);
	$submitBox.click(function(){
		var yh = parseFloat($("#leveldiscount").val());
		var yf = parseFloat($(".price-c").html());
		var hdadd = yf + yh;
		var hdp = mu - hdadd;
		if($(this).attr("checked")=='checked'){
			var mo = $(this).val();
			var mu = parseInt($(".price_last").html());
			var no = parseFloat($("#Lst"+mo).html().replace(",",''));
			var val_d = parseInt(mu) + parseInt(no);
			var val_add = (parseInt(val_d)* yh)+yf;
			var sc_d = (parseInt(val_d) * yh)+yf;
			//$(this).parent().siblings("td").children("input.prolist_input").attr("name","qts[]");
			$(".price_last").html(parseFloat(val_d).toFixed(2));
			$(".last-p").html(parseFloat(val_add).toFixed(2));
			$(".bt_ck").attr("disabled",false);
			//$(this).attr("checked",false);
			$submitBox.each(function(){
				if($("#cartForm input.tpx:checked").length == $submitBox.length){
					$("#checkAll").attr("checked", true);
				}
			})
		}else{
			var mo = $(this).val();
			var mu = parseInt($(".price_last").html());
			var no = parseFloat($("#Lst"+mo).html().replace(",",''));
			val_d = parseInt(mu) - parseInt(no);
			//$(this).attr("checked",true);
			val_add = (parseInt(val_d) - parseInt(hdadd))<=0?0:(parseInt(val_d) - parseInt(hdadd));
			sc_d = (parseInt(val_d) - parseInt(hdadd))<=0?0:(parseInt(val_d) - parseInt(hdadd));
			$("#checkAll").attr("checked",false);
			$(".price_last").html(parseFloat(val_d).toFixed(2));
			$(".last-p").html(parseFloat(val_add).toFixed(2));
			$submitBox.each(function(){
				if($("#cartForm input.tpx:checked").length>0){
					$(".bt_ck").attr("disabled",false);
				}else{
					$(".bt_ck").attr("disabled",'disabled');
				}
			})
		}
	});
	$submitBox.each(function(){
		if($submitBox.attr("checked")=='checked'){
			$(".bt_ck").attr("disabled",false);
		}else{
			$(".bt_ck").attr("disabled","disabled");
		}				  
	});
	/**全选 end**/
	
	$("#bankpay").click(function(){
		$('.bank_lists').show();					 
	});
	var payDt = $("dl.edit_info dt")
	payDt.children("label").click(function(){
		payDt.removeClass("click");
		$(this).parent("dt").addClass("click");
	});
});

function lefta(n){
	var nmb = $("#proInput"+n).val();
	var nmb_st = $("#startVal"+n).html();
	nmb_st = nmb_st.replace(',','');
	var nmb_start = parseInt(nmb_st.replace(',',''));
	var chuangeNum = 0;
	if(nmb<3){
		$("#listLeft"+n).css("color","#aaa");
		$("#listLeft"+n).css("cursor","not-allowed");
		
	}else{
		$("#listLeft"+n).css("color","#000");
		$("#listLeft"+n).css("cursor","pointer");	
	}
	if(nmb>1){
		nmb = nmb-1;
		$("#proInput"+n).val(nmb);
		$("#Lst"+n).html(parseFloat(nmb*nmb_st).toFixed(2));
		
		var $submitBox = $("#listLeft"+n).parent().siblings("td").children("#cartForm input.tpx");
		if($submitBox.attr("checked")=='checked'){
			var tbh = 0;
			var tkd = parseInt($(".price_last").html());
			var tks = parseInt($(".last-p").html());
			var trd = parseInt($(".rewards_last").html());
			var ttd =tkd - parseInt(nmb_st);
			var ttdb =trd - parseInt(nmb_st);
			var tts = tks - parseInt(nmb_st);
			$(".price_last").html(parseFloat(ttd).toFixed(2));
			var yh = parseFloat($("#leveldiscount").val());
			$(".last-p").html(parseFloat(ttd*yh).toFixed(2));
		}
		//eachTdm();
		//eachTdj();
	}
	
	
	$(".prolist_input").each(function(){
		for(var i=0; i<$(this).length;i++){
			var h_st = $(this).val();
			chuangeNum = parseInt(chuangeNum) + parseInt(h_st);
		}
		$("#cartNum").html(chuangeNum);
		$(".cart_pop").html(chuangeNum);
	});
}
function righta(m){
	var nmbp = $("#proInput"+m).val();
	var nmb_st = $("#startVal"+m).html();
	nmb_st = nmb_st.replace(',','');
	var nmb_start = parseInt(nmb_st.replace(',',''));
	var chuangeNum = 0;
	nmbp = parseInt(nmbp)+1;
	$("#listLeft"+m).css("color","#000");
	$("#listLeft"+m).css("cursor","pointer");
	$("#proInput"+m).val(nmbp);
	//alert(nmb_st);
	$("#Lst"+m).html(parseFloat(nmbp*nmb_st).toFixed(2));
	$(".prolist_input").each(function(){
		for(var i=0; i<$(this).length;i++){
			var h_st = $(this).val();
			chuangeNum = parseInt(chuangeNum) + parseInt(h_st);
		}
		$(".cart_pop").html(chuangeNum);
	});
	
	var $subBoxRight = $("#listLeft"+m).parent().siblings("td.selectbox").children("#cartForm input.tpx");
	if($subBoxRight.attr("checked")=='checked'){
		var tbh = 0;
		var tkd = parseInt($(".price_last").html());
		var trlast = parseInt($(".last-p").html());
		var trd = parseInt($(".rewards_last").html());
		var ttd =tkd + parseInt(nmb_st);
		var ttlast =trlast + parseInt(nmb_st);
		var ttdb =trd + parseInt(nmb_st);
		$(".price_last").html(parseFloat(ttd).toFixed(2));
		var yh = parseFloat($("#leveldiscount").val());
		$(".last-p").html(parseFloat(ttd*yh).toFixed(2));
	}
}

function blurShow(m){
	var nmbp = $("#proInput"+m).val();
	if(nmbp =='' || nmbp <= 0){
		$("#proInput").val(1);
	}
	var nmb_st = $("#startVal"+m).html();
	nmb_st = nmb_st.replace(',','');
	var nmb_start = parseInt(nmb_st.replace(',',''));
	
	$("#listLeft"+m).css("color","#000");
	$("#listLeft"+m).css("cursor","pointer");
	$("#proInput"+m).val(nmbp);
	$("#Lst"+m).html(parseFloat(nmbp*nmb_st).toFixed(2));

}

function eachTdm(){
	var tbh = 0;
	var yh = parseFloat($("#leveldiscount").val());
	var yf = parseFloat($(".price-c").html());
	//var hdp = yf-yh;
	$(".subtotal_d").each(function(){
		for(var i=0; i<$(this).length;i++){
			var h_st = $(this).children("dfn").html();
			h_st = h_st.replace(',','');
			var nmpl = parseFloat(h_st).toFixed(2);
			tbh = parseInt(tbh) + parseInt(nmpl);
		}
		$(".price_last").html(parseFloat(tbh).toFixed(2));
		$(".last-p").html(parseFloat((tbh*yh)+yf).toFixed(2));
	});	
}
function checkoutAddrSelect(){
	$(".new_adddiv").hover(function(){
		var sobx = $(this).children("em").attr("id");
		//alert(sobx); 
		if(!sobx){
			//alert(123);
			$(this).children(".change_mo").css("display","inline-block");
			$(this).children(".orderhide").css("display","inline-block");
		}else{
			$(this).children(".change_mo").css("display","none");	
			$(this).children(".orderhide").css("display","none");
		}
		//$(this).children(".editadd").css("display","inline-block");
	},function(){
		$(this).children(".change_mo").css("display","none");
		$(this).children(".orderhide").css("display","none");
	});
	$(".new_adddiv label").click(function(){
		$(this).parent().addClass("radiodiv").siblings().removeClass("radiodiv");
		$(this).parent().siblings().children(".moren").css("display","none");
		$(this).siblings(".moren").css("display","block");
		//location.reload();
	});
	
	$(".change_mo").click(function(){
		$(this).siblings().children("input").attr("checked","checked");
		$(this).css("display","none");
		$(this).siblings("em").attr("id","onluy");
		$(this).parent().siblings().children("em").removeAttr("id");
		$(this).siblings(".editadd").removeClass("change_mo");
		$(this).parent().siblings().children("a.editadd").addClass("change_mo");
		
		$(this).parent().siblings().children(".moren").hide();
		$(this).parent().children(".moren").show();
		$(this).parent().siblings().removeClass('radiodiv');
		$(this).parent().addClass('radiodiv');
		//location.reload();
	});
	
	$("#madecode").click(function(){
		if($("#madecode").attr("checked")=="checked"){
			
			$("#codeInput").css("display","inline-block");	
			$("#codeNum").css("display","block");
		}else{
			$("#codeInput").css("display","none");	
			$("#codeNum").css("display","none");
			$("#made_jf").val('');
			$("#dk_j").html('0.00');
		}
	});
	
	$("#bankpay").click(function(){
		$('.bank_lists').show();					 
	});
}

//------------------------- 地址列表
/*添加新地址*/
function addNewAddress(n){
    $.fancybox({
        type: 'ajax',
        href: "/address/?t=ajax&a=addNew&n="+n
    });
}
/*编辑地址*/
function editAddress(addressId, n){
    $.fancybox({
        type: 'ajax',
        href: "/address/?t=ajax&a=edit&addressid="+addressId+"&n="+n
    });
}
/*设为默认地址*/
function setUserDefAddr(addressId, n){
    $.fancybox.showLoading();
    $.getJSON("/address", {t:'ajax', a:'setDefault', addressid: addressId, n:n}, function(data){
    	$.fancybox.hideLoading();
        if(0==data.status) window.location.reload();
    });
}
/*删除地址*/
function removeAddress(addressId){
    if( confirm('确定要删除？') ){
        $.fancybox.showLoading();
        $.getJSON("/address", {t:'ajax', a:'del', addressid: addressId}, function(data){
            $.fancybox.hideLoading();
            if(0==data.status) window.location.reload();
        });
    }
}
/*检查提交数据*/
function fillAddressBox(n)
{
	$("#mmobile").val('m'+$("#mobile").val());
	if(0==n) return true;
	
	if(1==n){
		$.ajax({      
			type: "POST",
			dataType: "json",
			url: "/address/?t=ajax&a=save&n=1",
			data: $("#checkoutChangeAddressForm").serialize(),
			success: function(json){
				if(0==json.status){
					var mr = '<em>默认地址</em>';
					if(9999==json.data.sort){
						$("#onluy").attr('id','');
						mr = '<em id="onluy">默认地址</em>';
					}
					$("#addressList .new_adddiv.radiodiv").removeClass('radiodiv');
					$("#addressList .moren").hide();
					$("#addressList").append('<div class="new_adddiv radiodiv"><label><input type="radio" name="address" value="'+json.data.id+'" class="changeAdd" checked="checked">'+json.data.pcc+' '+json.data.receiver_address+' '+json.data.receiver_postcode+' ('+json.data.receiver_name+') '+json.data.receiver_phone+'</label>'+mr+'<a href="javascript:;" class="change_mo" style="display: none;" onclick="setUserDefAddr('+json.data.id+', 1)">设置为默认地址</a><a href="javascript:;" class="editadd orderhide" onclick="editAddress('+json.data.id+',1)" style="display: none;">修改本地址</a><div class="moren" style="display:block;">送货到</div></div>');
					checkoutAddrSelect();
				}else{
					alert('添加失败，请填齐全资料信息');
				}
			}  
		});
		$.fancybox.close();
	}
	if(2==n){
		$.ajax({      
			type: "POST",
			dataType: "json",
			url: "/address/?t=ajax&a=save&n=1",
			data: $("#checkoutChangeAddressForm").serialize(),
			success: function(json){
				if(0==json.status){
					var mr = '<em>默认地址</em>';
					if(9999==json.data.sort){
						$("#onluy").attr('id','');
						mr = '<em id="onluy">默认地址</em>';
					}
					$("#addressList .new_adddiv.radiodiv").removeClass('radiodiv');
					$("#addressList .moren").hide();
					
					var obj = $("#address_"+json.data.id);
					obj.parent().addClass('radiodiv');
					obj.parent().html('<label><input type="radio" name="address" value="'+json.data.id+'" class="changeAdd" checked="checked">'+json.data.pcc+' '+json.data.receiver_address+' '+json.data.receiver_postcode+' ('+json.data.receiver_name+') '+json.data.receiver_phone+'</label>'+mr+'<a href="javascript:;" class="change_mo" style="display: none;" onclick="setUserDefAddr('+json.data.id+', 1)">设置为默认地址</a><a href="javascript:;" class="editadd orderhide" id="address_'+json.data.id+'" onclick="editAddress('+json.data.id+',1)" style="display: none;">修改本地址</a><div class="moren" style="display:block;">送货到</div>');
					checkoutAddrSelect();
				}else{
					alert('添加失败，请填齐全资料信息');
				}
			}  
		});
		$.fancybox.close();
	}
	return false;
}

function cartSubmit()
{
	flyDiv();
	var sku_id = parseInt($("#sku_id").val());
	if(isNaN(sku_id)) return false;
	var qt = parseInt($("#proInput").val());
	if(isNaN(qt)) return false;
	var currCartNum = parseInt($("#cartTopNum").html());
	if(isNaN(currCartNum)) currCartNum = 0;
	$.ajax({
        type: 'post',
        dataType:'json',
        data: {t:'ajax', a:'add', sku_id:sku_id, qt:qt},
        url: "/cart",
        timeout:5000,
        error: function (XMLHttpRequest, textStatus, errorThrown) {$(".error").html('请求失败，请重试');$(".error").show();},
        success: function (json) {
    		if(0==json.status){    			
    			$("#cartTopNum").html(currCartNum+qt);
    		}else{
    			$(".error").html(json.msg);
    			$(".error").show();
    		}
        }
    });
}

function flyDiv(){
	var flyElm = $('#zoom_img').clone().css('opacity','0.7');
		flyElm.css({
			'z-index': 9000,
			'display': 'block',
			'position': 'absolute',
			'top': $('.cartbt').offset().top +'px',
			'left': $('.cartbt').offset().left +'px',
			'width': 50 +'px',
			'height': 50 +'px',
			'border': '2px solid #f00'
		});
		$('body').append(flyElm);
		flyElm.animate({
			top:$('#cartTopNum').offset().top,
			left:$('#cartTopNum').offset().left,
			width:30,
			height:30,
		},'slow');
		if(flyElm.offset.left === $("#cartTopNum").offset.left){
			flyElm.fadeOut();
		}
}

function removeProduct(sku_id)
{
	$.ajax({
        type: 'post',
        dataType:'json',
        data: {t:'ajax', a:'remove', sku_id:sku_id},
        url: "/cart",
        timeout:5000,
        error: function (XMLHttpRequest, textStatus, errorThrown) {$(".error").html('请求失败，请重试');$(".error").show();},
        success: function (json) {
    		if(0==json.status){    			
    			location.reload();
    		}else{
    			$(".error").html(json.msg);
    			$(".error").show();
    		}
        }
    });
}







