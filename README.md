# Web-Development

*Lecture note from May 9th* https://fhda-edu.zoom.us/rec/play/PTdnbMuYci8my9CDdqyHDXlUt3mpbYtyOB2hUUK7zvAQ8Mxcyo51bOpwidW_JtCdCrdC4o8qdkKL1s4.a_o31hlRDosImSrM?continueMode=true&_x_zm_rtaid=KGPhdqD8RomStFwZGh3Y8w.1654976162836.fea5656985d55f31a9234595e2e13b5c&_x_zm_rhtaid=973<br>
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
> header - browser information<br>
> body - 

#### POST Request (Write information)
**Browser**
> header - browser information<br>
> body - Request Data, and Value/Name pairs.


### Servlet 
> 1. Load Servlet Calss
> 2. Create Servlet Instance
> 3. Call the *init()* method
> 4. Call the *service()* method
> 5. Call the *destory()* method

## JDBC(Java Database Connectivity)
provide java interface. connection between Dabtabase and Java.
once you have loaded the **JDBC**, 

use type 4 in assignment 6. 
