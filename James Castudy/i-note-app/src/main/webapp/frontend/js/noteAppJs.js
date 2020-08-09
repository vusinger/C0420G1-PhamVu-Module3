function isValidForm() {
    var check = document.getElementById("titleCheck");
    var errorCheck = document.getElementById("errorCheck");
    var str = check.value;
    if (str.length > 100) {
        str = "<p style='color: red'>Tiêu đề quá dài, yêu cầu nhập lại!!!</p>"
        errorCheck.innerHTML = str;
        return false;
    } else {
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