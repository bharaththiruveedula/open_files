<%@page import="java.net.URI"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="org.apache.http.client.methods.HttpGet,java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader,java.io.IOException"%>
<%@page import="org.apache.http.client.methods.HttpGet,org.apache.http.HttpResponse" %>
<%@page import="org.apache.http.impl.client.DefaultHttpClient" %>
<%@page import="org.apache.http.client.HttpClient" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="config.jsp" %>

<%
String alarm_name = request.getParameter("enode_name");
// get the input values
double val1 = 10;
double val2 = 12;
HttpResponse response1 ;
int responseCode = 0; 
String errorMsg = "";
try { 
	if(alarm_name == null){
		alarm_name = "enodeb1";
	}
	//System
	String url = "http://"+config_ip+":9090/perf?"+alarm_name;
	//String url = "http://10.138.89.70:9090/perf";
	
	HttpGet request1 = new HttpGet(url);
	HttpClient client = new DefaultHttpClient();
	// add request header
	//request.addHeader("User-Agent", USER_AGENT);
	response1 =  client.execute(request1);

	System.out.println("response is "+response1.toString());
	responseCode = response1.getStatusLine().getStatusCode();
	BufferedReader rd = new BufferedReader(new InputStreamReader(response1.getEntity().getContent()));
 
	StringBuffer result = new StringBuffer();
	String line = "";
	while ((line = rd.readLine()) != null) {
		result.append(line);
	}
	out.println(result); 
	System.out.println("result is "+result);
} catch (Exception e) {
	System.out.print(e.toString());
    errorMsg = "Non-numeric input";
}




%>

