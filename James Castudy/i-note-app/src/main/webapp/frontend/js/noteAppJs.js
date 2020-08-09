function isValidForm() {
    var check = document.getElementById("titleCheck");
    var checkselect = document.getElementById("selectCustom").value.trim();
    var errorCheck1 = document.getElementById("errorCheck1");
    var errorCheck2 = document.getElementById("errorCheck2");
    var str = check.value.trim();
    if (str.length > 100) {
        str = "<p style='color: red'>Tiêu đề quá dài, yêu cầu nhập lại!!!</p>"
        errorCheck.innerHTML = str;
        return false;
    } else if (str == "") {
        str = "<p style='color: red'>Không có giá trị nhập vào!!!</p>";
        errorCheck1.innerHTML = str;
        return false;
    } else if (checkselect == "Thể Loại") {
        str = "<p style='color: red'>Yêu cầu nhập select!!!</p>";
        errorCheck1.innerHTML = "";
        errorCheck2.innerHTML = str;
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