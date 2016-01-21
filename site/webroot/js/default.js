$(document).ready(function(){
	getCitys(0,0,0);
	uploads();
	//check_All();
	//preShow();
	productShow();
	
	/***手机端的脚本***/
	$(".nullSend").click(function(){
		$(".tipdiv").show();
		$(".tip").show();
	});
	$('.subDiv').click(function(){
		$(".tipdiv").hide();
		$(".tip").hide();						
	});
	$(".paypopInfo a").click(function(){
		$(".paypop").hide();	
		$(".paypopDiv").hide();
	});
	
	$(".videoplay").click(function(){
		var url = $(this).attr("data");
		player = new YKU.Player('centerVideo',{
			styleid: '7',
		    client_id: 'a90a3904221d309a',
		    vid: url, //填写视频ID
		    width: 960,
		    height: 580,
		    autoplay: true,
		    show_related: false
		});
		//$(".nullupload").fadeIn(300);
		$(".uploaddiv").fadeIn(500);
		
	});
	$(".close").click(function(){
		$(".uploaddiv").fadeOut(300);
	});
	
	$("#province").click(function(){$("#province").css("border", "none");$("#city").css("border", "none");$("#county").css("border", "none");});
});
$(window).load(function(){
	scrollHeight();
	addDiv();
});
function isEmail(email){
    reg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
    return reg.test(email);
}

var st;
var PROVID, CITYID, COUNTYID;
function getCitys(province, city, county)
{
	PROVID = province;
	CITYID = city;
	COUNTYID = county;
	
	$("#province").change(function(){
		ajaxCity($(this).val());
	});
	$("#city").change(function(){
		ajaxCouty($(this).val());
	});
	
	if(province) ajaxCity(province);
	if(city) ajaxCouty(city);
}
function ajaxCity(province)
{
	$("#city").empty();
	$("#county").empty();
	$.getJSON('/public/county/?pid='+province+'&ajax=1',function(json){
		var data = json.data;
		for(var i=0;i<data.length;i++){
			var select='';
			if(CITYID==data[i].id) select=' selected="selected"';
			$("#city").append($("<option"+select+">").val(data[i].id).text(data[i].name));
		}
		ajaxCouty(data[0].id);
	});
}
function ajaxCouty(city)
{
	$("#county").empty();
	$.getJSON('/public/county/?pid='+city+'&ajax=1',function(json){
		var data = json.data;
		for(var i=0;i<data.length;i++){
			var select='';
			if(COUNTYID==data[i].id) select=' selected="selected"';
			$("#county").append($("<option"+select+">").val(data[i].id).text(data[i].name));
		}
	});
}

