function isValidForm() {
    var check = document.getElementById("titleCheck");
    var checkselect = document.getElementById("selectCustom").value.trim();
    var errorCheck = document.getElementById("errorCheck");
    var str = check.value.trim();
    if (str.length > 100) {
        str = "<p style='color: red'>Tiêu đề quá dài, yêu cầu nhập lại!!!</p>"
        errorCheck.innerHTML = str;
        return false;
    } else if (str == ""||checkselect == ""||checkselect == "Thể Loại") {
        str = "<p style='color: red'>Không có giá trị nhập vào!!!</p>";
        if (checkselect == "Thể Loại") {
            str = "<p style='color: red'>Yêu cầu nhập select!!!</p>";
        }
        errorCheck.innerHTML = str;
        return false;
    }
    else
    {
        return true;
    }
}

function resetError() {
    var errorCheck = document.getElementById("errorCheck");
    errorCheck.innerHTML = "";
}

function sendRequest() {
    var requestForm = document.getElementById("myform");
    var selectCustom = document.getElementById("selectCustom");
    var selectValue = document.getElementById("selectValue");
    selectValue.value = selectCustom.value;
    requestForm.setAttribute("method", "GET")
    requestForm.submit();
}