<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>

  <div class="right">
      <div class="location">
          <strong>你现在所在的位置是:</strong>
          <span>商品类别管理页面 >> 商品类别修改页</span>
      </div>
      <div class="providerAdd">
          <form id="providerForm" name="providerForm" method="post" action="${pageContext.request.contextPath }/sptype/modify">
              <!--div的class 为error是验证错误，ok是验证成功-->
              <div class="">
                  <label for="ptypeid"></label>
                  <input type="hidden" name="ptypeid" id="ptypeid" value="${sptype.ptypeid }" readonly="readonly">
              </div>

              <div class="">
                  <label for="ptypename">请输入修改的商品类别名称：</label>
                  <input type="text" name="ptypename" id="ptypename" value="${sptype.ptypename }">
                  <font color="red"></font>
              </div>


              <div class="providerAddBtn">
                  <input type="button" name="save" id="save" value="保存">
				  <input type="button" id="back" name="back" value="返回" >
              </div>
          </form>
      </div>
  </div>
</section>
<%@include file="/WEB-INF/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js2/providermodify.js"></script>