//------------------
function uploads()
{
	if('undefined'!=typeof($("#certification_photo").attr('id'))) fileUpLoad("certification_photo");
	if('undefined'!=typeof($("#person_hold_photo").attr('id'))) fileUpLoad("person_hold_photo");
	if('undefined'!=typeof($("#others_photo").attr('id'))) fileUpLoad("others_photo");
	if('undefined'!=typeof($("#enterprise_legal_photo").attr('id'))) fileUpLoad("enterprise_legal_photo");
	if('undefined'!=typeof($("#enterprise_grant_photo").attr('id'))) fileUpLoad("enterprise_grant_photo");
	if('undefined'!=typeof($("#enterprise_tax_photo").attr('id'))) fileUpLoad("enterprise_tax_photo");
}
function fileUpLoad(id)
{
    'use strict';
    var uploadpath = ('undefined'==typeof($("#fileuploadpath").val())) ? window.location.pathname : '/'+$("#fileuploadpath").val();
    // Change this to the location of your server-side upload handler:
    var url = '/public/upload'+uploadpath+'/'+id,
        uploadButton = $('<button/>')
            .addClass('btn btn-primary uploadBtn')
            .prop('disabled', true)
            .text('Processing...')
            .on('click', function () {
                var $this = $(this),
                    data = $this.data();
					clearTimeout(st);
                $this
                    .off('click')
                    .text('Abort')
                    .on('click', function () {
                        $this.remove();
                        data.abort();
                    });
                data.submit().always(function () {
                    $this.remove();
                });
            });
    $("#"+id).fileupload({
        url: url,
        dataType: 'json',
        autoUpload: false,
        acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,
        maxFileSize: 5000000, // 5 MB
        // Enable image resizing, except for Android and Opera,
        // which actually support image resizing, but fail to
        // send Blob objects via XHR requests:
        disableImageResize: /Android(?!.*Chrome)|Opera/
            .test(window.navigator.userAgent),
        previewMaxWidth: 100,
        previewMaxHeight: 100,
        previewCrop: true
    }).on('fileuploadadd', function (e, data) {
        //data.context = $('<div/>').appendTo("#"+id+'_files');		//一个按钮可以上传多个图片
    	data.context = $('<div/>');
        $.each(data.files, function (index, file) {
            var node = $('<p/>').append($('<span/>').text(file.name));
            if (!index) {
                node.append(uploadButton.clone(true).data(data));
            }
            node.appendTo(data.context);
        });
        $("#"+id+'_files').html(data.context);		//一个按钮只能上传一个图片
        $("#"+id+'_progress').show();
        $("#"+id+'_progress .progress-bar').css('width','0');
		
    }).on('fileuploadprocessalways', function (e, data) {
        var index = data.index,
            file = data.files[index],
            node = $(data.context.children()[index]);
        if (file.preview) {
            node.prepend('<br>').prepend(file.preview);
        }
        if (file.error) {
            node.append('<br>').append($('<span class="text-danger"/>').text(file.error));
        }
        if (index + 1 === data.files.length) {
            data.context.find('button').text('上传').prop('disabled', !!data.files.error);
        }
    }).on('fileuploadprogressall', function (e, data) {
        var progress = parseInt(data.loaded / data.total * 100, 10);
        $("#"+id+'_progress .progress-bar').css('width',progress + '%');
		$("#"+id+'_progress .progress-bar').addClass("addTotle");
		if(progress==100){
			$("#"+id+'_progress').fadeOut(3000);
		}
    }).on('fileuploaddone', function (e, data) {
        $.each(data.result[id], function (index, file) {
            if (file.url) {
                var link = $('<a>').attr('target', '_blank').prop('href', file.url);
                $(data.context.children()[index]).wrap(link);
            } else if (file.error) {
                var error = $('<span class="text-danger"/>').text(file.error);
                $(data.context.children()[index]).append('<br>').append(error);
            }
            $("#"+id+'_val').val(file.name);
        });
    }).on('fileuploadfail', function (e, data) {
        $.each(data.files, function (index) {
            var error = $('<span class="text-danger"/>').text('File upload failed.');
            $(data.context.children()[index]).append('<br>').append(error);
        });
    }).prop('disabled', !$.support.fileInput).parent().addClass($.support.fileInput ? undefined : 'disabled');
}
//-------------------------------
function signUpOne()
{
	var type = $("#type").val();
	var step = $("#step").val();
	if(1==step){
		if(1==type){
			var enterprise_name = $("#enterprise_name").val();
			var identity = $("#identity").val();
			var legal_name = $("#legal_name").val();
			var legal_identity = $("#legal_identity").val();

			if(enterprise_name.length<3){
				$("#enterprise_name").addClass("error-input");
				return false;
			}
			if(identity.length<10){
				$("#identity").addClass("error-input");
				return false;
			}
			if(legal_name.length<2){
				$("#legal_name").addClass("error-input");
				return false;
			}
			if(legal_identity.length<15){
				$("#legal_identity").addClass("error-input");
				return false;
			}
			if(!signUpOneCheck()) return false;
			
			$.cookie("enterprise_name", enterprise_name ,{expires:1, path:'/'});
			$.cookie("identity", identity ,{expires:1, path:'/'});
			$.cookie("legal_name", legal_name ,{expires:1, path:'/'});
			$.cookie("legal_identity", legal_identity ,{expires:1, path:'/'});
		}else{
			var legal_name = $("#legal_name").val();
			var identity = $("#identity").val();			
			if(legal_name.length<2){
				$("#legal_name").addClass("error-input");
				return false;
			}
			if(identity.length<10){
				$("#identity").addClass("error-input");
				return false;
			}
			if(!signUpOneCheck()) return false;
			
			$.cookie("legal_name", legal_name ,{expires:1, path:'/'});
			$.cookie("identity", identity ,{expires:1, path:'/'});
		}
		location.href=location.href+"&s=2";
	}else if(2==step){
		if(checkSignin()){
			var user_phone = $("#user_phone").val();
			var yzm = $("#yzm").val();
			var sigtoken = $("#sigtoken").val();
			$("#loading").show();
			$.ajax({
		        type: 'post',
		        dataType: 'json',
		        data: {userphone:'m'+user_phone,sigtoken:sigtoken,yzm:yzm,type:type},
		        url: "/sign?a=up",
		        timeout:5000,
		        error: function (XMLHttpRequest, textStatus, errorThrown) {$(".error").html('请求失败，请重试');$(".error").show();$("#loading").hide();$(".success").hide();},
		        success: function (json) {
		        	$("#loading").hide();
		    		if(0==json.status){
		    			$.cookie("enterprise_name", null);
		    			$.cookie("identity", null);
		    			$.cookie("legal_name", null);
		    			$.cookie("legal_identity", null);
		    			$.cookie("email", null);
		    			$.cookie("province", null);
		    			$.cookie("city", null);
		    			$.cookie("county", null);
		    			$.cookie("address", null);
		    			$.cookie("postcode", null);
		    			location.href="/";
		    		}else{
		    			$(".error").html(json.msg);
		    			$(".error").show();
		    			$(".success").hide();
		    		}
		        }
		    });
		}
	}
}
function signUpOneCheck()
{
	var email = $("#email").val();
	var province = $("#province").val();
	var city = $("#city").val();
	var county = $("#county").val();
	var address = $("#address").val();
	var postcode = $("#postcode").val();
	
	if(''==email || !isEmail(email) ){
		$("#email").addClass("error-input");
		return false;
	}
	if(''==province || '省份'==province){
		$("#province").css("border", "1px solid #f00");
		return false;
	}
	if(''==city || '城市'==city){
		$("#city").css("border", "1px solid #f00");
		return false;
	}
	if(''==county || '区/县'==county){
		$("#county").css("border", "1px solid #f00");
		return false;
	}
	if(''==address){
		$("#address").addClass("error-input");
		return false;
	}
	
	if(''!=province && !city){
		ajaxCity(province);
		$("#city").addClass("error-input");
		return false;
	}
	if(''!=city && !county){
		ajaxCouty(city);
		$("#county").addClass("error-input");
		return false;
	}
	if(''!=postcode && postcode.length!=6){
		$("#postcode").addClass("error-input");
		return false;
	}
	
	$.cookie("email", email ,{expires:1, path:'/'});
	$.cookie("province", province ,{expires:1, path:'/'});
	$.cookie("city", city ,{expires:1, path:'/'});
	$.cookie("county", county ,{expires:1, path:'/'});
	$.cookie("address", address ,{expires:1, path:'/'});
	$.cookie("postcode", postcode ,{expires:1, path:'/'});
	
	return true;
}

