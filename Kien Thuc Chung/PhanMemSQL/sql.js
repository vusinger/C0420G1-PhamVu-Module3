var count = 0;

function checkSelect() {
    let select = document.getElementById("select1");
    let result = document.getElementById("result");
    if (select.value === "1") {
        let databaseName = document.getElementById("databaseName").value;
        let str = '<span style="color:blue">Create database if not exists </span>' + databaseName + ';<br>';
        str += '<span style="color:blue">Drop database if exists </span>' + databaseName + ';<br>';
        result.innerHTML = str;
    } else if (select.value === "2") {
        let tableName = document.getElementById("tableName").value;
        let str = "<span style='color:blue'>create table</span> ";
        str += tableName.replace(/ /g, '');
        str += "(<br>";
        let input1, input2;
        for (let i = 0; i < count; i++) {
            input1 = "attribute" + i;
            input2 = "datatype" + i;
            let attribute = document.getElementById(input1).value;
            let datatype = document.getElementById(input2).value;
            str += attribute +" "+ datatype + ",<br>"
        }
        input = "attribute" + 0;
        let attribute = document.getElementById(input).value;
        str += "<span style='color:blue'>primary key</span>(" + attribute + ")<br>";
        str += ");";
        result.innerHTML = str;
    } else if (select.value === "3") {
        let tableName1 = document.getElementById("tableName1").value;
        let tableName2 = document.getElementById("tableName2").value;
        let attribute = document.getElementById("attribute").value;
        let arr = attribute.split(" ");
        let str = "<span style='color:blue'>alter table </span>";
        str += tableName1 + "<br>";
        str += "<span style='color:blue'>add column</span> " + attribute + ",<br>";
        attribute = arr[0];
        str += "<span style='color:blue'>add constraint </span>" + attribute + "<br>";
        str += "<span style='color:blue'>foreign key</span> (" + attribute + ") <span style='color:blue'>references </span>";
        str += tableName2 + "(" + attribute + ");";
        result.innerHTML = str;
    } else if (select.value === "4") {
        let tableName1 = document.getElementById("tableName1").value;
        let tableName2 = document.getElementById("tableName2").value;
        let attribute1 = document.getElementById("attribute1").value;
        let attribute2 = document.getElementById("attribute2").value;
        let arr1 = attribute1.split(" ");
        let arr2 = attribute2.split(" ");
        let str = "<span style='color:blue'>create table </span>";
        str += tableName1 + tableName2 + "(<br>";
        str += attribute1 + ",<br>";
        str += attribute2 + ",<br>";
        attribute1 = arr1[0];
        attribute2 = arr2[0];
        str += "<span style='color:blue'>Primary key</span>(" + attribute1 + "," + attribute2 + "),<br>";
        str += "<span style='color:blue'>foreign key </span>(" + attribute1 + ") <span style='color:blue'>references</span> "
            + tableName1 + "(" + attribute1 + "),<br>";
        str += "<span style='color:blue'>foreign key </span>(" + attribute2 + ") <span style='color:blue'>references </span>"
            + tableName2 + "(" + attribute2 + ")<br>);";
        result.innerHTML = str;
    } else if (select.value === "5") {
        let tableName = document.getElementById("tableName").value;
        let attribute = document.getElementById("attribute").value;
        let str = "<span style='color:blue'>insert into</span> " + tableName + "(";
        str += attribute + ")<br>";
        str += "<span style='color:blue'>values</span> ";
        let input;
        for (let i = 0; i < count; i++) {
            input = "attribute" + i;
            let attribute = document.getElementById(input).value;
            if (i !== count - 1) str += "(" + attribute + "),<br>";
            else str += "(" + attribute + ");<br>";
        }
        result.innerHTML = str;
    }
}

