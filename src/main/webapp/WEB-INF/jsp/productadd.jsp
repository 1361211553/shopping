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

                <input type="file" name="file" value="123"/>
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
<div class="remove" id="addP">
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
	    $('#addP').fadeIn();
	});
    $("#no").on("click",function(){
        $('.zhezhao').css('display', 'none');
	    $('#addP').fadeOut();
    });
    $("#yes").on("click",function(){
        $('.zhezhao').css('display', 'none');
	    $('#addP').fadeOut();
	    $("#addProductForm").submit();
    });
    
    $("#back").on("click",function(){
        history.back(-1);
    });
    //验证
    //验证
    $("#pname").on("blur",function(){
        if($("#pname").val()!=null && $("#pname").val()!=""){
            n=1;
            validateTip($("#pname").next(),{"color":"green"},imgYes,true);
        }else{
            validateTip($("#pname").next(),{"color":"red"},imgNo+" 商品名不能为空，请输入",false);
        }
    }).on("focus",function(){
        validateTip($("#pname").next(),{"color":"#666666"},"* 请输入商品名",false);
    });

    $("#pdescription").on("blur",function(){
        if($("#pdescription").val()!=null && $("#pdescription").val()!=""){
            n=1;
            validateTip($("#pdescription").next(),{"color":"green"},imgYes,true);
        }else{
            validateTip($("#pdescription").next(),{"color":"red"},imgNo+" 商品详细信息不能为空，请输入",false);
        }
    }).on("focus",function(){
        validateTip($("#pdescription").next(),{"color":"#666666"},"* 请输入商品详细信息",false);
    });

    $("#pprice").on("blur",function(){
        var str=/^((0{1}\.\d+)|([1-9]\d*\.{1}\d+)|([1-9]+\d*)|0)$/;
        if($("#pprice").val()!=null && $("#pprice").val()!=""){
            if($("#pprice").val().match(str)){
                n=1;
                validateTip($("#pprice").next(),{"color":"green"},imgYes,true);
            }else{
                validateTip($("#pprice").next(),{"color":"red"},imgNo+" 请输入正确的价格",false);
            }
        }else{
            validateTip($("#pprice").next(),{"color":"red"},imgNo+" 商品价格不能为空，请输入",false);
        }
    }).on("focus",function(){
        validateTip($("#pprice").next(),{"color":"#666666"},"* 请输入商品价格",false);
    });

    $("#pnum").on("blur",function(){
        var str=/^[+]{0,1}(\d+)$/;
        if($("#pnum").val()!=null && $("#pnum").val()!=""){
            if($("#pnum").val().match(str)){
                n=1;
                validateTip($("#pnum").next(),{"color":"green"},imgYes,true);
            }else{
                validateTip($("#pnum").next(),{"color":"red"},imgNo+" 请输入正确的商品数量",false);
            }
        }else{
            validateTip($("#pnum").next(),{"color":"red"},imgNo+" 商品数量不能为空，请输入",false);
        }
    }).on("focus",function(){
        validateTip($("#pnum").next(),{"color":"#666666"},"* 请输入商品数量",false);
    });

    $("#yes").on("click",function(){
        $('.zhezhao').css('display', 'none');
        $('#modifyAddress').fadeOut();
        alert(n);
        if(n == 1){
            alert("保存成功！");
            $("#modifyAddressForm").submit();
        }else{
            alert("请检查输入的错误");
        }

    });
</script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath }/js/useradd.js"></script> --%>
