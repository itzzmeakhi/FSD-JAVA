package com.cognizant.dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;

import com.cognizant.bean.Department;

public class DepartmentDao {
       public static Connection connect() throws Exception, SQLException {
              Connection conn = null;
              Class.forName("com.mysql.jdbc.Driver");
              conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/akhil", "root", "root");

              return conn;
       }

       public int insert(Department dept) throws Exception, SQLException {
              Connection conn = connect();
              String insertQuery = "insert into department values (?,?,?)";
              PreparedStatement st = conn.prepareStatement(insertQuery);
              st.setInt(1, dept.getDeptId());
              st.setString(2, dept.getDeptName());
              st.setString(3, dept.getDeptName());
              int insertStatus = 0;
              insertStatus = st.executeUpdate();
              return insertStatus;
       }

       public int delete(int dept_id) throws Exception {
              Connection conn = connect();
              String deleteQuery = "delete from department where dept_id=" + dept_id;
              int deleteStatus = 0;
              Statement stmt = conn.createStatement();
              deleteStatus = stmt.executeUpdate(deleteQuery);
              return deleteStatus;
       }

       public int update(Department dept) throws Exception {
              Connection conn = connect();
              String updateQuery = "update department set dept_name=?,dept_start_date=? where dept_id=?";
              PreparedStatement st = conn.prepareStatement(updateQuery);
              st.setInt(3, dept.getDeptId());
              st.setString(1, dept.getDeptName());
              st.setString(2, dept.getDeptStartDate());
              int updateStatus = 0;
              updateStatus = st.executeUpdate();
              return updateStatus;
       }

       public Department read(int dept_id) throws Exception {
              Connection conn = connect();
              String readQuery = "select * from department where dept_id=" + dept_id;
              Statement stmt = conn.createStatement();
              ResultSet rs = stmt.executeQuery(readQuery);
              Department dept = new Department();
              if (rs.next()) {
                     dept.setDeptId(rs.getInt(1));
                     dept.setDeptName(rs.getString(2));
                     dept.setDeptStartDate(rs.getString(3));
              }
              return dept;
       }

       public List<Department> readAll() throws Exception {
              List<Department> deptList = new ArrayList<Department>();
              Connection conn = connect();
              String readQuery = "select * from department";
              Statement stmt = conn.createStatement();
              ResultSet rs = stmt.executeQuery(readQuery);
              while (rs.next()) {
                     Department dept = new Department();
                     dept.setDeptId(rs.getInt(1));
                     dept.setDeptName(rs.getString(2));
                     dept.setDeptStartDate(rs.getString(3));
                     deptList.add(dept);
              }
              return deptList;
       }
}






/*<jsp:useBean id="dept" class = "com.cognizant.bean.Department"></jsp:useBean>
<jsp:setProperty property="*" name="${dept}" />


<%


DepartmentDAO deptDAO = new DepartmentDAO();
int status = 0;
status = deptDAO.insert(dept);

Autoboxing the primitive(status) to integer object
 
request.


%>



<core:if test="${status==1}">
	<core:redirect url="read.jsp"></core:redirect>
</core:if>

<core:if test="${status==0}">
	<core:out value = "error while Inserting">
	
</core:if> */






/*
DepartmentDAO deptDAO = new DepartmentDAO();
List<Department> deptList = new ArrayList<Department>();
deptList = deptDAO.readALL();
request.setAttribute("depDetails",depList);






*/