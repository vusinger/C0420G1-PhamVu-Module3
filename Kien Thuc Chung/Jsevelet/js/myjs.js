function checkSelect() {
    let select = document.getElementById("select1");
    let result = document.getElementById("result");
    if (select.value === "1") {
    } else if (select.value === "2") {
    } else if (select.value === "3") {
    } else if (select.value === "4") {
    } else if (select.value === "5") {
    }
}

function checkSelectEvent() {
    let select = document.getElementById("select_ktc");
    let result = document.getElementById("newElement");
    let result1 = document.getElementById("newElement1");
    if (select.value === "1") {
        let str = "------------------------------------------------Java JSP------------------------------------------------\n";
        str += "<%@ page contentType=\"text/html;charset=UTF-8\" language=\"java\" %>\n" +
            "<html>\n" +
            "  <head>\n" +
            "    <title>Hello</title>\n" +
            "  </head>\n" +
            "  <body>\n" +
            "    <form action=\"/sumServletPath\" method=\"get\">\n" +
            "      <input type=\"text\" name=\"num1\" />\n" +
            "      <input type=\"text\" name=\"num2\" />\n" +
            "      <input type=\"submit\" value=\"Sum 2 num\" />\n" +
            "    </form>\n" +
            "  </body>\n" +
            "</html>\n";
        str += "------------------------------------------------Java Result------------------------------------------------\n";
        str += "<%@ page contentType=\"text/html;charset=UTF-8\" language=\"java\" %>\n" +
            "<html>\n" +
            "<head>\n" +
            "    <title>Final</title>\n" +
            "</head>\n" +
            "<body>\n" +
            "    <p style=\"color: violet\"><%=request.getAttribute(\"resultServlet\")%></p>\n" +
            "</body>\n" +
            "</html>\n";
        str += "------------------------------------------------Java Servlet------------------------------------------------\n";
        str += "@WebServlet(name = \"SumServlet\", urlPatterns = \"/sumServletPath\")\n" +
            "public class SumServlet extends HttpServlet {\n" +
            "    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {\n" +
            "//        String a = request.getParameter(\"num1\");\n" +
            "//        String b = request.getParameter(\"num2\");\n" +
            "//        double result = Double.parseDouble(a) + Double.parseDouble(b);\n" +
            "//\n" +
            "//        PrintWriter out = response.getWriter();\n" +
            "//        out.write(\"<html><body>\");\n" +
            "//        out.write(\"<p style='color: green'>\" + result + \"</p>\");\n" +
            "//        out.write(\"</body></html>\");\n" +
            "    }\n" +
            "\n" +
            "    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {\n" +
            "        String a = request.getParameter(\"num1\");\n" +
            "        String b = request.getParameter(\"num2\");\n" +
            "        double result = Double.parseDouble(a) + Double.parseDouble(b);\n" +
            "\n" +
            "//        PrintWriter out = response.getWriter();\n" +
            "//        out.write(\"<html><body>\");\n" +
            "//        out.write(\"<p style='color: red'>\" + result + \"</p>\");\n" +
            "//        out.write(\"</body></html>\");\n" +
            "        request.setAttribute(\"resultServlet\", result);\n" +
            "//        request.getRequestDispatcher(\"final.jsp\").forward(request, response);\n" +
            "        response.sendRedirect(\"final.jsp\");\n" +
            "    }\n" +
            "}\n";
        result.innerText = str;
    } else if (select.value === "2") {
        let str = "------------------------------------------------Java XML Config------------------------------------------------\n";
        str += "<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\n" +
            "\n" +
            "<!DOCTYPE web-app\n" +
            "    PUBLIC \"-//Sun Microsystems, Inc.//DTD Web Application 2.3//EN\"\n" +
            "    \"http://java.sun.com/dtd/web-app_2_3.dtd\">\n" +
            "\n" +
            "<web-app>\n" +
            "\n" +
            "  <servlet>\n" +
            "    <servlet-name>controlServlet</servlet-name>\n" +
            "    <servlet-class>com.jenkov.butterfly.ControlServlet</servlet-class>\n" +
            "  </servlet>\n" +
            "\n" +
            "  <servlet-mapping>\n" +
            "    <servlet-name>controlServlet</servlet-name>\n" +
            "    <url-pattern>*.html</url-pattern>\n" +
            "  </servlet-mapping>\n" +
            "</web-app> \n";
        str += "------------------------------------------------Servlet Init Parameters------------------------------------------------\n";
        str += "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n" +
            "<web-app xmlns=\"http://java.sun.com/xml/ns/javaee\"\n" +
            "    xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n" +
            "    xsi:schemaLocation=\"http://java.sun.com/xml/ns/javaee\n" +
            "                        http://java.sun.com/xml/ns/javaee/web-app_3_0.xsd\"\n" +
            "    version=\"3.0\">\n" +
            "\n" +
            "    <display-name>Servlet testing app</display-name>\n" +
            "\n" +
            "    <!-- This is a context init parameter -->\n" +
            "    <context-param>\n" +
            "        <param-name>email</param-name>\n" +
            "        <param-value>admin@example.com</param-value>\n" +
            "    </context-param>\n" +
            "\n" +
            "    <servlet>\n" +
            "        <servlet-name>Info Servlet</servlet-name>\n" +
            "        <servlet-class>com.example.InfoServlet</servlet-class>\n" +
            "        <!-- This is a servlet init parameter -->\n" +
            "        <init-param>\n" +
            "            <param-name>name</param-name>\n" +
            "            <param-value>John Doe</param-value>\n" +
            "        </init-param>\n" +
            "    </servlet>\n" +
            "    <servlet-mapping>\n" +
            "        <servlet-name>Info Servlet</servlet-name>\n" +
            "        <url-pattern>/test/ShowInfo.do</url-pattern>\n" +
            "    </servlet-mapping>\n" +
            "\n" +
            "</web-app>";
        result.innerText = str;
    } else if (select.value === "3") {
        let str = "------------------------------------------------Java XML Config------------------------------------------------\n";
        str += "<servlet>\n" +
            "        <servlet-name>LServlet</servlet-name>\n" +
            "        <servlet-class>LearningServlet</servlet-class>\n" +
            "    </servlet>\n" +
            "\n" +
            "    <servlet-mapping>\n" +
            "        <servlet-name>LServlet</servlet-name>\n" +
            "        <url-pattern>/helloWorld</url-pattern>\n" +
            "    </servlet-mapping>\n" +
            "\n" +
            "    <servlet>\n" +
            "        <servlet-name>HServlet</servlet-name>\n" +
            "        <servlet-class>HelloServlet</servlet-class>\n" +
            "    </servlet>\n" +
            "\n" +
            "    <servlet-mapping>\n" +
            "        <servlet-name>HServlet</servlet-name>\n" +
            "        <url-pattern>/helloServlet</url-pattern>\n" +
            "    </servlet-mapping>\n";
        str += "------------------------------------------------LearningServlet------------------------------------------------\n";
        str += " PrintWriter out = response.getWriter();\n" +
            "        String str = \"<html>\";\n" +
            "               str += \"<body>\";\n" +
            "               str += \"<h1>\";\n" +
            "               str += \"Xin Chao Ban.Toi La Vu\";\n" +
            "               str += \"</h1>\";\n" +
            "               str += \"</body>\";\n" +
            "               str += \"</html>\";\n" +
            "        out.println(str);\n" +
            "//        RequestDispatcher requestDispatcher = request.getRequestDispatcher(\"helloServlet\");\n" +
            "//        requestDispatcher.forward(request,response);\n" +
            "        RequestDispatcher requestDispatcher1 = request.getRequestDispatcher(\"FolderName/final.html\");\n" +
            "        requestDispatcher1.forward(request,response);\n";
        str += "------------------------------------------------HelloServlet------------------------------------------------\n";
        str += "PrintWriter out = response.getWriter();\n" +
            "        out.println(\"My name is HelloServlet\");\n";
        str += "------------------------------------------------index.jsp------------------------------------------------\n";
        str += "<form action=\"/helloWorld\" method=\"post\">\n" +
            "    <input type=\"submit\">\n" +
            "  </form>\n";
        result.innerText = str;
    } else if (select.value === "4") {
        let str = "------------------------------------------------Khai báo Import:------------------------------------------------\n";
        str += "<!-- Khai báo import -->\n" +
            "<%@ page import=\"java.util.*, java.text.*\"  %>  \n" +
            " \n" +
            "<%@ page import=\"java.util.List, java.text.*\" %> \n";
        str += "------------------------------------------------Một số biến có sẵn trong JSP mà bạn sẵn sàng để sử dụng:------------------------------------------------\n";
        str += "request : javax.servlet.http.HttpServletRequest\n" +
            "response: javax.servlet.http.HttpServletResponse\n" +
            "out: javax.servlet.jsp.JspWriter\n";
        str += "Example: \n<%\n" +
            "// Ví dụ sử dụng biến out.\n" +
            "out.println(\"<h1>Now is \"+ new Date()+\"</h1>\");\n" +
            " \n" +
            "// Ví dụ sử dụng biến request\n" +
            "String serverName= request.getServerName();\n" +
            " \n" +
            " \n" +
            "// Ví dụ sử dụng biến response\n" +
            "response.sendRedirect(\"http://eclipse.org\");\n" +
            " \n" +
            "%>\n";
        str += "------------------------------------------------Mã Java bên trong HTML (Jsp)------------------------------------------------\n";
        str += "<%\n" +
            "        String str = (String) request.getAttribute(\"newAttribute\");\n" +
            "        str += \"<h1> Ok Im Fine</h1>\";\n" +
            "//        StringWriter stringWriter = new StringWriter();\n" +
            "//        PrintWriter printWriter = new PrintWriter(stringWriter);\n" +
            "//        out.print(str);\n" +
            "//        printWriter.close();\n" +
            "//        stringWriter.close();\n" +
            "        out.print(str);\n" +
            "        Random random = new Random();\n" +
            "        int randomInt = random.nextInt(3);\n" +
            "        if (randomInt==0) {\n" +
            "            out.print(\"<h1>Gia tri la 0</h1>\");\n" +
            "        } else if (randomInt==1) {\n" +
            "            out.print(\"<h1>Gia tri la 1</h1>\");\n" +
            "        } else if (randomInt==2) {\n" +
            "            out.print(\"<h1>Gia tri la 2</h1>\");\n" +
            "        }\n" +
            "    %>\n";
        str += "------------------------------------------------Định nghĩa phương thức trong JSP sử dụng <%! %>------------------------------------------------\n";
        str += "<%!\n" +
            " \n" +
            "public int sum(int a, int b)  {\n" +
            " return a + b;\n" +
            "}\n" +
            " \n" +
            "public void exampleMethod()  {\n" +
            "  // Code here\n" +
            "}\n" +
            "%>\n";
        str += "------------------------------------------------methodInJsp.jsp------------------------------------------------\n";
        str += "<%!\n" +
            "  public int sum(int a, int b) {\n" +
            "      return a + b;\n" +
            "  }\n" +
            "%>\n" +
            "<html>\n" +
            "<head>\n" +
            "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n" +
            "<title>Method in JSP</title>\n" +
            "</head>\n" +
            "<body>\n" +
            " \n" +
            "  <h1>\n" +
            "      1 + 2 =    <%=sum(1, 2)%>\n" +
            "  </h1>\n" +
            " \n" +
            "</body>\n" +
            "</html>\n";
        result.innerText = str;
        str = "------------------------------------------------methodInJsp.jsp------------------------------------------------\n";
        str += "<div class=\"df-fragment df-cktext-default\">\n" +
            "<table border=\"1\" cellpadding=\"5\" cellspacing=\"0\" style=\"border-collapse:collapse; width:100%\">\n" +
            "<tbody>\n" +
            "<tr>\n" +
            "<td><strong>Directive (Chỉ thị)</strong></td>\n" +
            "<td><strong>Mô tả</strong></td>\n" +
            "</tr>\n" +
            "<tr>\n" +
            "<td>&lt;%@ page ... %&gt;</td>\n" +
            "<td>Dùng để định nghĩa một vài thuộc tính, chẳng hạn như error, import, buffer, session,...</td>\n" +
            "</tr>\n" +
            "<tr>\n" +
            "<td>&lt;%@ include ... %&gt;</td>\n" +
            "<td>Sử dụng để nhúng một file vào JSP tại thời điểm biên dịch (compile) từ <strong>JSP </strong>thành <strong>Servlet</strong>.</td>\n" +
            "</tr>\n" +
            "<tr>\n" +
            "<td>&lt;%@ taglib ... %&gt;</td>\n" +
            "<td>Sử dụng để khai báo các thẻ <strong>JSP </strong>mở rộng, hoặc các thẻ (tag) tùy biến</td>\n" +
            "</tr>\n" +
            "</tbody>\n" +
            "</table>\n" +
            "</div><br>";
        result1.innerHTML = str;
    } else if (select.value === "5") {
        let str = "------------------------------------------------Index------------------------------------------------\n";
        str += "<form action=\"/helloWorld\" method=\"post\">\n" +
            "    <input type=\"text\" name=\"input1\">\n" +
            "    <input type=\"text\" name=\"input2\">\n" +
            "    <input type=\"submit\">\n" +
            "  </form>\n";
        str += "------------------------------------------------LearningServlet------------------------------------------------\n";
        str += "PrintWriter out = response.getWriter();\n" +
            "        int value1 = Integer.parseInt(request.getParameter(\"input1\"));\n" +
            "        int value2 = Integer.parseInt(request.getParameter(\"input2\"));\n" +
            "        out.println(\"Gia tri sum:\"+(value1+value2));\n" +
            "        response.sendRedirect(\"helloServlet?k=\"+(value1+value2));\n";
        str += "------------------------------------------------HelloServlet------------------------------------------------\n";
        str += "protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {\n" +
            "          int k = Integer.parseInt(request.getParameter(\"k\"));\n" +
            "          PrintWriter out = response.getWriter();\n" +
            "          out.println(\"Hello Servlet Sum is :\"+k);\n" +
            "    }\n";
        result.innerText = str;
    } else if (select.value === "6") {
        let str = "<table cellspacing=\"0\" frame=\"hsides\" rules=\"groups\" cellpadding=\"5\" width=\"100%\"><caption>" +
            "<h5 class=\"docTableTitle\">Table 8.1. Built-in JSP Objects and Their Implementation Classes</h5></caption><colgroup align=\"left\" span=\"2\">" +
            "</colgroup><thead><tr><th class=\"docTableHeader\" valign=\"top\"><p class=\"docText\"><span class=\"docEmphStrong\">JSP</span> <span class=\"docEmphStrong\">Object</span>" +
            "</p></th><th class=\"docTableHeader\" valign=\"top\"><p class=\"docText\"><span class=\"docEmphStrong\">Implementation Class</span>" +
            "</p></th></tr></thead><tbody><tr><td class=\"docTableCell\" valign=\"top\"><p class=\"docText\"><tt>request</tt></p></td><td class=\"docTableCell\" valign=\"top\">" +
            "<p class=\"docText\"><tt>HttpServletRequest</tt></p></td></tr><tr><td class=\"docTableCell\" valign=\"top\"><p class=\"docText\"><tt>response</tt></p></td>" +
            "<td class=\"docTableCell\" valign=\"top\"><p class=\"docText\"><tt>HttpServletResponse</tt></p></td></tr><tr><td class=\"docTableCell\" valign=\"top\">" +
            "<p class=\"docText\"><tt>out</tt></p></td><td class=\"docTableCell\" valign=\"top\"><p class=\"docText\"><tt>JspWriter</tt></p></td></tr><tr>" +
            "<td class=\"docTableCell\" valign=\"top\"><p class=\"docText\"><tt>session</tt></p></td><td class=\"docTableCell\" valign=\"top\">" +
            "<p class=\"docText\"><tt>HttpSession</tt></p></td></tr><tr><td class=\"docTableCell\" valign=\"top\"><p class=\"docText\"><tt>application</tt></p></td>" +
            "<td class=\"docTableCell\" valign=\"top\"><p class=\"docText\"><tt>ServletContext</tt></p></td></tr><tr><td class=\"docTableCell\" valign=\"top\">" +
            "<p class=\"docText\"><tt>pageContext</tt></p></td><td class=\"docTableCell\" valign=\"top\"><p class=\"docText\"><tt>PageContext</tt></p></td></tr><tr>" +
            "<td class=\"docTableCell\" valign=\"top\"><p class=\"docText\"><tt>config</tt></p></td><td class=\"docTableCell\" valign=\"top\"><p class=\"docText\"><tt>ServletConfig</tt></p>" +
            "</td></tr><tr><td class=\"docTableCell\" valign=\"top\"><p class=\"docText\"><tt>page</tt></p></td><td class=\"docTableCell\" valign=\"top\">" +
            "<p class=\"docText\"><tt>Object</tt></p></td></tr><tr><td class=\"docTableCell\" valign=\"top\"><p class=\"docText\"><tt>exception</tt></p></td>" +
            "<td class=\"docTableCell\" valign=\"top\"><p class=\"docText\"><tt>Throwable</tt></p></td></tr></tbody></table>";
        result.innerHTML = str;
    } else if (select.value === "7") {
        let str = "\n------------------------------------------------Download file jar------------------------------------------------\n";
        str += "mysql-connector-java-8.0.21.jar\n";
        str += "\n------------------------------------------------Database Connection------------------------------------------------\n";
        str += "package ConnectDatabase;\n" +
            "\n" +
            "import java.sql.Connection;\n" +
            "import java.sql.DriverManager;\n" +
            "\n" +
            "public class ConnectDatabase {\n" +
            "    public static Connection getConnection() {\n" +
            "        Connection conn = null;\n" +
            "        String url = \"jdbc:mysql://localhost:3306/drink\";\n" +
            "        String user = \"root\";\n" +
            "        String pass = \"1234\";\n" +
            "        try {\n" +
            "            Class.forName(\"com.mysql.jdbc.Driver\");\n" +
            "            conn = DriverManager.getConnection(url,user,pass);\n" +
            "        } catch (Exception ex) {\n" +
            "            ex.printStackTrace();\n" +
            "        }\n" +
            "        return conn;\n" +
            "    }\n" +
            "}\n";
        str += "------------------------------------------------Get Database from jsp------------------------------------------------\n";
        str += "  <%\n" +
            "    String url = \"jdbc:mysql://localhost:3306/drink\";\n" +
            "    String user = \"root\";\n" +
            "    String pass = \"1234\";\n" +
            "    String sql = \"select * from user where user_id = 1\";\n" +
            "    Class.forName(\"com.mysql.jdbc.Driver\");\n" +
            "    Connection conn = DriverManager.getConnection(url,user,pass);\n" +
            "    Statement statement = conn.createStatement();\n" +
            "    ResultSet rs = statement.executeQuery(sql);\n" +
            "    rs.next();\n" +
            "  %>\n" +
            "  <h1>UserID</h1><%=rs.getString(1)%>\n" +
            "  <h1>UserEmail</h1><%=rs.getString(2)%>\n" +
            "  <h1>UserPassWord</h1><%=rs.getString(3)%>\n";
        result.innerText = str;
    } else if (select.value === "8") {
        let str = "------------------------------------------------Cai dat file jar------------------------------------------------\n";
        str += "File Jar: jstl-1.2.jar\n";
        str += "<%@ taglib prefix=\"c\" uri=\"http://java.sun.com/jsp/jstl/core\"%>\n";
        str += "------------------------------------------------Lay data tu servlet------------------------------------------------\n";
        str += "String name = \"Pham Vu\";\n" +
            "          request.setAttribute(\"label\",name);\n" +
            "          RequestDispatcher requestDispatcher = request.getRequestDispatcher(\"FolderName/final.jsp\");\n" +
            "          requestDispatcher.forward(request,response);\n";
        str += "File Final.jsp\n";
        str += "<h1>${label}</h1>\n";
        str += "------------------------------------------------Cac Tu khoa------------------------------------------------\n\n";
        str += "----Get variable:\n";
        str += "<h1>${label}</h1>\n";
        str += "Print to screen:";
        str += "<c:out value='abc'></c:out>\n\n";
        str += "----Import file:\n";
        str += "<c:import url='https://abc.com'></c:import>\n\n";
        str += "----For each:\n";
        str += "* Servlet:\n";
        str += "List<Student> std = Arrays.asList(new Student(\"1\",\"PhamVu\"),new Student(\"2\",\"Hoang Mai Nhi\"));\n";
        str += "request.setAttribute('students',std)\n\n";
        str += "* jsp:\n";
        str += "<c:forEach item='${students}' var='s'> \n" +
            "${s}<br/>\n" +
            "</c:forEach>\n";
        result.innerText = str;
    } else if (select.value === "9") {
        let str = "\n------------------------------------------------Cai dat file jar------------------------------------------------\n";
        str += "<%@ taglib prefix=\"c\" uri=\"http://java.sun.com/jsp/jstl/core\" %>\n" +
            "<%@ taglib prefix=\"sql\" uri=\"http://java.sun.com/jsp/jstl/sql\" %>\n";
        str += "\n------------------------------------------------File JSP------------------------------------------------\n";
        str += "<sql:setDataSource var=\"db\" driver=\"com.mysql.jdbc.Driver\" url=\"jdbc:mysql://localhost:3306/classicmodels\" user=\"root\"\n" +
            "                   password=\"1234\"/>\n" +
            "\n" +
            "<sql:query var=\"rs\" dataSource=\"${db}\">\n" +
            "    select * from customers;\n" +
            "</sql:query>\n" +
            "\n" +
            "<table>\n" +
            "    <tr>\n" +
            "        <th>Customer ID</th>\n" +
            "        <th>Customer Name</th>\n" +
            "        <th>Country</th>\n" +
            "    </tr>\n" +
            "    <c:forEach items=\"${rs.rows}\" var=\"customer\">\n" +
            "        <tr align=\"center\">\n" +
            "            <td><c:out value=\"${customer.customerNumber}\"></c:out></td>\n" +
            "            <td><c:out value=\"${customer.customerName}\"></c:out></td>\n" +
            "            <td><c:out value=\"${customer.country}\"></c:out></td>\n" +
            "        </tr>\n" +
            "    </c:forEach>\n" +
            "</table>\n";
        result.innerText = str;
    } else if (select.value === "10") {
        let str = "\n------------------------------------------------Cai dat file jar------------------------------------------------\n";
        str += "<%@ taglib prefix=\"c\" uri=\"http://java.sun.com/jsp/jstl/core\" %>\n" +
            "<%@ taglib prefix=\"sql\" uri=\"http://java.sun.com/jsp/jstl/sql\" %>\n" +
            "<%@ taglib prefix=\"fn\" uri=\"http://java.sun.com/jsp/jstl/functions\" %>\n";
        str += "\n------------------------------------------------File JSP------------------------------------------------\n";
        str += "<c:set var=\"str\" value=\"Hello guy!! My name is Vu!! Im from VietNam!!\"></c:set>\n" +
            "\n" +
            "<c:forEach items=\"${fn:split(str,' ')}\" var=\"s\">\n" +
            "    ${s}\n" +
            "    <br>\n" +
            "</c:forEach>\n";
        result.innerText = str;
    } else if (select.value === "11") {
        let str = "\n------------------------------------------------Filter File------------------------------------------------\n";
        str += "@WebFilter(filterName = \"FilterHello\",urlPatterns = \"/helloServlet\")\n" +
            "public class FilterHello implements Filter {\n" +
            "    public void destroy() {\n" +
            "    }\n" +
            "\n" +
            "    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {\n" +
            "        String input = req.getParameter(\"input1\");\n" +
            "        if (input.equals(\"getin\")) {\n" +
            "            chain.doFilter(req, resp);\n" +
            "        } else {\n" +
            "            PrintWriter out = resp.getWriter();\n" +
            "            out.println(\"invalid input\");\n" +
            "        }\n" +
            "\n" +
            "    }\n" +
            "\n" +
            "    public void init(FilterConfig config) throws ServletException {\n" +
            "\n" +
            "    }\n" +
            "\n" +
            "}\n";
        str += "\n------------------------------------------------Servlet File------------------------------------------------\n";
        str += "@WebServlet(name = \"HelloServlet\")\n" +
            "public class HelloServlet extends HttpServlet {\n" +
            "    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {\n" +
            "//        PrintWriter out = response.getWriter();\n" +
            "//        out.println(\"My name is HelloServlet\");\n" +
            "\n" +
            "    }\n" +
            "\n" +
            "    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {\n" +
            "          String name = \"Pham Vu\";\n" +
            "          request.setAttribute(\"label\",name);\n" +
            "          RequestDispatcher requestDispatcher = request.getRequestDispatcher(\"FolderName/final.jsp\");\n" +
            "          requestDispatcher.forward(request,response);\n" +
            "    }\n" +
            "}\n";
        str += "\n------------------------------------------------Index File------------------------------------------------\n\n";
        str += "<%@ page contentType=\"text/html;charset=UTF-8\" language=\"java\" %>\n" +
            "<%@ taglib prefix=\"c\" uri=\"http://java.sun.com/jsp/jstl/core\"%>\n" +
            "<html>\n" +
            "  <head>\n" +
            "    <title>$Title$</title>\n" +
            "  </head>\n" +
            "  <body>\n" +
            "    <c:out value=\"HelloWorld\"></c:out>\n" +
            "    <form action=\"/helloServlet\" method=\"get\">\n" +
            "      <input type=\"text\" name=\"input1\">\n" +
            "      <input type=\"submit\">\n" +
            "    </form>\n" +
            "  </body>\n" +
            "</html>\n";
        str += "\n------------------------------------------------Final File------------------------------------------------\n\n";
        str += "<%@ page contentType=\"text/html;charset=UTF-8\" language=\"java\" %>\n" +
            "<%@ taglib prefix=\"c\" uri=\"http://java.sun.com/jsp/jstl/core\" %>\n" +
            "<%@ taglib prefix=\"sql\" uri=\"http://java.sun.com/jsp/jstl/sql\" %>\n" +
            "<%@ taglib prefix=\"fn\" uri=\"http://java.sun.com/jsp/jstl/functions\" %>\n" +
            "<html>\n" +
            "<head>\n" +
            "    <title>Title</title>\n" +
            "</head>\n" +
            "<body>\n" +
            "\n" +
            "<c:set var=\"str\" value=\"Hello guy!! My name is Vu!! Im from VietNam!!\"></c:set>\n" +
            "\n" +
            "<h1>Index VietNam: ${fn:indexOf(str,\"VietNam\")}</h1>\n" +
            "<h1>Contain VietNam: ${fn:contains(str,\"VietNam\")}</h1>\n" +
            "<h1>check if:\n" +
            "\n" +
            "    <c:if test=\"${fn:contains(str,'VietNam')}\">\n" +
            "        Viet Nam is here\n" +
            "    </c:if>\n" +
            "\n" +
            "</h1>\n" +
            "\n" +
            "<c:forEach items=\"${fn:split(str,' ')}\" var=\"s\">\n" +
            "    ${s}\n" +
            "    <br>\n" +
            "</c:forEach>\n" +
            "\n" +
            "</body>\n" +
            "</html>\n";
        result.innerText = str;
    } else if (select.value === "12") {
        let str = "\n------------------------------------------------Thay doi xml------------------------------------------------\n";
        str += "<display-name>Login Page</display-name>\n" +
            "    <welcome-file-list>\n" +
            "        <welcome-file>/login/index.jsp</welcome-file>\n" +
            "    </welcome-file-list>\n";
        str += "\n------------------------------------------------File index------------------------------------------------\n";
        str += "<c:redirect url=\"/login/login.jsp\"/>";
        result.innerText = str;
    } else if (select.value === "13") {
        let str = "\n------------------------------------------------Buoc 1------------------------------------------------\n";
        str += "1.Add maven framework\n";
        str += "2.Them Meta-INF vao resources\n";
        str += "\n------------------------------------------------File Pom.xml------------------------------------------------\n";
        str += "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n" +
            "<project xmlns=\"http://maven.apache.org/POM/4.0.0\"\n" +
            "         xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n" +
            "         xsi:schemaLocation=\"http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd\">\n" +
            "    <modelVersion>4.0.0</modelVersion>\n" +
            "\n" +
            "    <groupId>com.bookstored</groupId>\n" +
            "    <artifactId>BookStoredWebsite</artifactId>\n" +
            "    <version>1.0-SNAPSHOT</version>\n" +
            "\n" +
            "    <dependencies>\n" +
            "        <dependency>\n" +
            "            <groupId>mysql</groupId>\n" +
            "            <artifactId>mysql-connector-java</artifactId>\n" +
            "            <version>8.0.21</version>\n" +
            "            <scope>runtime</scope>\n" +
            "        </dependency>\n" +
            "        <dependency>\n" +
            "            <groupId>javax.servlet.jsp.jstl</groupId>\n" +
            "            <artifactId>javax.servlet.jsp.jstl-api</artifactId>\n" +
            "            <version>1.2.2</version>\n" +
            "            <scope>compile</scope>\n" +
            "        </dependency>\n" +
            "        <dependency>\n" +
            "            <groupId>org.hibernate</groupId>\n" +
            "            <artifactId>hibernate-core</artifactId>\n" +
            "            <version>5.4.19.Final</version>\n" +
            "            <scope>compile</scope>\n" +
            "        </dependency>\n" +
            "        <dependency>\n" +
            "            <groupId>javax.servlet</groupId>\n" +
            "            <artifactId>javax.servlet-api</artifactId>\n" +
            "            <version>4.0.1</version>\n" +
            "            <scope>provided</scope>\n" +
            "        </dependency>\n" +
            "        <dependency>\n" +
            "            <groupId>javax.servlet.jsp</groupId>\n" +
            "            <artifactId>javax.servlet.jsp-api</artifactId>\n" +
            "            <version>2.3.3</version>\n" +
            "            <scope>provided</scope>\n" +
            "        </dependency>\n" +
            "    </dependencies>\n" +
            "</project>\n";
        str += "\n------------------------------------------------File persistence.xml------------------------------------------------\n";
        str += "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n" +
            "<persistence version=\"2.1\"\n" +
            "             xmlns=\"http://xmlns.jcp.org/xml/ns/persistence\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n" +
            "             xsi:schemaLocation=\"http://xmlns.jcp.org/xml/ns/persistence http://xmlns.jcp.org/xml/ns/persistence/persistence_2_1.xsd\">\n" +
            "    <persistence-unit name=\"BookUnit\">\n" +
            "        <properties>\n" +
            "            <property name=\"javax.persistence.jdbc.driver\" value=\"com.mysql.jdbc.Driver\" />\n" +
            "            <property name=\"javax.persistence.jdbc.url\" value=\"jdbc:mysql://localhost:3306/example\" />\n" +
            "            <property name=\"javax.persistence.jdbc.user\" value=\"root\" />\n" +
            "            <property name=\"javax.persistence.jdbc.password\" value=\"1234\" />\n" +
            "            <property name=\"hibernate.show_sql\" value=\"true\" />\n" +
            "            <property name=\"hibernate.format_sql\" value=\"true\" />\n" +
            "        </properties>\n" +
            "    </persistence-unit>\n" +
            "</persistence>\n";
        str += "\n------------------------------------------------File App.java------------------------------------------------\n";
        str += "import javax.persistence.EntityManager;\n" +
            "import javax.persistence.EntityManagerFactory;\n" +
            "import javax.persistence.Persistence;\n" +
            "import javax.persistence.Query;\n" +
            "import java.util.List;\n" +
            "\n" +
            "public class App {\n" +
            "    static EntityManagerFactory factory;\n" +
            "    static EntityManager entityManager;\n" +
            "    public static void main(String[] args) {\n" +
            "        begin();\n" +
            "\n" +
            "        create();\n" +
            "\n" +
            "        update();\n" +
            "\n" +
            "        find(1);\n" +
            "\n" +
            "        query();\n" +
            "\n" +
            "        remove(2);\n" +
            "\n" +
            "        close();\n" +
            "\n" +
            "    }\n" +
            "\n" +
            "    private static void begin() {\n" +
            "        factory = Persistence.createEntityManagerFactory(\"BookUnit\");\n" +
            "        entityManager = factory.createEntityManager();\n" +
            "        entityManager.getTransaction().begin();\n" +
            "    }\n" +
            "\n" +
            "    private static void close() {\n" +
            "        entityManager.getTransaction().commit();\n" +
            "        entityManager.close();\n" +
            "        factory.close();\n" +
            "    }\n" +
            "\n" +
            "    private static void create() {\n" +
            "        Book newBook = new Book();\n" +
            "        newBook.setTitle(\"Effective Java\");\n" +
            "        newBook.setAuthor(\"Joshua Bloch\");\n" +
            "        newBook.setPrice(39);\n" +
            "\n" +
            "        entityManager.persist(newBook);\n" +
            "    }\n" +
            "\n" +
            "    private static void update() {\n" +
            "        Book exitsBook = new Book();\n" +
            "        exitsBook.setBook_id(3);\n" +
            "        exitsBook.setTitle(\"Com Son Fucker\");\n" +
            "        exitsBook.setAuthor(\"Your Name\");\n" +
            "        exitsBook.setPrice(45);\n" +
            "\n" +
            "        entityManager.merge(exitsBook);\n" +
            "    }\n" +
            "\n" +
            "    private static void find(int id) {\n" +
            "        int primaryKey = id;\n" +
            "        Book book = entityManager.find(Book.class,primaryKey);\n" +
            "\n" +
            "        System.out.println(book.getTitle());\n" +
            "        System.out.println(book.getAuthor());\n" +
            "        System.out.println(book.getPrice());\n" +
            "    }\n" +
            "\n" +
            "    private static void query() {\n" +
            "        String jpql = \"Select b from Book b where b.price>39\";\n" +
            "        Query query = entityManager.createQuery(jpql);\n" +
            "        @SuppressWarnings(\"uncheck\")\n" +
            "        List<Book> listBooks = query.getResultList();\n" +
            "\n" +
            "        for (Book aBook:listBooks) {\n" +
            "            System.out.println(aBook.getTitle()+\" \"+aBook.getAuthor()+\" \"+aBook.getPrice());\n" +
            "        }\n" +
            "    }\n" +
            "\n" +
            "    private static void remove(int id) {\n" +
            "        int primaryKey = id;\n" +
            "        Book reference = entityManager.getReference(Book.class,primaryKey);\n" +
            "        entityManager.remove(reference);\n" +
            "    }\n" +
            "\n" +
            "}\n";
        str += "\n------------------------------------------------File Book.java------------------------------------------------\n";
        str += "import javax.persistence.*;\n" +
            "\n" +
            "@Entity\n" +
            "public class Book {\n" +
            "\n" +
            "    private int bookid;\n" +
            "    private String title;\n" +
            "    private String author;\n" +
            "    private float price;\n" +
            "\n" +
            "    @Id\n" +
            "    @Column(name= \"book_id\")\n" +
            "    @GeneratedValue(strategy = GenerationType.IDENTITY)\n" +
            "    public int getBook_id() {\n" +
            "        return bookid;\n" +
            "    }\n" +
            "\n" +
            "    public void setBook_id(int book_id) {\n" +
            "        this.bookid = book_id;\n" +
            "    }\n" +
            "\n" +
            "    public String getTitle() {\n" +
            "        return title;\n" +
            "    }\n" +
            "\n" +
            "    public void setTitle(String title) {\n" +
            "        this.title = title;\n" +
            "    }\n" +
            "\n" +
            "    public String getAuthor() {\n" +
            "        return author;\n" +
            "    }\n" +
            "\n" +
            "    public void setAuthor(String author) {\n" +
            "        this.author = author;\n" +
            "    }\n" +
            "\n" +
            "    public float getPrice() {\n" +
            "        return price;\n" +
            "    }\n" +
            "\n" +
            "    public void setPrice(float price) {\n" +
            "        this.price = price;\n" +
            "    }\n" +
            "}\n";
        str += "\n------------------------------------------------File SQL------------------------------------------------\n";
        str += "drop database if exists example;\n" +
            "create database example;\n" +
            "use example;\n" +
            "\n" +
            "create table book(\n" +
            "book_id int auto_increment,\n" +
            "title varchar(50),\n" +
            "author varchar(50),\n" +
            "price float,\n" +
            "primary key(book_id)\n" +
            ");\n";
        result.innerText = str;
        str = "<img src=\"img/1.bmp\"/></div><br>" +
            "    <img src=\"img/2.bmp\"/><br>";
        result1.innerHTML = str;
    } else if (select.value === "14") {
    } else if (select.value === "15") {
    } else if (select.value === "16") {
    }
}

