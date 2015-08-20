function addUser() {
    $('#userDialog').dialog("option", "title", 'Add User');
    $('#userDialog').dialog('open');
}

function editUser(id) {

    $.get("get/" + id, function (result) {

        $("#userDialog").html(result);

        $('#userDialog').dialog("option", "title", 'Edit User');

        $("#userDialog").dialog('open');

    });
}

function validateSearch() {
    var name = document.forms["searchForm"]["searchName"].value;
    if (name.length == 0) {
        document.getElementById("name").innerHTML = " Please enter a name for the search";
        return false;
    }
}

function validateForm() {
    var name = document.forms["userForm"]["name"].value;
    var age = document.forms["userForm"]["age"].value;
    var admin = document.forms["userForm"]["admin"].value;

    if (name.length==0){
        document.getElementById("name").innerHTML=" Enter name!";
        return false;
    }
    if (name.length>25){
        document.getElementById("name").innerHTML=" Max length 25 chars!";
        return false;
    }
    if (age.length == 0){
        document.getElementById("age").innerHTML=" Enter age!";
        return false;
    }
    if ( (age == 0) || (age < 0) ){
        document.getElementById("age").innerHTML=" Age can not be 0 or less!";
        return false;
    }
    if ( (admin != 0) || (admin != 1) || (admin != false) || (admin != true)){
        document.getElementById("admin").innerHTML=" Choice true or false!";
        return false;
    }
}

function resetDialog(form) {

    form.find("input").val("");
}

$(document).ready(function () {

    $('#userDialog').dialog({

        autoOpen: false,
        position: 'center',
        modal: true,
        resizable: false,
        width: 440,
        buttons: {
            "Save": function () {
                $('#userForm').submit();
            },
            "Cancel": function () {
                $(this).dialog('close');
            }
        },
        close: function () {

            resetDialog($('#userForm'));

            $(this).dialog('close');
        }
    });
});
