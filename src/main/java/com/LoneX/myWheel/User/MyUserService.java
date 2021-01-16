package com.LoneX.myWheel.User;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;



@Service
public class MyUserService {
	
	@Autowired
	MyUserRepository MyUserRepository;
	public MyUser getUser(int id) {
		return MyUserRepository.findOne(id);
	}
	
	public MyUser getMyUser(String email) {
		return MyUserRepository.findByEmail(email);
	}
	
	public List<MyUser> getAllMyUsers(){
		
		List<MyUser> MyUserList=new ArrayList<MyUser>();
		MyUserRepository.findAll().forEach(MyUserList::add);;
	    return MyUserList;
	}
	
	public void addMyUser(MyUser MyUser) {
		MyUserRepository.save(MyUser);
	}
	
	public void removeMyUser(String email) {
		int id = MyUserRepository.findByEmail(email).getId();
	  
		MyUserRepository.delete(id);
	}
	public void updateUser( MyUser user) {
		MyUserRepository.save(user);
	}
	
	public User getSpringUser(String email) {
		return MyUserRepository.getSpringUser(email);
	}

	public List<MyUser> getUsersByRole(String role) {
		// TODO Auto-generated method stub
		return MyUserRepository.findByRol(role);
	}
}
	