function printBlue(str) {
    str = str.replace(/create/gi, returnBlue("create"));
    str = str.replace(/function/gi, returnBlue("function"));
    str = str.replace(/returns/gi, returnBlue("returns"));
    str = str.replace(/return(?!s)/gi, returnBlue("return"));
    str = str.replace(/into/gi, returnBlue("into"));
    str = str.replace(/int(?!o)/gi, returnBlue("int"));
    str = str.replace(/deterministic/gi, returnBlue("deterministic"));
    str = str.replace(/begin/gi, returnBlue("begin"));
    str = str.replace(/declare/gi, returnBlue("declare"));
    str = str.replace(/set/gi, returnBlue("set"));
    str = str.replace(/insert/gi, returnBlue("insert"));
    str = str.replace(/procedure/gi, returnBlue("procedure"));
    str = str.replace(/select/gi, returnBlue("select"));
    str = str.replace(/values/gi, returnBlue("values"));
    str = str.replace(/if/gi, returnBlue("if"));
    str = str.replace(/not/gi, returnBlue("not"));
    str = str.replace(/exists/gi, returnBlue("exists"));
    str = str.replace(/where/gi, returnBlue("where"));
    str = str.replace(/then/gi, returnBlue("then"));
    str = str.replace(/rollback/gi, returnBlue("rollback"));
    str = str.replace(/end/gi, returnBlue("end"));
    str = str.replace(/transaction/gi, returnBlue("transaction"));
    str = str.replace(/start/gi, returnBlue("start"));
    return str;
}

function returnBlue(str) {
    return "<span style='color:blue'>" + str + "</span>";
}