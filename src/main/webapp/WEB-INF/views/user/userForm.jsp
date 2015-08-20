<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:url var="actionUrl" value="save"/>

<form:form id="userForm" name="userForm" commandName="user" method="post"
           action="${actionUrl}" class="pure-form pure-form-aligned">

    <fieldset>
        <legend></legend>

        <div class="pure-control-group">
            <label for="name">Name</label>
            <form:input path="name" name="name" placeholder="User Name" maxlength="25"/>
            <span style="color:red" id="name"></span>
        </div>

        <div class="pure-control-group">
            <label for="age">Age</label>
            <form:input path="age" name="age" placeholder="Age"/>
            <span style="color:red" id="age"></span>
        </div>

        <div class="pure-control-group">
            <label for="isAdmin">Admin</label>
            <form:input path="isAdmin" name="admin" placeholder="(true,false) or (1,0)"/>
            <span style="color:red" id="admin"></span>
        </div>

        <form:input path="id" type="hidden"/>

    </fieldset>
</form:form>