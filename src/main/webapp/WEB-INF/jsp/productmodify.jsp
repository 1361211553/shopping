<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>商品管理页面 >> 商品信息修改页面</span>
            <span><font color="red">${message }</font></span>
        </div>
        <div class="providerAdd">
        <form id="modifyAddressForm" name="userForm" method="post" action="${pageContext.request.contextPath }/address/modify/${loginUI.id }.html">
			<input type="hidden" name="method" value="modifyexe">
			<input type="hidden" name="id" value="${address.id }"/>
			   <div>
                    <label for="contact">联系人名称：</label>
                    <input type="text" name="contact" id="contact" value="${address.contact }"> 
					<font color="red"></font>
               </div>
               
               <div>
                    <label for="addressdesc">详细地址：</label>
                    <input type="text" name="addressdesc" id="addressDesc" value="${address.addressdesc }"> 
					<font color="red"></font>
               </div>
			   
			   <div>
                    <label for="postcode">邮政编码：</label>
                    <input type="text" id="postcode" name="postcode" value="${address.postcode }">
                    <font color="red"></font>
               </div>
			   
			   <div>
                    <label for="tel">联系人电话：</label>
                    <input type="text" id="tel" name="tel" value="${address.tel }">
                    <font color="red"></font>
               </div>
		       <div>
                    <label for="createdby">创建者id</label>
                    <input type="text" name="createdby" id="createdby" readonly="readonly" value="${address.id }"> 
                    <font color="red"></font>
               </div>
               <div>
                    <label for="creationdate">创建时间</label>
                    <input type="text" name="creationdate" id="creationdate" readonly="readonly" 
                     value="<fmt:formatDate value='${address.creationdate}' pattern='yyyy-MM-dd'/>">
                </div>
				<div>
                    <label >对接人姓名：</label>
                    <!-- 列出所有的对接人姓名 -->
					
					<select name="userid" id="userid">
					    <c:forEach var="User" items="${userList }">
					    <option
					    <c:if test="${User.id == address.userid }">selected="selected"</c:if>
					     value="${User.id }" >${User.username }</option>    
					    </c:forEach>
					</select>
        			<font color="red"></font>
                </div>
			 <div class="providerAddBtn">
                    <input type="button" name="save" id="saveAddress" value="保存" />
                    <input type="button" id="back" name="back" value="返回"/>
                </div>
            </form>
        </div>
    </div>
</section>

<!--点击修改按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="modifyAddress">
    <div class="removerChid">
        <h2>提示</h2>
        <div class="removeMain">
            <p>确定要提交数据吗？</p>
            <a href="#" id="yes">确定</a>
            <a href="#" id="no">取消</a>
        </div>
    </div>
</div>

<%@include file="/WEB-INF/jsp/common/foot.jsp" %>

<script>
    $("#saveAddress").on("click",function(){
        $('.zhezhao').css('display', 'block');
	    $('#modifyAddress').fadeIn();
	
	});
    $("#no").on("click",function(){
        $('.zhezhao').css('display', 'none');
	    $('#modifyAddress').fadeOut();
    });
    $("#yes").on("click",function(){
        $('.zhezhao').css('display', 'none');
	    $('#modifyAddress').fadeOut();
	    $("#modifyAddressForm").submit();
    });
    
    $("#back").on("click",function(){
        history.back(-1);
    });
    
     //验证
    $("#contact").on("blur",function(){
        if($("#contact").val()!=null && $("#contact").val()!=""){
            validateTip($("#contact").next(),{"color":"green"},imgYes,true);
        }else{
            validateTip($("#contact").next(),{"color":"red"},imgNo+" 联系人不能为空，请输入",false);
        }
    }).on("focus",function(){
        validateTip($("#contact").next(),{"color":"#666666"},"* 请输入联系人",false);
    });
    
    $("#addressDesc").on("blur",function(){
        if($("#addressDesc").val()!=null && $("#addressDesc").val()!=""){
            validateTip($("#addressDesc").next(),{"color":"green"},imgYes,true);
        }else{
            validateTip($("#addressDesc").next(),{"color":"red"},imgNo+" 地址不能为空，请输入",false);
        }
    }).on("focus",function(){
        validateTip($("#addressDesc").next(),{"color":"#666666"},"* 请输入地址",false);
    });
    
    $("#postcode").on("blur",function(){
        var str=/^[1-9][0-9]{5}$/;
        if($("#postcode").val()!=null && $("#postcode").val()!=""){
            if($("#postcode").val().match(str)){
                validateTip($("#postcode").next(),{"color":"green"},imgYes,true);
            }else{
                validateTip($("#postcode").next(),{"color":"red"},imgNo+" 请输入正确的邮政编码",false);
            }
        }else{
            validateTip($("#postcode").next(),{"color":"red"},imgNo+" 邮政编码不能为空，请输入",false);
        }
    }).on("focus",function(){
        validateTip($("#postcode").next(),{"color":"#666666"},"* 请输入邮政编码",false);
    });
    
    $("#tel").on("blur",function(){
        var str=/^1(3[0-9]|5[189]|8[6789])[0-9]{8}$/;
        if($("#tel").val()!=null && $("#tel").val()!=""){
            if($("#tel").val().match(str)){
                validateTip($("#tel").next(),{"color":"green"},imgYes,true);
            }else{
                validateTip($("#tel").next(),{"color":"red"},imgNo+" 请输入正确的手机号码",false);
            }
        }else{
            validateTip($("#tel").next(),{"color":"red"},imgNo+" 手机号码不能为空，请输入",false);
        }
    }).on("focus",function(){
        validateTip($("#tel").next(),{"color":"#666666"},"* 请输入手机号码",false);
    });
</script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath }/js/usermodify.js"></script> --%>