function checkSelectEvent() {
    let select = document.getElementById("select1");
    let result = document.getElementById("newElement");
    let result1 = document.getElementById("result");
    result1.innerHTML = "";
    if (select.value === "1") {
        result.innerHTML = "<input type='text' id='databaseName' value='DatabaseName'></input>";
    } else if (select.value === "2") {
        let str = "<input type='text' id='tableName' value='TableName' ></input>";
        str += "<input type='button' onclick='addAttribute()' value='Add Attribute'></input>";
        result.innerHTML = str;
    } else if (select.value === "3") {
        let str = "<input type='text' id='tableName1' value='table1' ></input>";
        str += "<input type='text' id='tableName2' value='table2' ></input>";
        str += "<input type='text' id='attribute' value='column_id  Datatype' ></input>";
        result.innerHTML = str;
    } else if (select.value === "4") {
        let str = "<input type='text' id='tableName1' value='table1' ></input>";
        str += "<input type='text' id='tableName2' value='table2' ></input>";
        str += "<input type='text' id='attribute1' value='column_id1  Datatype' ></input>";
        str += "<input type='text' id='attribute2' value='column_id2  Datatype' ></input>";
        result.innerHTML = str;
    } else if (select.value === "5") {
        let str = "<input type='text' id='tableName' value='tableName' ></input>";
        str += "<input type='text' id='attribute' value='attribute,attribute' ></input>";
        str += "<input type='button' onclick='addAttribute1()' value='Add Attribute'></input>";
        result.innerHTML = str;
    } else if (select.value === "6") {
        let str = " <h2><span style='color:blue'>create view</span> `profile`<br>" +
            "<span style='color:blue'>as</span><br>" +
            "<span style='color:blue'>select</span> dk.id,dk.ten,tuoi,date_of_birth<br>" +
            "<span style='color:blue'>from</span> dkynhaphoc dk<br>" +
            "<span style='color:blue'>join</span> student<br>" +
            "<span style='color:blue'>on</span> dk.student_id1 = student.id;<br></h2>";
        result.innerHTML = str;
    } else if (select.value === "7") {
        let str = " <h2><span style='color:blue'>DELETE FROM</span> table_name<br>" +
            "<span style='color:blue'>WHERE </span>" +
            "some_column=some_value<br></h2>";
        result.innerHTML = str;
    } else if (select.value === "8") {
        let str = " <h2><span style='color:blue'>DROP INDEX</span> index_name (MySQL)<br></h2>";
        result.innerHTML = str;
    } else if (select.value === "9") {
        let str = " <h2><span style='color:blue'>SELECT </span> column_name(s)<br>";
        str += " <span style='color:blue'>FROM  </span>  table_name1<br>";
        str += " <span style='color:blue'>INNER JOIN  </span>  table_name2<br>";
        str += " <span style='color:blue'>ON </span>  table_name1.column_name=table_name2.column_name<br></h2>";
        result.innerHTML = str;
    } else if (select.value === "10") {
        let str = " <h2><span style='color:blue'>CHAR(size) </span> characters - can be from 0 to 255.<br>";
        str += " <span style='color:blue'>VARCHAR(size)  </span>  - can be from 0 to 65535<br>";
        str += " <span style='color:blue'>BINARY(size)  </span>  Equal to CHAR(), but stores binary byte strings.<br>";
        str += " <span style='color:blue'>VARBINARY(size) </span>  Equal to VARCHAR(), but stores binary byte strings. <br>";
        str += " <span style='color:blue'>DATETIME(fsp) </span> Format: YYYY-MM-DD hh:mm:ss. <br></h2>";
        result.innerHTML = str;
    } else if (select.value === "11") {
        let str = " <h2><span style='color:blue'>SELECT  </span> column1, column2, ...<br>";
        str += " <span style='color:blue'>FROM </span>table_name<br>";
        str += " <span style='color:blue'>ORDER BY </span>  column1, column2, ... ";
        str += " <span style='color:blue'>ASC|DESC </span><br></h2>";
        result.innerHTML = str;
    } else if (select.value === "12") {
        let str = " <h2><span style='color:blue'>ALTER TABLE </span> Persons<br>";
        str += " <span style='color:blue'>ALTER </span>City ";
        str += " <span style='color:blue'>SET DEFAULT </span> 'Sandnes';";
        str += " <br><br>";
        str += " <span style='color:blue'>ALTER TABLE </span>Persons <br>";
        str += " <span style='color:blue'>ALTER TABLE </span>City <br>";
        str += " <span style='color:blue'>DROP DEFAULT </span>;</h2>";
        result.innerHTML = str;
    } else if (select.value === "13") {
        let str = " <h2><span style='color:blue'>CREATE TABLE </span> Persons (<br>";
        str += " Age int, ";
        str += " <span style='color:blue'>CHECK </span> (Age>=18)<br>";
        str += " );";
        str += " <br><br>";
        str += " <span style='color:blue'>CREATE TABLE </span>Persons (<br>";
        str += " Age int, <br>";
        str += " City varchar(255), <br>";
        str += " <span style='color:blue'>CONSTRAINT </span>CHK_Person";
        str += " <span style='color:blue'>CHECK  </span>(Age>=18 AND City='Sandnes'<br>);</h2>";
        result.innerHTML = str;
    } else if (select.value === "14") {
        let str = " <h2>delimiter //<br>";
        str += "<span style='color:blue'>create procedure </span> procedureName (varible varchar(50))<br>";
        str += " <span style='color:blue'>begin</span><br>";
        str += " <span style='color:blue'>select </span>*<br>";
        str += " <span style='color:blue'>from  </span>tableName<br>";
        str += " <span style='color:blue'>where  </span>tableName.columnName = varible;<br>";
        str += " <span style='color:blue'>end; </span> // <br>";
        str += " delimiter ;<br>";
        str += " call procedureName('Viet');<br><br>";
        str += " delimiter //<br>";
        str += "<span style='color:blue'>create procedure </span> procedureName (";
        str += " <span style='color:blue'>in </span>varible1 varchar(50),<br>";
        str += " <span style='color:blue'>out </span>varible2 int)<br>";
        str += " <span style='color:blue'>begin </span><br>";
        str += " <span style='color:blue'>set   </span>result = (<br>";
        str += " <span style='color:blue'>select count(*)</span><br>";
        str += " <span style='color:blue'>from </span> tableName<br>";
        str += " <span style='color:blue'>where</span> columnName " +
            returnBlue('like') + " concat('%', v_name, '%')<br>);<br>";
        str += returnBlue('end') + ";" + " // <br>";
        str += " delimiter ;<br>";
        str += " drop procedure procedureName;<br>";
        str += " call procedureName ('o', @abc);<br>";
        str += " select @abc;<br>";
        result.innerHTML = str;
    } else if (select.value === "15") {
        let str = "<h2>-- trigger<br>" +
            "delimiter //<br>" +
            returnBlue("create trigger") + " save_account_james<br>" +
            returnBlue("after insert") +"<br>" +
            "-- before insert, after update, before, update, after delete, before delete<br>" +
            returnBlue("on ")+ "student"+returnBlue(" for each row")+" <br>" +
            returnBlue("begin")+"<br>" +
            returnBlue("insert into")+" account_james<br>" +
            returnBlue("values")+" (concat(lcase(new.name), '.codegym'), '12345678');<br>" +
            returnBlue("end")+"; //<br>" +
            "delimiter ;</h2>";
        result.innerHTML = str;
    } else if (select.value === "16") {
        let str = "delimiter //<br>" +
            "create function sum2num (num1 int, num2 int)<br>" +
            "returns int<br>" +
            "deterministic<br>" +
            "begin<br>" +
            "declare total int;<br>" +
            "    set total = num1 + num2;<br>" +
            "return total;<br>" +
            "​<br>" +
            "end; //<br>" +
            "delimiter ;<br>" +
            "​<br>" +
            "select sum2num(3, 4);<br>" +
            "​<br>" +
            "-- transaction<br>" +
            "insert into type_of_class (id, name)<br>" +
            "values (3, 'Night time');<br>" +
            "​<br>" +
            "delimiter //<br>" +
            "create procedure save_class()<br>" +
            "begin<br>" +
            "start transaction;<br>" +
            "    <br>" +
            "insert into class (id, name, type_of_class_id)<br>" +
            "values (4, 'I0720G1', null);<br>" +
            "    <br>" +
            "    if not exists (select 1 from type_of_class where id = 3)then<br>" +
            "rollback;<br>" +
            "    end if;<br>" +
            "    <br>" +
            "end; //<br>" +
            "delimiter ";
        str = printBlue(str);
        result.innerHTML = str;
    }
    count = 0;
}

