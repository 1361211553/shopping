<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/3/16
  Time: 17:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="admin-menu">
    <div class="content">
        <div class="nav-scroll-wrap">
            <div class="scroll-content">
                <div class="nav-section" style="padding-bottom:0">
                    <h3 class="header">&nbsp;个人中心</h3>
                    <ul class="icon-filter">
                        <li>
                            <a menu="home" href="person.jsp"  >
                                <span class="icon icon-home"></span>
                                <span class="title">
                                    我的信息
                                </span>
                            </a>
                        </li>
                        <li>
                            <a menu="userlevel" href="/order/search">
                                <span class="icon icon-userlevel"></span>
                                <span class="title">
                                    订单管理
                                </span>
                            </a>
                        </li>
                        <li>
                            <a menu="subscribe" href="/address/search" class="selected">

                                <span class="icon icon-subscribe"></span>
                                <span class="title">
                                    我的地址
                                </span>
                            </a>
                        </li>
                        <li id="msg-li">
                            <a menu="msg" >
                                <span class="icon icon-msg"></span>
                                <span class="title">
                                    暂未开放
                                </span>
                            </a>
                        </li>
                        <li>
                            <a menu="noble" >
                                <span class="icon icon-noble"></span>
                                <span class="title">
                                    暂未开放
                                </span>
                            </a>
                        </li>
                        <li>
                            <a menu="myRoom" >
                                <span class="icon icon-room"></span>
                                <span class="title">
                                    暂未开放
                                </span>
                            </a>
                        </li>
                        <li>
                            <a menu="money" >
                                <span class="icon icon-money"></span>
                                <span class="title">
                                    暂未开放
                                </span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

    </div>
</div>
<!-- column-->

$()
