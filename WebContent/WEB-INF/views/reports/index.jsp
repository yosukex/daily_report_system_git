<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/app.jsp">
    <c:param name="content">
        <h2>日報　一覧</h2>
        <table id="report_list">
            <tr>
                <th>
                    氏名
                </th>
                <th>
                    日付
                </th>
                <th>
                    タイトル
                </th>
                <th>
                    操作
                </th>
            </tr>
            <c:forEach var="report" items="${reports}" varStatus="status">
                <tr class="row${status.count % 2}">
                    <td>
                        <c:out value="${report.employee.name}"></c:out>
                    </td>
                    <td>
                        <fmt:formatDate value='${report.report_date}' pattern='yyyy-MM-dd' />
                    </td>
                    <td>
                        <c:out value="${report.title}"></c:out>
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath}/reports/show?id=${report.id}">詳細を見る</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <div id="pagination">
            <%--ページ数表記 --%>
            （全 ${reports_count} 件）<br />
            <c:forEach var="i" begin="1" end="${((reports_count - 1) / 15) + 1}" step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/reports/index?page=${i}"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
        <p><a href="${pageContext.request.contextPath}/reports/new">新規日報の登録</a></p>
    </c:param>
</c:import>
