package com.servlet;

import java.io.IOException;

import  com.entity.jobs;
import com.DB.DBConnect;
import  com.dao.jobDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/post_job")
public class AddPostServer extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String title = req.getParameter("title");
			String location = req.getParameter("location");
			String category = req.getParameter("category");
			String status = req.getParameter("status");
			String desc = req.getParameter("desc");
			
			jobs j = new jobs();
			j.setTitle(title);
			j.setDescription(desc);
			j.setLocation(location);
			j.setStatus(status);
			j.setCategory(category);
			
			
			HttpSession session = req.getSession();
			
			jobDAO dao = new jobDAO(DBConnect.getConn());
			boolean f = dao.addJobs(j);
			if(f)
			{
				session.setAttribute("succMsg", "Job post Successfully");
				resp.sendRedirect("post_job.jsp");
				
			}else {
				session.setAttribute("succMsg", "Something Wrong Answer!");
				resp.sendRedirect("post_job.jsp");
			}
			
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}

		
		
	}
	

}
