<%@ page import="java.util.Date" %>
<%@ page import="adapter.*" %>
<%@ page import="model.*" %>

<HTML>
<HEAD>
  <TITLE>Car Configuration Pages</TITLE>
</HEAD>

<BODY>
<H2>Here is what you selected:</H2>

<% request.setCharacterEncoding("UTF-8");
	CreateAuto autos = new BuildAuto();
	String model = request.getParameter("Model");
	String make = request.getParameter("Make");
	Automobile auto = autos.getAuto(model);
	session.setAttribute("auto", auto);
	 
%>


<table border="solid">
    <thead>
        <tr>
            <th><%= make %> <%= model %></th>
            <th> base price</th>
            <td> <%= auto.getBasePrice()%></td>
        </tr>
    </thead>
    <tbody>
    <% for(int i = 0; i < auto.getOptionSetLength(); i++){ 
    auto.setOptionChoice(auto.getOptionSetName(i), request.getParameter(auto.getOptionSetName(i)));
    System.out.println(auto.getOptionSetName(i));
    %>
        <tr>
            <td><%= auto.getOptionSetName(i) %></td>
            <td><%= auto.getOptionChoiceName(auto.getOptionSetName(i)) %></td>
            <td align="right"><%= auto.getOptionChoicePrice(auto.getOptionSetName(i)) %></td>
        </tr>
    <% } %>
    
    <tr>
    	<td> Total Cost </td>
    	<td></td>
    	<td align="right"><b> $ <%=auto.getTotalPrice() %></b></td>
    </tr>
    </tbody>
</table>

<p> to download the data in .xslx file, add in URL "?format=excel"</p>


<% String format = request.getParameter("format");
if ((format != null) && (format.equals("excel"))) { 
	  response.setContentType("application/vnd.ms-excel");
	} 
%>

</BODY>
</HTML>