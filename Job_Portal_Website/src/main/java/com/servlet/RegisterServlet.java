package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.entity.user;
import com.dao.UserDao;
import com.DB.DBConnect;



@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet{


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		try {
			
			// Here is taken the input from the user 
			String name = req.getParameter("name");
			String qualification = req.getParameter("qualification");
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			
			UserDao dao =  new UserDao(DBConnect.getConn());
			
			user u = new user(name,email,qualification,password,"User");
			boolean f = dao.addUser(u);
			
			
			
			
			HttpSession session = req.getSession();
			
			if(f)
			{
				session.setAttribute("succMsg","Registraion Successfully");
				resp.sendRedirect("signup.jsp");
				
			}
			else
			{
				session.setAttribute("succMsg","Registraion Not Successfully");
				resp.sendRedirect("signup.jsp");
			}
			
			
			
					
			
		}catch(Exception ex)
		
		{
			ex.printStackTrace();
			
		}
		
	}
	
	

}
