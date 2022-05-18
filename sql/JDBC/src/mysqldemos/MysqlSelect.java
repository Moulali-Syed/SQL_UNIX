package mysqldemos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MysqlSelect {

	public static void main(String[] args) throws SQLException {

		// 1.create connection
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "Apple238@");

		// 2 create statement or query
		Statement stmt = conn.createStatement();
		String s = "select employee_id , first_name ,last_name from employees";// insert command

		// 3.Store data in resultset and 4. execute statement/query
		ResultSet rs = stmt.executeQuery(s);
		while (rs.next()) {
			int eid = rs.getInt("EMPLOYEE_ID");
			String fname = rs.getString("first_name");
			String lname = rs.getString("last_name");

			System.out.println(eid + "  " + fname + "  " + "  " + lname);
		}

		// 5.close connection
		conn.close();

		System.out.println("Query Executed");

	}

}

/*
 * 
 * 
 * for select 1.create connection 2.create statement/query 3.execute
 * statement/query 4.store results in result set 5.close connection
 */