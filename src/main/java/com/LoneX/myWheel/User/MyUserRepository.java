package com.LoneX.myWheel.User;


import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.security.core.userdetails.User;

public interface MyUserRepository extends CrudRepository <MyUser , Integer>{
	
	
	public MyUser findByEmail(String email);
	@Query(value="Select DISTINCT * from users where username=?1", nativeQuery=true)
	public User getSpringUser(String email);
	
	public List<MyUser> findByRol(String role);
	
	

}
