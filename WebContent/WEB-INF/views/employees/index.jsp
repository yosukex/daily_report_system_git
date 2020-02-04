<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <%--フラッシュメッセージ --%>
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <h2>従業員　一覧</h2>
            <table>
                <tbody>
                    <tr>
                        <th>社員番号</th>
                        <th>氏名</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach var="employee" items="${employees}">
                        <tr>
                            <td><c:out value="${employees.code}"></c:out></td>
                            <td><c:out value="${employees.name}"></c:out></td>
                            <td><a href="${pageContext.request.contextPath}/show?id=${employees.id}">詳細を表示</a></td>
                        </tr>
                    </c:forEach>
               </tbody>
            </table>
        </ul>
        <div id="pagination">
            <%--ページ数表記 --%>
            （全 ${employees_count} 件）<br />
            <c:forEach var="i" begin="1" end="${((employees_count - 1) / 15) + 1}" step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/index?page=${i}"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
    </c:param>
</c:import>