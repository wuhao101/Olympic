var xmlHttp;
function getXmlHttpRequest(){
	// Firefox, Opera 8.0+, Safari
	if(window.XMLHttpRequest) 
		return new XMLHttpRequest();
	//IE
	if(window.ActiveXObject){
		try{
			return new ActiveXObject("Msxml2.XMLHTTP");
		}catch(e){
			try{
				return(new ActiveXObject("Microsoft.XMLHTTP"));
			}catch(e){
				return null;
			}
		}
	}
}

function createQueryString(){
	var username = document.getElementById("usernameinput").value;
	var password = document.getElementById("passwordinput").value;
	var queryString = "username="+username+"&password="+password;
	return queryString;
}

function doRequest(){
	xmlHttp = getXmlHttpRequest();
	var queryString = "LoginServlet?"+createQueryString();
	xmlHttp.onreadystatechange = handleStateChange;
	xmlHttp.open("POST",queryString,true);
	xmlHttp.send(null);
}
function handleStateChange(){
	if(xmlHttp.readyState == 4){
		if(xmlHttp.status == 200){
			document.getElementById("login").innerHTML="<div class=\"loginrow\">" +
					"<font class=\"titlefont\">Administrator Login</font>" +
					"</div>" +
					"<div class=\"loginrow\">" +
					"<div>" +
					"<label for=\"username\" ><font class=\"contentfont\">Username</font></label>" +
					"</div>" +
					"<div>" +
					"<font class=\"contentfont\">username</font>           " +
					"</div>" +
					"<div>" +
					"<label for=\"privilege\" ><font class=\"contentfont\">Privilege</font></label>" +
					"</div>" +
					"<div>" +
					"<font class=\"contentfont\">privilege</font>           " +
					"</div>" +
					"</div>" +
					"<div class=\"loginrow\">" +
					"<input class=\"button\" type=\"submit\" value=\"Login\" onclick=\"javascript:void(0);\" />" +
					"</div>";
		}
	}
}