function printBlue(str) {
    str = str.replace(/create/gi,returnBlue("create"));
    str = str.replace(/function/gi,returnBlue("function"));
    str = str.replace(/returns/gi,returnBlue("returns"));
    str = str.replace(/return(?!s)/gi,returnBlue("return"));
    str = str.replace(/into/gi,returnBlue("into"));
    str = str.replace(/int(?!o)/gi,returnBlue("int"));
    str = str.replace(/deterministic/gi,returnBlue("deterministic"));
    str = str.replace(/begin/gi,returnBlue("begin"));
    str = str.replace(/declare/gi,returnBlue("declare"));
    str = str.replace(/set/gi,returnBlue("set"));
    str = str.replace(/insert/gi,returnBlue("insert"));
    str = str.replace(/procedure/gi,returnBlue("procedure"));
    str = str.replace(/select/gi,returnBlue("select"));
    str = str.replace(/values/gi,returnBlue("values"));
    str = str.replace(/if/gi,returnBlue("if"));
    str = str.replace(/not/gi,returnBlue("not"));
    str = str.replace(/exists/gi,returnBlue("exists"));
    str = str.replace(/where/gi,returnBlue("where"));
    str = str.replace(/then/gi,returnBlue("then"));
    str = str.replace(/rollback/gi,returnBlue("rollback"));
    str = str.replace(/end/gi,returnBlue("end"));
    str = str.replace(/transaction/gi,returnBlue("transaction"));
    str = str.replace(/start/gi,returnBlue("start"));
    return str;
}

