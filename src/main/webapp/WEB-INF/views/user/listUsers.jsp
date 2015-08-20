<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List Of Users</title>

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
        <%@ include file="userForm.jsp"%>
    </div>

    <h1>List Of Users</h1>

    <button class="pure-button pure-button-primary" onclick="addUser()">
        <i class="fa fa-plus"></i> Add User
    </button>
    <form:form name="searchForm" class="pure-form" action="searchUsers" onsubmit="return validateSearch()">
        <fieldset>
            <legend>Search by Name</legend>
            <input type="search" name="searchName" placeholder="Name">
            <button type="submit" class="pure-button pure-button-primary"><i class="fa fa-search"></i>Search</button>
            <span style="color:red" id="name"></span>
        </fieldset>
    </form:form>
    <br>
    <table class="pure-table pure-table-bordered pure-table-striped">
        <thead>
        <tr>
            <th width="4%">Id</th>
            <th width="12%">Name</th>
            <th width="12%">Age</th>
            <th width="12%">Admin</th>
            <th width="12%">Created Date</th>
            <th width="12%"></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${userList}" var="user" varStatus="loopCounter">
            <tr>
                <td><c:out value="${loopCounter.count}" /></td>
                <td><c:out value="${user.name}" /></td>
                <td><c:out value="${user.age}" /></td>
                <td><c:out value="${user.isAdmin}" /></td>
                <td><c:out value="${user.createdDate}" /></td>

                <td>
                    <nobr>
                        <button onclick="editUser(${user.id});"
                                class="pure-button pure-button-primary">
                            <i class="fa fa-pencil"></i> Edit
                        </button>

                        <a href="delete/${user.id}" class="pure-button pure-button-primary"
                           onclick="return confirm('Delete this User?');">
                            <i class="fa fa-times"></i>Delete
                        </a>
                    </nobr>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<ul style="margin-left: 2.5%" class="pure-paginator">
    <li><a class="pure-button prev" href="listUsers?page=0">&#171;</a></li>
    <c:forEach begin="0" end="${countAllPages}" var="p">
        <li><a class="pure-button prev" href="listUsers?page=${p}">${p+1}</a></li>
    </c:forEach>
    <li><a class="pure-button next" href="listUsers?page=${countAllPages}">&#187;</a></li>
</ul>



<script type="text/javascript"
        src='<c:url value="/resources/js/lib/jquery-1.10.2.js"/>'></script>
<script type="text/javascript"
        src='<c:url value="/resources/js/lib/jquery-ui-1.10.4.custom.js"/>'></script>
<script type="text/javascript"
        src='<c:url value="/resources/js/js-for-listUsers.js"/>'></script>
</body>
</html>