function certificationval()
{
	$("#ckval").val($("#sales_channel").val());
}
function certification()
{
	var ckval = $("#ckval").val();
	if(ckval.length<2) return false;
	
	var type = $("#type").val();
	if($("#sales_channel").val().length<2){
		$("#sales_channel").addClass("error-input");
		$(".error").html('请填写销售渠道');
		$(".error").show();
		return false;
	}
	if($("#how_to_kown_we").val().length<2){
		$("#how_to_kown_we").addClass("error-input");
		$(".error").html('请填写获知渠道');
		$(".error").show();
		return false;
	}
	if($("#certification_photo_val").val().length<2){
		$("#certification_photo").addClass("error-input");
		$(".error").html('请上传证件照片');
		$(".error").show();
		return false;
	}
	if($("#person_hold_photo_val").val().length<2){
		$("#person_hold_photo").addClass("error-input");
		$(".error").html('请上传手持证件照片');
		$(".error").show();
		return false;
	}
	if(1==type){
		if($("#enterprise_legal_photo_val").val().length<2){
			$("#enterprise_legal_photo").addClass("error-input");
			$(".error").html('请上传企业法人证件照片');
			$(".error").show();
			return false;
		}
	}
	return true;
}

function getDuanXinYZM()
{
	//$(".error").hide();
	var user_phone = $("#user_phone").val();
	var token = $("#token").val();
	var sign = $("#sign").val();
	if(user_phone.length!=11){$('input[name="user"]').addClass("error-input");/*$(".error").show();*/$(".error").html("请正确输入手机号"); return false;}
	$("#cleartmpuserphone").show();
	$.ajax({
        type: 'post',
        dataType: 'json',
        data: {userphone:'m'+user_phone,token:token,sign:sign},
        url: "/public/dxyzm",
        timeout:5000,
        error: function (XMLHttpRequest, textStatus, errorThrown) {$(".error").html('请求失败，请重试');$(".error").show();},
        success: function (json) {
    		if(0==json.status){
    			$(".success").html("短信发送成功");
    			//$(".success").show();
    			$(".error").hide();
				countDown();
    		}else if(-1==json.status){
    			location.reload();
    		}else{
    			$(".error").html(json.msg);
    			//$(".error").show();
    		}
        }
    });
}
function clearTmpUserPhone()
{
	$.getJSON('/public/cleartmpuserphone',function(json){
		if(0==json.status){
			$("#user_phone").val('');
			$("#cleartmpuserphone").hide();
		}
	});
}

