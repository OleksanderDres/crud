<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Search Users</title>

    <link rel="stylesheet"
          href='<c:url value="/resources/css/pure-0.4.2.css"/>'>

    <link rel="stylesheet"
          href='<c:url value="/resources/css/font-awesome-4.0.3/css/font-awesome.css"/>'>

    <link rel="stylesheet"
          href='<c:url value="/resources/css/jquery-ui-1.10.4.custom.css"/>'>

    <style type="text/css">
        th {
            text-align: left
        }
    </style>


</head>

<body>
<div style="width: 95%; margin: 0 auto;">

    <div id="userDialog" style="display: none;">
        <%@ include file="userForm.jsp" %>
    </div>

    <h1>Search Users</h1>

    <form:form action="listUsers?page=0" class="pure-form">
        <fieldset>
            <button type="submit" class="pure-button pure-button-primary">All Users</button>
        </fieldset>
    </form:form>

    <br>
    <c:if test="${empty searchList}">
        <span><h3>Users with the same name is not found</h3></span>
    </c:if>
    <table class="pure-table pure-table-bordered pure-table-striped">
        <thead>
        <tr>
            <th width="5%">Id</th>
            <th width="19%">Name</th>
            <th width="19%">Age</th>
            <th width="19%">Admin</th>
            <th width="19%">Created Date</th>
            <th width="19%"></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${searchList}" var="user" varStatus="loopCounter">
            <tr>
                <td><c:out value="${loopCounter.count}"/></td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.age}"/></td>
                <td><c:out value="${user.isAdmin}"/></td>
                <td><c:out value="${user.createdDate}"/></td>

                <td>
                    <nobr>
                        <button class="pure-button pure-button-primary"
                                onclick="editUser(${user.id});">

                            <i class="fa fa-pencil"></i> Edit
                        </button>

                        <a class="pure-button pure-button-primary"
                           onclick="return confirm('Delete this user?');"
                           href="delete/${user.id}"> <i class="fa fa-times"></i>Delete
                        </a>

                    </nobr>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>

<script type="text/javascript"
        src='<c:url value="/resources/js/lib/jquery-1.10.2.js"/>'></script>
<script type="text/javascript"
        src='<c:url value="/resources/js/lib/jquery-ui-1.10.4.custom.js"/>'></script>
<script type="text/javascript"
        src='<c:url value="/resources/js/js-for-listUsers.js"/>'></script>
</body>
</html>