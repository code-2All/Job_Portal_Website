package com.servlet;

import java.io.IOException;



import com.entity.user;
import com.dao.UserDao;
import com.DB.DBConnect;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			String em = req.getParameter("email");
			String ps = req.getParameter("password");
			
			user u = new user();
			HttpSession session = req.getSession();
			
			
			if("admin@gmail.com".equals(em) && "admin@121".equals(ps))
			{
				session.setAttribute("userobj",u);
				u.setRole("admin");
				resp.sendRedirect("admin.jsp");
				
			}else
			{
				UserDao dao = new UserDao(DBConnect.getConn());
				user us = dao.login(em,ps);
				
				if(us!=null)
				{
					session.setAttribute("userobj",us);
					resp.sendRedirect("homee.jsp");
				}else {
					session.setAttribute("succMsg","Invalid Email and password");
					resp.sendRedirect("login.jsp");
				}
			}
			
			
			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	
	

}