$(function(){
	$('.import').focus(function(){
		$(this).removeClass('error-input');
		//$(".success").html("");
		$(".error").html("");
	});
	$('.phone').focus(function(){
		$(this).removeClass('error-input');
		$(".error").html("");
		//$(".success").html("");
	});
	$('#keyword').focus(function(){
		$(this).removeClass('error-input');
		$(".error").html("");
		//$(".success").html("");
	});
	$('#stardate').focus(function(){
		$(this).removeClass('error-input');
		$(".error").html("");
		//$(".success").html("");
	});
	$('#enddate').focus(function(){
		$(this).removeClass('error-input');
		$(".error").html("");
		//$(".success").html("");
	});
});

function checkSignin(){
	if($('input[name="user"]').val().length!=11){
		$('input[name="user"]').addClass("error-input");
		$(".error").html('手机号输入有误！');
		$(".error").show();
		return false;
	}
	if($('input[name="yzm"]').val().length!=6){
		$('input[name="yzm"]').addClass("error-input");
		$(".error").html('请正确输入验证码！');
		$(".success").hide();
		$(".error").show();
		return false;
	}
	$("#user_phones").val('m'+$('input[name="user"]').val());
	return true;
}

function checkSearch(){
	if($('#keyword').val().length<2){
		$('#keyword').addClass("error-input");
		return false;
	}
	return true;
}

function checkOderDate(){
	if($('#stardate').val().length<2){
		$('#stardate').addClass("error-input");
		return false;
	}
	if($('#enddate').val().length<2){
		$('#enddate').addClass("error-input");
		return false;
	}
	a = new Date($('#stardate').val());
	b = new Date($('#enddate').val());
	if(a > b){
		$('#stardate').addClass("error-input");
		//alert('开始日期不能大于结束日期');
		return false;
	}
	return true;
}


var time = 60;
var _o =$("#loginSend"), _p = $("#yzm");
function countDown(){
	if(time==0){
		_o.val('获取验证码');
		_o.removeClass('sendOver');
		_o.removeAttr("disabled");
		$(".success").html('');
		time = 60;
		return false;
	}else{
		_o.val("重新发送(" + time + ")");
		_o.attr("disabled","disabled");
		_p.removeAttr("disabled");
		_p.removeClass("phoneStart");
		_o.addClass('sendOver');
		time--;
	}
	setTimeout(function(){countDown()}, 1000);
}



function addDiv(){
	var wd = $(window).width();
	if(wd>1360){
		$(".productDetail").css("padding-right","225px");
		$(".seeProduct").show();
	}else{
		$(".productDetail").css("padding-right","0");
		$(".seeProduct").hide();
	}
}

function scrollHeight(){
	var rightHeight = $(".mainDiv").height();		
	var leftHeight = $(window).height();
	if(rightHeight>=leftHeight){
		$("#header").css("height",rightHeight);
	}else{
		$("#header").css("height","100%");	
	}	
}

function left(){
	var nmb = $("#proInput").val();
	if(nmb<3){
		$("#listLeft").css("color","#aaa");
		$("#listLeft").css("cursor","not-allowed");
		
	}else{
		$("#listLeft").css("color","#000");
		$("#listLeft").css("cursor","pointer");	
	}
	if(nmb>1){
		nmb = nmb-1;
		$("#proInput").val(nmb);
		$("#qtidhideinput").val(nmb);
	}
	$("#listRight").css("color","#000");
}
function right(max){
	var nmbp = $("#proInput").val();           			
	nmbp = parseInt(nmbp)+1;
	if(nmbp > max){
		$("#listRight").css("color","#aaa");
		return false;
	}
	$("#listLeft").css("color","#000");
	$("#listLeft").css("cursor","pointer");
	$("#proInput").val(nmbp);
	$("#qtidhideinput").val(nmbp);
}
function valChange(max){
	var nmbp = $("#proInput").val();
	nmbp = parseInt(nmbp);
	if(nmbp =='' || nmbp <= 0 || isNaN(nmbp)){
		$("#proInput").val(1);
	}
	if(nmbp > max){
		$("#proInput").val(max);
	}
}

