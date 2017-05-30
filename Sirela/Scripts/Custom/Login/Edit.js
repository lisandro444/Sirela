$(function () {

    var initDialog = function (type) {
        var title = type;
        $("#divEdit").dialog({
            autoOpen: false,
            modal: true,
            title: type + ' User',
            width: 360,
            buttons: {
                Save: function () {
                    var id = $("#hidID").val();
                    var role = $("#ddlRoles").val();
                    var loginName = $("#txtLoginName").val();
                    var loginPass = $("#txtPassword").val();
                    var cName = $("#txtCompanyName").val();
                    var cuit = $("#txtCuit").val();
                    var rubro = $("#ddlRubro").val();
                    var fName = $("#txtFirstName").val();
                    var lName = $("#txtLastName").val();
                    var gender = $("#ddlGender").val();

                    UpdateUser(id, loginName, loginPass, cName, cuit, rubro, fName, lName, gender, role);
                    $(this).dialog("destroy");
                },
                Cancel: function () { $(this).dialog("destroy"); }
            }
        });
    }

    function UpdateUser(id, logName, logPass, cName, cuit, rubro, fName, lName, gender, role) {
        $.ajax({
            type: "POST",
            url: "/Home/UpdateUserData/",
            data: { userID: id, loginName: logName, password: logPass, companyName: cName, cuit: cuit, rubro: rubro, firstName: fName, lastName: lName, gender: gender, roleID: role },
            success: function (data) {
                $("#divUserListContainer").load("/Home/ManageUserPartial/", { "status": "update" });
            },
            error: function (error) {
                //to do:    
            }
        });
    }

    $("a.lnkEdit").on("click", function () {     
        initDialog("Edit");
        $(".alert-success").empty();
        var row = $(this).closest('tr');
        $("#hidID").val(row.find("td:eq(0)").html().trim());
        $("#txtLoginName").val(row.find("td:eq(1)").html().trim())
        $("#txtPassword").val(row.find("td:eq(2)").html().trim())
        $("#txtCompanyName").val(row.find("td:eq(3)").html().trim())
        $("#txtCuit").val(row.find("td:eq(4)").html().trim())
        $("#ddlRubro").val(row.find("td:eq(5)").html().trim())
        $("#txtFirstName").val(row.find("td:eq(6)").html().trim())
        $("#txtLastName").val(row.find("td:eq(7)").html().trim())
        $("#ddlGender").val(row.find("td:eq(8)").html().trim())
        $("#ddlRoles").val(row.find("td:eq(9) > input").val());
        $("#divEdit").dialog("open");
        return false;
    });
});

