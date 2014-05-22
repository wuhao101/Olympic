package Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet{
	
	public LoginServlet() {
		super();
	}

	
	public void destroy() {
		super.destroy(); 
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {	
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		
		if (request.getParameter("usernameinput") != null && request.getParameter("passwordinput") != null) { 
			String Name = request.getParameter("usernameinput");
			String Password = request.getParameter("passwordinput");
			
			if (Name.equals("mike") && Password.equals("1234")) { 
				session.setAttribute("username", "mike");
				session.setAttribute("privilege", "12");
				response.sendRedirect("SuccessLogin.jsp");
				out.print("welcome "+Name);
			} else { 
				out.print("Error"); 
			} 
		}
	}

}
