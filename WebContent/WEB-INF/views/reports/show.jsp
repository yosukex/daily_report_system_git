<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${report != null}">
                <h2>日報　詳細ページ</h2>
                <table>
                    <tr>
                        <th>
                            氏名
                        </th>
                        <td>
                            <c:out value="${report.employee.name}"/>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            日付
                        </th>
                        <td>
                              <fmt:formatDate value="${report.report_date}" pattern="yyyy-MM-dd" />
                           </td>
                    </tr>
                    <tr>
                        <th>
                            内容
                        </th>
                        <td>
                            <c:out value="${report.content}"/>
                        </td>
                    </tr>
                    <tr>
                        <th>
                        登録日時
                        </th>
                        <td>
                            <fmt:formatDate value="${report.created_at}" pattern="yyyy-MM-dd HH:mm:ss" />
                        </td>
                    </tr>
                    <tr>
                        <th>
                               更新日時
                        </th>
                        <td>
                        <fmt:formatDate value="${report.created_at}" pattern="yyyy-MM-dd HH:mm:ss" />
                        </td>
                    </tr>
                </table>
                <c:if test="${report.employee.id==sessionScope.login_employee.id}">
                    <p><a href="${pageContext.request.contextPath}/reports/edit?id=${employee.id}">この日報を編集する</a></p>
                </c:if>
                <p><a href="${pageContext.request.contextPath}/reports/index">一覧に戻る</a></p>
            </c:when>
            <c:otherwise>
                <h2>お探しのデータは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>
    </c:param>
</c:import>