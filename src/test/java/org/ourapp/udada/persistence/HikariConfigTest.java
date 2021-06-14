package org.ourapp.udada.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class HikariConfigTest {
	
	@Autowired
	private DataSource dataSource;
	
	@Test
	public void dsConnectionTest() throws SQLException {

		try {
			Connection con = dataSource.getConnection();
			log.info("\nconnection : " + con);
		} catch (Exception e) {
			fail(e.getMessage());
		}

	}
	
}
