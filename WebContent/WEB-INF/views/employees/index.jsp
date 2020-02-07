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
            <table id="employee_list">
                <tbody>
                    <tr>
                        <th>社員番号</th>
                        <th>氏名</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach var="employee" items="${employees}" varStatus="status">
                        <tr class="row${status.count % 2}">
                            <td><c:out value="${employee.code}"></c:out></td>
                            <td><c:out value="${employee.name}"></c:out></td>
                            <td>
                                <c:choose>
                                    <c:when test="${employee.delete_flag == 0}">
                                        <a href="${pageContext.request.contextPath}/show?id=${employee.id}">詳細を表示</a>
                                    </c:when>
                                    <c:otherwise>
                                        (削除済み)
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
               </tbody>
            </table>
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
        <p><a href="${pageContext.request.contextPath}/employees/new">新規従業員の登録</a></p>
    </c:param>
</c:import>