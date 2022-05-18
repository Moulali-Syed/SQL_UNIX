package mysqldemos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class MysqlDemo {

	public static void main(String[] args) throws SQLException {

		// 1.create connection
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "Apple238@");

		// 2 create statement or query
		Statement stmt = conn.createStatement();
		String s = "insert into student values(103,'smith')";// insert command
		String s1 = "update student set sname='david' where sid='103'";// update
		String s2 = "delete from student where sid=103";// delete

		// 3. execute statement/query
		stmt.execute(s);

		// 4.close connection
		conn.close();

		System.out.println("Query Executed");

	}

}
/*
 * 1.create connection 2.create statement/query 3.execute statement/query
 * 4.close connection
 */