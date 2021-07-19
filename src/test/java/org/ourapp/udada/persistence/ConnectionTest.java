package org.ourapp.udada.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class ConnectionTest {
	
	@Test
	public void connectionTest() {
		
		for(int i=0;i<1000;i++) {
			try (Connection con = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe",
					"udada_dev",
					"udada_dev"
					);){
				
			log.info("con "+i +" : " + con);
			con.close();
			}catch(Exception e) {
				fail(e.getMessage());
			}finally {
				
			}
			
		}
		

	}

}
