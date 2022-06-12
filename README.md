# Web-Development

*[Lecture note from May 23th](https://fhda-edu.zoom.us/rec/play/PTdnbMuYci8my9CDdqyHDXlUt3mpbYtyOB2hUUK7zvAQ8Mxcyo51bOpwidW_JtCdCrdC4o8qdkKL1s4.a_o31hlRDosImSrM?continueMode=true&_x_zm_rtaid=KGPhdqD8RomStFwZGh3Y8w.1654976162836.fea5656985d55f31a9234595e2e13b5c&_x_zm_rhtaid=973)*<br>
*[Lecture note from May 25th](https://fhda-edu.zoom.us/rec/play/B727TtFoCBO5mn-pqZn_-GT20rVmUWsI2bBkgeUacn3_YEmUCKCmj1ooiSTeHPTnXcLrfiDhgIX23IwN.hf5uVe0reLPU8z4J?continueMode=true&_x_zm_rtaid=KGPhdqD8RomStFwZGh3Y8w.1654976162836.fea5656985d55f31a9234595e2e13b5c&_x_zm_rhtaid=973)* <br>
*[Lecture note from Jun 1st](https://fhda-edu.zoom.us/rec/play/K64VIuu2ROBimsDY6bgN22xfr9qhzMIj5CI3Q0bBl-3_zd8nIw_NpnUhAVeEmZiY0PW8eknbEDCbt2ZA.kJbJ7kXsHuEI-8Pr?startTime=1654139129000&_x_zm_rtaid=KGPhdqD8RomStFwZGh3Y8w.1654976162836.fea5656985d55f31a9234595e2e13b5c&_x_zm_rhtaid=973)* <br>
*[Lecture note from Jun 6th](https://fhda-edu.zoom.us/rec/play/N_v9N7X7xOpibS6iSxnwc-3PJ2RYN28Dx22drfhW_NM76gJzo1cedyga6cb-GbcnILeSCfN4InA8j9I.PsVM-L0I6jQ4qFMz?continueMode=true&_x_zm_rtaid=X2q65z4NRuqbxpAKXg0oDQ.1655063985771.f6d4c887ee293e5c6a94522b78e44c9c&_x_zm_rhtaid=535)* <br>

## HTTP Protocol
The HTTP protocol is layered over a reliable bidirectional byte stream, 
normally TCP (Transfer Contral Protocol(reliable)). Each HTTP interaction consists of a request sent from the client to the server, followed by a response sent from the server to the client. Requests and responses are expressed in a simple ASCII format.(Clear Text) 


HTTP is reliable but stateless, meaning the application cannot memorize previous connection.

**HTTP Methods**
<table>
  <tr>
    <th> Method </th>
    <th> Description </th>
  </tr>
  <tr>
    <td> OPTIONS </td>
    <td>Rquest for communication options available on the request/response chain</td>
  </tr>
  <tr>
    <td> GET </td>
    <td> Requet to retirieve information from server </td>
  </tr>
    <tr>
    <td> HEAD </td>
    <td> Identical to GET except that it does not return message-body. only the headers. </td>
  </tr>
    <tr>
    <td> POST </td>
    <td> request for server to accept the entit enclosed in the body of HTTP method. </td>
  </tr>
  </tr>
    <tr>
    <td> DELETE </td>
    <td> Request for servre to delete the resource. </td>
  </tr>
  <tr>
    <td> CONNECT </td>
    <td> Reserved for use with a proxy that can switch to being a tunnel. </td>
  </tr>
</table>

**HTTP Errors**
<table>
  <tr>
    <th> Error No. </th>
    <th> Description </th>
  </tr>
  <tr>
    <td> 100-199 </td>
    <td> Codes in the 100’s are informational, indicating that </td>
  </tr>
  <tr>
    <td> 200-299 </td>
    <td> Indicate that the request was successful </td>
  </tr>
    <tr>
    <td> 300-399 </td>
    <td> Used for files that have moved and usually indicate a 
Location header indicating the new address. </td>
  </tr>
    <tr>
    <td> 400-499 </td>
    <td> Indicate an error by the client </td>
  </tr>
  </tr>
    <tr>
    <td> 500-599 </td>
    <td> Signify an error by the server. </td>
  </tr>
</table>

### Simple Client Server Interaction

#### GET Request (Read information)
**Browser**
> **header** - Browser information (Data is sent in header to the server)<br>
> **body** - Usually empty

**Server**
> **header** - Server information<br>
> **body** - Response data

#### POST Request (Write information)
**Browser**
> **header** - browser information<br>
> **body** - Request Data, and Value/Name pairs. (data is sent in request body)

**Server**
> **header** - Server information<br>
> **body** - Response data

## Servlet 
> 1. Load Servlet Calss
> 2. Create Servlet Instance
> 3. Call the *init()* method (Initiation Servlet and call service() method)
> 4. Call the *service()* method
> 5. Call the *destory()* method


```Java
//Program 1
//A plain old Servlet
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class Program1 extends HttpServlet {
  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    String docType =
      "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 " +
      "Transitional//EN\">\n";
    out.println(docType +
                "<HTML>\n" +
                "<HEAD><TITLE>Hello</TITLE></HEAD>\n" +
                "<BODY BGCOLOR=\"#FDF5E6\">\n" +
                "<H1>Hello</H1>\n" +
                "</BODY></HTML>");
  }
}
```

**HTTPServletRequest Object**<br>
>provides access to HTTP header data: such as cookies.
>the HTTP method with which the request is made.
>obtain args that the client sent as part of the request.


***Methods***
>getparameter --- returns value of named parameters <br>
>getParameterValues --- returns the array of values for the named parameter <br>
>getParameterNames --- returns the names of the parameters <br>
>getQueryString --- returns a String of raw data from the client <br>
        
FOR HTTP POST, PUT and DELETE requests<br>
the text data is handled by getReader() method that provides you with BufferedReader object to read raw data.
the binary data is handled in getInputStream() method that provides a ServletInputStream to read the raw data.
        
**HTTPServletResponse Object**<br>
Two ways are available for returning the data from the user.
getWriter() method returns a writer for text data
getOutputStream returns a ServletOutputStream for binary data


Closing these streams allows the server to know the the response is complete.

Prgram 2
```Java
//Reading Parameters in Servlets
import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Program2 extends HttpServlet {


  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {


    ServletOutputStream out = response.getOutputStream();
    String fileName = request.getParameter("file");


    out.println("<html>");
    out.println("<head>");
    out.println("<title>Welcome</title>");
    out.println("</head>");
    out.println("<body>");
    out.println("<h2>The File</h2>");
    out.println(fileName);
    out.println("</body>");
    out.println("</html>");
    out.close();


  }
  public void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    doGet(request, response);
  }
}
```

Prgram 3
```Java
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class Program3 extends HttpServlet 
{
    String msg = "";


    public void init(ServletConfig config)
    {
        msg = "Hello from Java servlets!";
    }


    public void doGet(HttpServletRequest request,
        HttpServletResponse response)
        throws IOException, ServletException
    {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();


        out.println("<HTML>");
        out.println("<HEAD>");
        out.println("<TITLE>");
        out.println("Using the init Method");
        out.println("</TITLE>");
        out.println("</HEAD>");
        out.println("<BODY>");
        out.println("<H1>Using the init Method</H1>");
        out.println(msg);
        out.println("</BODY>");
        out.println("</HTML>");
    }
}

```
#### Debugging Servlets
>1. Look at the HTML Source - to see if the tags are coded properly.
>2. Return error pages to the client - typically send error code -
>3. Look at the server running in command line for any apparent errors when the call to the servlet is made.
>4. HTTPServlet object has a method called log that allows you to log information to the server. Location of the file is specific to Servlet Engines
>5. Printout request data separately
>6. print out response data separately.
>7. Restarting the webserver is also a good idea: unless the webserver support automatic reload.


Accessing the CGI Standard Variables<br>
**CGI** - Common Gateway Interface allows execution of several types of programs and is  collection of information about the current request.


Information is collected for HTTP request header or thru sockets by connecting to the requesting host.


**Following is the collection of CGI Variables**
<table>
  <tr>
    <th> CGI variables </th>
    <th> Description </th>
  </tr>
  <tr>
    <td> AUTH_TYPE  </td>
    <td> Gives authorization type in Authorization header, if one is available(basic or digest.) </td>
  </tr>
  <tr>
    <td> CONTENT_LENGTH </td>
    <td> For POST Requests only. Size in Bytes indicating the size of data in POST. </td>
  </tr>
    <tr>
    <td> CONTENT_TYPE   </td>
    <td> designate the MIME Type of attached data. </td>
  </tr>
    <tr>
    <td> DOCUMENT_ROOT   </td>
    <td> Provides name of the real directory corresponding to the URL </td>
  </tr>
  </tr>
    <tr>
    <td> HTTO_XXX_YYYY  </td>
    <td> gives information on HTTP Request header </td>
  </tr>
  </tr>
    <tr>
    <td> PATH_INFO   </td>
    <td> gives path information attached to the URL after the address of the servlet - but before query data </td>
  </tr>
  </tr>
  <tr>
    <td> PATH_TRANSLATED  </td>
    <td> gives path information mapped to the real path on the server </td>
  </tr>
  <tr>
    <td> QUERY_STRING   </td>
    <td> Provides raw data in the servlet </td>
  </tr>
  <tr>
    <td> REMOTE_ADDR    </td>
    <td> Indicates the IP Address of the client that made the request </td>
  </tr>
  <tr>
    <td> REMOTE_HOST    </td>
    <td> Indicates fully qualified Domain name </td>
  </tr>
  <tr>
    <td> REMOTE_USER    </td>
    <td> If authorization header is available, then the user information accessed can be used for session tracking </td>
  </tr>
  <tr>
    <td> REQUEST_METHOD    </td>
    <td> gives information on the method type. </td>
  </tr>
  <tr>
    <td> SCRIPT_NAME     </td>
    <td> gives path to the servlet name </td>
  </tr>
  <tr>
    <td> SERVER_NAME </td>
    <td> host name </td>
  </tr>
    <tr>
    <td> SERVER_PORT   </td>
    <td> information about the port that the server is listening on </td>
  </tr>
    <tr>
    <td> SERVER_PROTOCOL </td>
    <td> gives protocol name and version egHTTP/1.0 or 1.1 </td>
  </tr>
    <tr>
    <td> SERVER_SOFTWARE </td>
    <td> information about webserver </td>
  </tr>
</table>

```Java
package coreservlets;


import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;




public class ShowCGIVariables extends HttpServlet {
  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    String[][] variables =
      { { "AUTH_TYPE", request.getAuthType() },
        { "CONTENT_LENGTH",
          String.valueOf(request.getContentLength()) },
        { "CONTENT_TYPE", request.getContentType() },
        { "DOCUMENT_ROOT",
          getServletContext().getRealPath("/") },
        { "PATH_INFO", request.getPathInfo() },
        { "PATH_TRANSLATED", request.getPathTranslated() },
        { "QUERY_STRING", request.getQueryString() },
        { "REMOTE_ADDR", request.getRemoteAddr() },
        { "REMOTE_HOST", request.getRemoteHost() },
        { "REMOTE_USER", request.getRemoteUser() },
        { "REQUEST_METHOD", request.getMethod() },
        { "SCRIPT_NAME", request.getServletPath() },
        { "SERVER_NAME", request.getServerName() },
        { "SERVER_PORT",
          String.valueOf(request.getServerPort()) },
        { "SERVER_PROTOCOL", request.getProtocol() },
        { "SERVER_SOFTWARE",
          getServletContext().getServerInfo() }
      };
    String title = "Servlet Example: Showing CGI Variables";
    out.println(ServletUtilities.headWithTitle(title) +
                "<BODY BGCOLOR=\"#FDF5E6\">\n" +
                "<H1 ALIGN=\"CENTER\">" + title + "</H1>\n" +
                "<TABLE BORDER=1 ALIGN=\"CENTER\">\n" +
                "<TR BGCOLOR=\"#FFAD00\">\n" +
                "<TH>CGI Variable Name<TH>Value");
    for(int i=0; i<variables.length; i++) {
      String varName = variables[i][0];
      String varValue = variables[i][1];
      if (varValue == null)
        varValue = "<I>Not specified</I>";
      out.println("<TR><TD>" + varName + "<TD>" + varValue);
    }
    out.println("</TABLE></BODY></HTML>");
  }


  /** POST and GET requests handled identically. */
  
  public void doPost(HttpServletRequest request,
                     HttpServletResponse response)
      throws ServletException, IOException {
    doGet(request, response);
  }
}
```

#### Session Tracking API
Used by Servlets to maintain the state about a series of requests from the same user.
This is similar to working with files.

You can look up the session object associated with the current request.
or create new session


lookup information associated with the session
store information in a session
discard or abandon a session


HttpSession Object Associated with current request
getSession()
isNew()


getAttribute()
removeAttribute()
getAttributeNames()
putAttribute()


getID()


getCreationTime()
LastAccessedTime(0


geMaxInactiveIntervals()
setMaxInactiveIntervals()


invalidate()


Intro to Session
Sessions help you remember the application state and can help deal with many transactions.
javax.servlet.http.HttpSession - Interface allows.


getsession( )
putValue ( name, value) where name is the parameter name of type String and value is of type Object.


getValue - retrieve information from a session.
```Java
    Object HttpSession.getValue(name)
```

getValueName - returns a String array that provides a list of all parameters passed.


removeValues(name) - will remove the value from the session object - good for memory optimization.


Session alive - 
HttpSession methods that help poll the information regarding a particular session.
>1. getId() - if the request to a sessioobject is invalid, in that case the request can get the sessionid from the servlet by using this method.<br>
>2. getSessionContext() - Information on the context of all valid Session.<br>
>3. isNew() return true or false: if the browser has never seen the session then this function returns true or it returns false.<br>
>4. getCreationTime - time when the session was created<br>
>5. getLastAccessedTime()<br>
>6. getMaxInactiveInterval()<br>
To destroy the session use the method called <br>
```Java
    invalidate()
```

Program6.java
```Java
package coreservlets;


import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.net.*;
import java.util.*;


Simple example of session tracking. 


public class Program6 extends HttpServlet {
  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    String title = "Session Tracking Example";
    HttpSession session = request.getSession(true);
    String heading;
    // Use getAttribute instead of getValue in version 2.2.
    Integer accessCount =
      (Integer)session.getValue("accessCount");
    if (accessCount == null) {
      accessCount = new Integer(0);
      heading = "Welcome, Newcomer";
    } else {
      heading = "Welcome Back";
      accessCount = new Integer(accessCount.intValue() + 1);
    }
    // Use setAttribute instead of putValue in version 2.2.
    session.putValue("accessCount", accessCount); 
      
    out.println(ServletUtilities.headWithTitle(title) +
                "<BODY BGCOLOR=\"#FDF5E6\">\n" +
                "<H1 ALIGN=\"CENTER\">" + heading + "</H1>\n" +
                "<H2>Information on Your Session:</H2>\n" +
                "<TABLE BORDER=1 ALIGN=\"CENTER\">\n" +
                "<TR BGCOLOR=\"#FFAD00\">\n" +
                "  <TH>Info Type<TH>Value\n" +
                "<TR>\n" +
                "  <TD>ID\n" +
                "  <TD>" + session.getId() + "\n" +
                "<TR>\n" +
                "  <TD>Creation Time\n" +
                "  <TD>" +
                new Date(session.getCreationTime()) + "\n" +
                "<TR>\n" +
                "  <TD>Time of Last Access\n" +
                "  <TD>" +
                new Date(session.getLastAccessedTime()) + "\n" +
                "<TR>\n" +
                "  <TD>Number of Previous Accesses\n" +
                "  <TD>" + accessCount + "\n" +
                "</TABLE>\n" +
                "</BODY></HTML>");


  }


  /** Handle GET and POST requests identically. */
  
  public void doPost(HttpServletRequest request,
                     HttpServletResponse response)
      throws ServletException, IOException {
    doGet(request, response);
  }
}

```
## Cookies

Small bit of Textual information sent to the browser by the WebServer.
### Advantages
> 1. Identify a user during an E-Commerce Session
> 2. Avoid Username and password for a session - if already logged in
> 3. Customization of site visit - like in my.yahoo.com - portal allowing customization of content
>4. Focused Advertising - Based on Search done - display the ads for the given context
### Disadvantages
> 1. Search for particular topics is remembered inside a cookie
> 2. Health Sensitive information can be shared between different sites. Leads to Email Spamming.


Because of the disadvantages - people turn off cookies usage in the browser.
As a Servlet Programmer, be careful not to use cookies for sensitive information.


### Cookie API
***Create a cookie***
```Java
        new Cookie(name, value)
```        
Following characters are not allowed: [](),"/?@:;

***Setting additional attributes***
```Java
        cookie.setXxx()
```
applies to outgoing cookie(server to client)

***Inserting the cookie into response header***
```Java
response.addCookie(cookie)
```        
***Reading incoming cookies*** 
```Java
        request.getCookies() 
```
returns an array of cookie objects which can later be traversed for usage.

***Adding comment with a cookie***
```Java
        Public String getComment()
        public void setComment(String comment)
        used for information about the cookie.
```

***getting and setting domain for the cookie***
```Java
        Public String getDomain()
        public void setDomain(String domainpattern)
```        
Normally the browser will return cookies to exact same host. This method can be used to instruct the browser to return them to other hosts within the same domain. For eg cookie.setDomain(".database.com") would send cookies to singh.database.com or oracle.database.com etc.
        
***setting the age of cookies***
```Java
        Public String getMaxAge()
        public void setMaxAge(int lifetime)
```
This allow the programmer to set the time in seconds before the cookie expires. 
A negative value indicates that the cookie last through the end of session.
A 0 value indicates the browser to delete the cookie.
A longlivedcookie can be set to leave the cookie inside the browser for a week, month or year - by specifying a large int value.


***Setting Cookie name***
```Java
        Public String getName()
        public void setName(String cookieName)
``` 
This set the name of the cookie.
Name is typically supplied in cookie constructor. getName is used to         traverse through the list array of 
cookie objects returned by getCookies.


***Setting/Getting path to which the cookie applies***
```Java
        Public String getPath()
        public void setPath(String path)
``` 
This method should be used to set the cookies for all pages in a website for a group of pages or                 just for one page.


For eg cookiename.setPath("?")  specifies that all pages on the server should receive the cookie.


***Setting cookies over secure connections***
```Java
        Public Boolean getSecure()
        public void setComment(Boolean secureFlag)
```
This flag sets a flag to indicate if the cookie should be sent over encrypted (SSL) Connections.
default is false. If set, the cookie should apply to all connections.


***getting and setting values from cookies***
```Java
        Public String getValue()
        public void setValue(String cookieValue)
```
 getVlaue looks up the value and setValue sets the value.


***Setting the version***
```Java
        Public int getVersion()
        public void setVersion(String comment)
```
These two method get/set the cookie protocol version that the cookie complies with.Version 0 follow the Netscape Specification. Version 1 follows RFC2109 specification. Version 1 is not widely implemented yet.


**Pogram 7**
```Java
package coreservlets;


import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Program7 extends HttpServlet {
  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
      throws ServletException, IOException {
    for(int i=0; i<3; i++) {
      // Default maxAge is -1, indicating cookie
      // applies only to current browsing session.
      Cookie cookie = new Cookie("Session-Cookie-" + i,
                                 "Cookie-Value-S" + i);
      response.addCookie(cookie);
      cookie = new Cookie("Persistent-Cookie-" + i,
                          "Cookie-Value-P" + i);
      // Cookie is valid for an hour, regardless of whether
      // user quits browser, reboots computer, or whatever.
      cookie.setMaxAge(3600);
      response.addCookie(cookie);
    } 
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    String title = "Setting Cookies";
    out.println
      (ServletUtilities.headWithTitle(title) +
       "<BODY BGCOLOR=\"#FDF5E6\">\n" +
       "<H1 ALIGN=\"CENTER\">" + title + "</H1>\n" +
       "There are six cookies associated with this page.\n" +
       "To see them, visit the\n" +
       "<A HREF=\"ShowCookies\">\n" +
       "<CODE>ShowCookies</CODE> servlet</A>.\n" +
       "<P>\n" +
       "Three of the cookies are associated only with the\n" +
       "current session, while three are persistent.\n" +
       "Quit the browser, restart, and return to the\n" +
       "<CODE>ShowCookies</CODE> servlet to verify that\n" +
       "the three long-lived ones persist across sessions.\n" +
       "</BODY></HTML>");
  }
}
```
```Java 

//ShowCookies.java
package coreservlets;


import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ShowCookies extends HttpServlet {
  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    String title = "Active Cookies";
    out.println(ServletUtilities.headWithTitle(title) +
                "<BODY BGCOLOR=\"#FDF5E6\">\n" +
                "<H1 ALIGN=\"CENTER\">" + title + "</H1>\n" +
                "<TABLE BORDER=1 ALIGN=\"CENTER\">\n" +
                "<TR BGCOLOR=\"#FFAD00\">\n" +
                "  <TH>Cookie Name\n" +
                "  <TH>Cookie Value");
    Cookie[] cookies = request.getCookies();
    Cookie cookie;
    for(int i=0; i<cookies.length; i++) {
      cookie = cookies[i];
      out.println("<TR>\n" +
                  "  <TD>" + cookie.getName() + "\n" +
                  "  <TD>" + cookie.getValue());
    }
    out.println("</TABLE></BODY></HTML>");
  }
}
```
## JSP (Java Server pages)
JSP is a Servlet with the following differences:<br>
JSP = HTML code + Java Code.<br>
WS - receives the request -- parse HTML and strip out Java --> Pass to appserver<br>
generate a java file (builds a java file + compiles) - generatea .java + .class file (work directory)<br>
JSP is loaded as a Servlet -- service the requests.<br>

### JSPExamples 
```Java
//scripting elements
<%  code goes here  %> 

//begin and end token - this refers to the service method.
//Expression tag
<%= ... %>

//declarations
<%! ... %> --treated as instance variable in a Servlet (JSP is a servlet) but these static to all requests.


//JSP Comment
<% //JSP Comment ------  %>
<!--HTML Comments-->

```

## JDBC(Java Database Connectivity)
provide java interface. connection between Dabtabase and Java.
once you have loaded the **JDBC**, 

use type 4 in assignment 6. 
