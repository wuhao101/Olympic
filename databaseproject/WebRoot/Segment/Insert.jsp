<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <base href="<%=basePath%>">

        <title>Insert</title>

        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">    
        <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
        <meta http-equiv="description" content="This is my page">
        <link href="style.css" rel="stylesheet" type="text/css" media="screen" />

    </head>

    <body>
        <div class="inserttablerow">
            <div id="insertcontent1">
            <form name="insert1" method="post" action="InsertServletOne">
                <div class="post">
                    <div class="insertrow">
                        <div class="inserttablename">
                            <label for="athl_info" ><font class="titlefont">Athletes_Information</font></label>
                            <p></p>
                        </div>
                        <div class="inputcolumn">
                            <div>
                                <label for="aid" ><font class="titlefont">Athlete Id</font></label>
                            </div>
                            <div>
                                <input class="textinput" type="text" id="aid" name="aid"/>           
                            </div>
                            <div>
                                <label for="athlete_name" ><font class="titlefont">Name</font></label>
                            </div>
                            <div>
                                <input class="textinput" type="text" id="athlete_name" name="athlete_name"/>           
                            </div>
                        </div>

                        <div class="inputcolumn">
                            <div>
                                <label for="gender" ><font class="titlefont">Gender</font></label>
                            </div>
                            <div>
                                <select class="selectinput" name="gender"> 
                                    <option value="male">Male</option>
                                    <option value="femal">Female</option>
                                </select>
                            </div>
                            <div>
                                <label for="birthdate" ><font class="titlefont">BirthDate</font></label>
                            </div>
                            <div>
                                <input class="textinput" type="text" id="birthdate" name="birthdate"/>           
                            </div>
                        </div>

                        <div class="inputcolumn">
                            <div>
                                <label for="birthplace" ><font class="titlefont">Birth Place</font></label>
                            </div>
                            <div>
                                <input class="textinput" type="text" id="birthplace" name="birthplace"/>
                            </div>
                            <div>
                                <label for="country" ><font class="titlefont">Country</font></label>
                            </div>
                            <div>
                                <input class="textinput" type="text" name="icountry" id = "icountry" width="20px">         
                            </div>       
                        </div>

                        <div class="inputcolumn">
                            <div>
                                <label for="sport" ><font class="titlefont">Sport</font></label>
                            </div>
                            <div>
                                <input class="textinput" type="text" name="sport" id ="sport">    
                            </div>   
                        </div>
                    </div>
                </div>
                

                <div class="submit">
                    <input class="button" type="submit" value="Submit"/>
                </div>
                </form>
            </div>
        </div>
        <div class="padblank"></div>
        <div class="inserttablerow">
            <div id="insertcontent2">
            <form name="insert2" method="post" action="InsertServletTwo">
                <div class="post">
                    <div class="insertrow">
                        <div class="inserttablename">
                            <label for="athl_reco" ><font class="titlefont">Athletes_Record</font></label>
                            <p></p>
                        </div>
                        <div class="inputcolumn">
                            <div>
                                <label for="aid" ><font class="titlefont">Athlete Id</font></label>
                            </div>
                            <div>
                                <input class="textinput" type="text" id="aid" name="aid"/>           
                            </div>
                            <div>
                                <label for="rid" ><font class="titlefont">Record Id</font></label>
                            </div>
                            <div>
                                <input class="textinput" type="text" id="rid" name="rid"/>           
                            </div>
                            <div>
                                <label for="country" ><font class="titlefont">Country</font></label>
                            </div>
                            <div>
                                <input class="textinput" type="text" id="icountry" name="icountry"/>              
                            </div>
                        </div>
                        
                        <div class="inputcolumn">
                            <div>
                                <label for="sport" ><font class="titlefont">Sport</font></label>
                            </div>
                            <div>
                                <input class="textinput" type="text" name="sport"> </select>     
                            </div> 
                            <div>
                                <label for="year" ><font class="titlefont">Year</font></label>
                            </div>
                            <div>
                                <input class="textinput" type="text" id="year" name="year"/>           
                            </div>
                            <div>
                                <label for="rank" ><font class="titlefont">Rank</font></label>
                            </div>
                            <div>
                                <input class="textinput" type="text" id="rank" name="rank"/>           
                            </div>
                        </div>
                        
                        <div class="inputcolumn">
                            <div>
                                <label for="athlete_name" ><font class="titlefont">Name</font></label>
                            </div>
                            <div>
                                <input class="textinput" type="text" id="athlete_name" name="athlete_name"/>           
                            </div> 
                            <div>
                                <label for="event" ><font class="titlefont">Event</font></label>
                            </div>
                            <div>
                                <input class="textinput" type="text" id="event" name="event"/>  
                            </div> 
                        </div>
                        
                        <div class="inputcolumn">
                            <div>
                                <label for="summer_winter" ><font class="titlefont">Summer_Winter</font></label>
                            </div>
                            <div>
                                <input class="textinput" type="text" id="summer_winter" name="summer_winter"/>
                            </div>
                            <div>
                                <label for="iage" ><font class="titlefont">Age</font></label>
                            </div>
                            <div>
                                <input class="textinput" type="text" id="iage" name="iage"/>  
                            </div>
                            <div>
                                <label for="medal" ><font class="titlefont">Medal</font></label>
                            </div>
                            <div>
                                <select class="selectinput" name="medal"> 
                                    <option value="gold">Gold</option>
                                    <option value="silver">Silver</option>
                                    <option value="bronze">Bronze</option>
                                </select> 
                            </div>     
                        </div>
                    </div>
                </div>

                <div class="submit">
                    <input class="button" type="submit" value="Submit"/>
                </div>
                
                </form>
            </div>
        </div>
        <div class="padblank"></div>
        <div class="inserttablerow">
            <div id="insertcontent3">
            <form name="insert3" method="post" action="InsertServletThree">
                <div class="post">
                    <div class="insertrow">
                        <div class="inserttablename">
                            <label for="country_code" ><font class="titlefont">Country_Code</font></label>
                            <p></p>
                        </div>
                        <div class="inputcolumn">
                            <div>
                                <label for="icountry" ><font class="titlefont">Country</font></label>
                            </div>
                            <div>
                                <input class="textinput" type="text" id="icountry" name="icountry"/>           
                            </div>
                            
                        </div>
                        
                        <div class="inputcolumn">
                            <div>
                                <label for="code" ><font class="titlefont">Code</font></label>
                            </div>
                            <div>
                                <input class="textinput" type="text" id="code" name="code"/>     
                            </div> 
                            
                        </div>
                        

                    </div>
                </div>

                <div class="submit">
                    <input class="button" type="submit" value="Submit"/>
                </div>
                </form>
            </div>
        </div>
        <div class="padblank"></div>
        <div class="inserttablerow">
            <div id="insertcontent4">
            <form name="insert4" method="post" action="InsertServletFour">
                <div class="post">
                    <div class="insertrow">
                        <div class="inserttablename">
                            <label for="Sports_Events" ><font class="titlefont">Sports_Events</font></label>
                            <p></p>
                        </div>
                        <div class="inputcolumn">
                            <div>
                                <label for="sport" ><font class="titlefont">Sport</font></label>
                            </div>
                            <div>
                                <input class="textinput" type="text" id="sport" name="sport"/>           
                            </div>
                            
                        </div>
                        
                        <div class="inputcolumn">
                            <div>
                                <label for="event" ><font class="titlefont">Event</font></label>
                            </div>
                            <div>
                                <input class="textinput" type="text" id="event" name="event"/>     
                            </div> 
                            
                        </div>
                        

                    </div>
                </div>

                <div class="submit">
                    <input class="button" type="submit" value="Submit"/>
                </div>
                </form>
            </div>
        </div>
        <div class="padblank"></div>
        <div class="inserttablerow">
            <div id="insertcontent5">
            <form name="insert5" method="post" action="InsertServletFive">
                <div class="post">
                    <div class="insertrow">
                        <div class="inserttablename">
                            <label for="Years_Cities" ><font class="titlefont">Years_Cities</font></label>
                            <p></p>
                        </div>
                        <div class="inputcolumn">
                            <div>
                                <label for="year" ><font class="titlefont">Year</font></label>
                            </div>
                            <div>
                                <input class="textinput" type="text" id="year" name="year"/>           
                            </div>
                            
                        </div>
                        
                        <div class="inputcolumn">
                            <div>
                                <label for="city" ><font class="titlefont">City</font></label>
                            </div>
                            <div>
                                <input class="textinput" type="text" id="city" name="city"/>     
                            </div> 
                            
                        </div>
                        
                        <div class="inputcolumn">
                            <div>
                                <label for="summer_winter" ><font class="titlefont">Summer_Winter</font></label>
                            </div>
                            <div>
                                <input class="textinput" type="text" id="summer_winter" name="summer_winter"/>     
                            </div> 
                            
                        </div>
                        

                    </div>
                </div>

                <div class="submit">
                    <input class="button" type="submit" value="Submit"/>
                </div>
                </form>
            </div>
        </div>
        
    </body>
</html>