function productShow(){
	$(".productSmall ul li").click(function(){
		var imgUrl = $(this).children("img").attr("src");
		$("#zoom_img").attr("src",imgUrl);
		$("#zoom_img").attr("data-zoom-image",imgUrl);
		//$(".zoomWindow").css("background-image","url("+imgUrl+")");
		$(this).addClass('select').siblings().removeClass('select');
	});	
}

function cancelOrder(order_code){
	if(confirm("确定取消订单？")){
		$.ajax({
	        type: 'post',
	        dataType:'json',
	        data: {t:'ajax', a:'cancel', order_code:order_code},
	        url: "/order/",
	        timeout:5000,
	        error: function (XMLHttpRequest, textStatus, errorThrown) {alert('请求失败，请重试');},
	        success: function (json) {
	        	location.reload();
	        }
	    });
	}else{
		 return false;
	}
}

function showShippingInfo(ship_no, ship_name, n){
	$.ajax({
        type: 'post',
        dataType:'json',
        data: {a:'showShippingInfo', ship_no:'m'+ship_no, ship_name:ship_name},
        url: "/ajax/",
        timeout:5000,
        error: function (XMLHttpRequest, textStatus, errorThrown) {alert('请求失败，请重试');},
        success: function (json) {
        	if(0==json.status){    			
        		$("#shippinginfo"+n).html('<iframe src="'+json.data+'" id="shippinginfo_iframe" scrolling="no"></iframe><br><a href="http://www.kuaidi100.com">数据由快递100提供</a>');
        		$("#shippinginfobtn"+n).hide();
        	}else{
    			$("#shippinginfo"+n).html('未查询到记录');
    		}
        	$("#shippinginfo"+n).show();
        }
    });
}

function replenSubmit(){
	if(confirm("确定补货？")){
		$("#replenForm").submit();
	}else{
		return false;
	}
}

function payShowPop(order_code){
	$(".paypop").show();
	$(".paypopDiv").show();
	$(".paypopDiv .payover").attr('href','/order/?order_code='+order_code);
}

//----------------------------- Favorite
function addFav(sku_id){
	$.ajax({
        type: 'post',
        dataType:'json',
        data: {t:'ajax', a:'add', sku_id:sku_id},
        url: "/favorite",
        timeout:5000,
        error: function (XMLHttpRequest, textStatus, errorThrown) {$(".error").html('请求失败，请重试');$(".error").show();},
        success: function (json) {
    		if(0==json.status){    			
    			addFavShow();
    		}else{
    			$(".error").html(json.msg);
    			$(".error").show();
    		}
        }
    });
}
function addFavShow()
{
	var flyElm = $('#zoom_img').clone().css('opacity','0.7');
	flyElm.css({
		'z-index': 9000,
		'display': 'block',
		'position': 'absolute',
		'top': $('.favbt').offset().top +'px',
		'left': $('.favbt').offset().left +'px',
		'width': 50 +'px',
		'height': 50 +'px',
		'border': '2px solid #f00'
	});
	$('body').append(flyElm);
	flyElm.animate({
		top:$('#favoritea').offset().top,
		left:$('#favoritea').offset().left,
		width:30,
		height:30,
	},'slow');
	if(flyElm.offset.left === $("#favoritea").offset.left){
		flyElm.fadeOut();
	}
}
function delFav(id){
	if(confirm("确定删除？")){
		$.ajax({
	        type: 'post',
	        dataType:'json',
	        data: {t:'ajax', a:'remove', id:id},
	        url: "/favorite",
	        timeout:5000,
	        error: function (XMLHttpRequest, textStatus, errorThrown) {$(".error").html('请求失败，请重试');$(".error").show();},
	        success: function (json) {
	        	location.reload();
	        }
	    });
	}else{
		 return false;
	}
}
function favBuy(sku_id)
{
	$("#productForm_"+sku_id).submit();
}
//----------------------------- END Favorite



