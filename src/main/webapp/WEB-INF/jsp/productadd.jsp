<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>

<div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>商品管理页面 >> 商品新增页面</span>
        </div>
        <div class="providerAdd">
            <form method="post" action="/fileUpload" enctype="multipart/form-data">
            <div>
                <label for="pimg">选择商品图片</label>

                <input type="file" value="123"/>
                <input type="submit" value="上传" style="position: relative;top: 8px;width:100px;font-size:12px: "/>


            </div>
            </form>

            <form id="addProductForm" name="addProductForm" method="post" action="${pageContext.request.contextPath }/address/add/${loginUI.id}.html" enctype="multipart/form-data">
				<input type="hidden" name="method" value="add">
                <!--div的class 为error是验证错误，ok是验证成功-->
                <input type="hidden" name="pimg" value="${filename}"/>
                <div>
                    <label for="pname">商品名称：</label>
                    <input type="text" name="pname" id="pname" placeholder="请输入商品名称" value="">
					<font color="red"></font>
                </div>
                <div>
                    <label for="pnum">商品数量：</label>
                    <input type="text" name="pnum" id="pnum" placeholder="请输入商品数量" value="">
					<font color="red"></font>
                </div>
                <div>
                    <label for="pprice">商品单价：</label>
                    <input type="text" name="pprice" id="pprice" placeholder="请输入商品单价" value="">
					<font color="red"></font>
                </div>

                <div>
                    <label >请选择商品类别：</label>
                    <!-- 列出所有的角色分类 -->
                    <select name="ptypeid" id="ptypeid">
                        <c:forEach var="u" items="${listSPtype }">
                            <option value="${u.ptypeid }">${u.ptypename }</option>
                        </c:forEach>
                    </select>
                    <font color="red"></font>
                </div>
                
                <div>
                    <label for="pdescription" style="position: relative;bottom:140px ">请输入商品详细描述：</label>
                    <textarea name="pdescription" id="pdescription" placeholder="请输入商品详细描述" cols="30" rows="10"></textarea>
					<font color="red"></font>
                </div>


                <form action="/fileUpload" method="post" enctype="multipart/form-data">
                <div>
                    <label>图片显示</label>
                    <img src="${filename}">
                    <input type="hidden" value="上传">
                </div>
                </form>
                

                <div class="providerAddBtn">
                    <input type="button" name="add" id="add" value="保存" >
					<input type="button" id="back" name="back" value="返回" >
                </div>
            </form>


        </div>
    </div>
</section>
<!--点击修改按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="addAddress">
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
    $("#add").on("click",function(){
        $('.zhezhao').css('display', 'block');
	    $('#addAddress').fadeIn();
	});
    $("#no").on("click",function(){
        $('.zhezhao').css('display', 'none');
	    $('#addAddress').fadeOut();
    });
    $("#yes").on("click",function(){
        $('.zhezhao').css('display', 'none');
	    $('#addAddress').fadeOut();
	    $("#addProductForm").submit();
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
<%-- <script type="text/javascript" src="${pageContext.request.contextPath }/js/useradd.js"></script> --%>
