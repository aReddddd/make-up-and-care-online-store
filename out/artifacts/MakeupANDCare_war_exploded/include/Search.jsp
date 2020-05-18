<%--
  Created by IntelliJ IDEA.
  User: lzrdj
  Date: 2019/12/20
  Time: 4:51
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>

<div>
    <a href="${contextPath}">
        <img style="margin-left:30px" class="logo" src="img/site/logo3.png"
             id="logo">
    </a>
    <form action="foresearch" method="post">
        <div class="searchDiv" style="background-color: rgba(255, 153, 155, 1); width: 490px;height: 42px;">
            <input type="text" placeholder="Lipstick" value="${param.keyword}" name="keyword">
            <button class="searchButton" type="submit" style="position:relative;top:2px;">Search</button>
            <div class="searchBelow">
                <c:forEach items="${cs}" var="c" varStatus="st">
                    <c:if test="${st.count>0 and st.count<4}">
					<span>
						<a href="forecategory?cid=${c.id}">
                                ${c.name}
                        </a>
						<c:if test="${st.count!=3}">
                            <span>|</span>
                        </c:if>
					</span>
                    </c:if>
                </c:forEach>
            </div>
        </div>
    </form>
</div>