package org.ourapp.udada.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class SqlSessionTest {
	
	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	
	@Autowired
	private DataSource dataSource;

	
	  @Test 
	  public void sqlSessionTest() throws SQLException {
		  
		  
	  try{ 
		  SqlSession session = sqlSessionFactory.openSession(); 
		  Connection con = dataSource.getConnection(); 
		  log.info("\n connection : "+con);
		  log.info("\n SqlSession : "+session);
		  con.close();
		  session.close();
	  
	  }catch(Exception e) { fail(e.getMessage());
	  
	  } 
	  }
}