function addAttribute() {
    let result = document.getElementById("newElement");
    let str = result.innerHTML;
    str += "<br><input type='text' id='attribute" + count + "' value='Attribute'></input>";
    str += "<select id=\"datatype" + count + "\">" +
        "        <option value=\"CHAR(50)\">CHAR(50)</option>\n" +
        "        <option value=\"VARCHAR(50)\">VARCHAR(50)</option>\n" +
        "        <option value=\"BINARY(50)\">BINARY(50)</option>\n" +
        "        <option value=\"VARBINARY(50)\">VARBINARY(50)</option>\n" +
        "        <option value=\"INT\">INT</option>\n" +
        "        <option value=\"TINYTEXT\">TINYTEXT</option>\n" +
        "        <option value=\"TEXT(size)\">TEXT(size)</option>\n" +
        "        <option value=\"BLOB(size)\">BLOB(size)</option>\n" +
        "        <option value=\"MEDIUMTEXT\">MEDIUMTEXT</option>\n" +
        "        <option value=\"MEDIUMBLOB\">MEDIUMBLOB</option>\n" +
        "        <option value=\"LONGTEXT\">LONGTEXT</option>\n" +
        "        <option value=\"LONGBLOB\">LONGBLOB</option>\n" +
        "        <option value=\"BIT(2)\">BIT(2)</option>\n" +
        "        <option value=\"INTEGER(50)\">INTEGER(50) </option>\n" +
        "        <option value=\"DOUBLE(50, 2)\">DOUBLE(50, 2)</option>\n" +
        "        <option value=\"DATE\">DATE</option>\n" +
        "        <option value=\"TIMESTAMP(fsp)\">TIMESTAMP(fsp)</option>" +
        "    </select>";
    count++;
    result.innerHTML = str;
}

function addAttribute1() {
    let result = document.getElementById("newElement");
    let str = result.innerHTML;
    str += "<br><input style='width: 500px' type='text' id='attribute" + count + "' value=\"1,'PhamVu','className','2000-06-15'\"></input>";
    count++;
    result.innerHTML = str;
}


function returnBlue(str) {
    return "<span style='color:blue'>" + str + "</span>";
}