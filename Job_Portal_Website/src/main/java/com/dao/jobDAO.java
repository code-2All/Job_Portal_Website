package com.dao;

import java.sql.Connection;




import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.ArrayList;
import  com.entity.jobs;

public class jobDAO {
	
	private Connection conn;
	 
	public jobDAO(Connection conn)
	{
		super();
		this.conn=conn;
	}
	
	public boolean addJobs(jobs j)
	{
		boolean f = false;
		
		try {
			
			String sql = "insert into jobss(title, description, category, status, location) values(?,?,?,?,?)";
			
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,j.getTitle());
			ps.setString(2,j.getDescription());
			ps.setString(3,j.getCategory());
			ps.setString(4,j.getStatus());
			ps.setString(5,j.getLocation());
		
			
			int i = ps.executeUpdate();
			
			if(i==1)
			{
				f = true;
				
			}
			
			
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return f;
	}
	
	
	public List<jobs> getAllJobs()
	{
		List<jobs> list = new ArrayList<jobs>();
		jobs j = null;
		
		try {
			
			String sql = "select * from jobss order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				j = new jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7)+"");
				
				list.add(j);
				
				
			}
			
			
			
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		
		return list;
	}
	
	public List<jobs> getAllJobsForUser()
	{
		List<jobs> list = new ArrayList<jobs>();
		jobs j = null;
		
		try {
			
			String sql = "select * from jobss where status=? order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,"Active");
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				j = new jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7)+"");
				
				list.add(j);
				
				
			}
			
			
			
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		
		return list;
	}
	public jobs getJobById(int id)
	{
	
		jobs j = null;
		
		try {
			
			String sql = "select * from jobss where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1,id);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				j = new jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7)+"");
				
			}
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		
		return j;
	}
	
	public boolean updateJob(jobs j)
	{
boolean f = false;
		
		try {
			
			String sql = "update jobss set title=?, description=?, category=?, status=?, location=?  where id=?";
			
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,j.getTitle());
			ps.setString(2,j.getDescription());
			ps.setString(3,j.getCategory());
			ps.setString(4,j.getStatus());
			ps.setString(5,j.getLocation());
			ps.setInt(6,j.getId());
		
			int i = ps.executeUpdate();
			
			if(i==1)
			{
				f = true;
				
			}
			
			
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return f;
	}
	public List<jobs> getJobsOrLocationAndCate(String category, String location)
	{
		List<jobs>  list = new ArrayList<jobs>();
		
		jobs j = null;
		
		try {
			
			String sql = "select * from jobs where category=? or location=? order by id DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,category);
			ps.setString(2,location);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				j = new jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getString(7));
				
				list.add(j);
								
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return list;
	}
	
	
	public List<jobs> getJobsAndLocationAndCate(String category, String location)
	{
		List<jobs>  list = new ArrayList<jobs>();
		
		jobs j = null;
		
		try {
			
			String sql = "select * from jobss where category=? and location=? order by id DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,category);
			ps.setString(2,location);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				j = new jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getString(7));
				
				list.add(j);
								
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return list;
	}
	
	public boolean deleteJobs(int id)
	{
		boolean f = false;
		
		try {
			String sql = "delete from jobss where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1,id);
			
			int i = ps.executeUpdate();
			
			if(i==1)
				
			{
				f = true;
			}
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return f;
		
	}
}
