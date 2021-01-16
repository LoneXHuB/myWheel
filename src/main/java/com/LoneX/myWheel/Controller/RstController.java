package com.LoneX.myWheel.Controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.LoneX.myWheel.Depot.Depot;
import com.LoneX.myWheel.Depot.DepotService;
import com.LoneX.myWheel.FeedBack.FeedBack;
import com.LoneX.myWheel.FeedBack.FeedBackService;
import com.LoneX.myWheel.Reservation.Reservation;
import com.LoneX.myWheel.Reservation.ReservationService;
import com.LoneX.myWheel.User.MyUser;
import com.LoneX.myWheel.User.MyUserService;
import com.LoneX.myWheel.Vehicule.Vehicule;
import com.LoneX.myWheel.Vehicule.VehiculeService;

@RestController
public class RstController {
	
	@Autowired
	VehiculeService vehiculeService;
	@Autowired
	ReservationService reservationService;
	@Autowired
	DepotService depotService;
	@Autowired
	MyUserService userService;
	@Autowired
	JdbcUserDetailsManager userDetailsManager;
	@Autowired
	FeedBackService feedService;
	
	@RequestMapping("/shop/getMarqueList")
    public List<String> getMarqueList(String category)
    {
    	List<String> list = vehiculeService.getMarquesByCategory( category );
    	
        return list;
    }
	
	@RequestMapping("/shop/getModelList")
    public List<String> getModelList(String marque , String category)
    {
    	List<String> list = vehiculeService.getModelsByMarque( marque ,category);
    	
        return list;
    }
	@RequestMapping("/cart/remove")
    public boolean removeReservation(int id)
    {
		System.out.println("sent resId : " + id);

		try {
			if(reservationService.getReservation(id).getState().equals("en Attente"))
			{
				reservationService.removeReservation(id);
    	     return true;
			 }     
    	     else
    	    	 return false;
			
		    }
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		
    	
    }

	@RequestMapping("/cart/returnVehicule")
    public boolean returnReservation(int id, double newKm)
    {
		System.out.println("returned resId : " + id);

		try {
			if(reservationService.getReservation(id).getState().equals("Confirmé"))
			{
				Reservation reservation=reservationService.getReservation(id);
				reservation.getVehicule().setKm(newKm);
				
				vehiculeService.updateVehicule(reservation.getVehicule());
				
				reservation.setState("Rendue");
				reservationService.updateReservation(reservation);
    	     return true;
			 }     
    	     else
    	    	 return false;
			
		    }
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		
    	
    }
	
	
	@RequestMapping("/BO/blockUser")
    public boolean blockUser(int id)
    {
		System.out.println("sent resId : " + id);

		try {
			if(userService.getUser(id).isEnabled())
			{
				MyUser user=userService.getUser(id);
				user.setEnabled(false);
				

				List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
				authorities.add(new SimpleGrantedAuthority(user.getRol()));
				
				
				User springUser = new User(user.getEmail() , user.getPass() , false , true , true , true, authorities);
		
				userDetailsManager.updateUser(springUser);
				
				userService.updateUser(user);
    	     return true;
			 }     
    	     else
    	    	 return false;
			
		    }
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		
    	
    }
	
	@RequestMapping("/BO/unblockUser")
    public boolean unblockUser(int id)
    {
		System.out.println("sent resId : " + id);

		try {
			if(! userService.getUser(id).isEnabled())
			{
				MyUser user=userService.getUser(id);
				user.setEnabled(true);

				List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
				authorities.add(new SimpleGrantedAuthority(user.getRol()));
				
				User springUser = new User(user.getEmail() , user.getPass() , true , true , true , true, authorities);

				userDetailsManager.updateUser(springUser);
				
				userService.updateUser(user);
    	     return true;
			 }     
    	     else
    	    	 return false;
			
		    }
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		
    	
    }
	
	@RequestMapping("/shop/getCategoryList")
	public List<String> categoryList(){
		return vehiculeService.getAllCategories();
	}
	
	
	
	@RequestMapping("/BO/getDepotList")
	public List<String> depotList(){
		return depotService.getAllDepots();
	}
	
	@RequestMapping("/BO/getDepots")
	public List<Depot> depots(){
		return depotService.getAll();
		
	}
	
	@RequestMapping("/BO/getFeedList")
	public List<FeedBack> feedList(){
		List<FeedBack> feeds =feedService.getAllFeed();
		for (FeedBack f : feeds)
			{
			f.setSeen(true);
			feedService.addFeed(f);
			}
		
		
		return feeds;
	}
	
	@RequestMapping("/BO/getResList")
	public List<Reservation> resList(String today){
		
		Date date = null;

		try {
			date = new SimpleDateFormat("yyyy-MM-dd").parse(today);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		List<Reservation> reservations =reservationService.getReservationByDate(date);
		
		
		
		return reservations;
	}
	
	@RequestMapping("/BO/getResYearList")
	public int[] resYearList(){
		int[] values=new int[12]; 
		
		for(int month=0;month<=11;month++) {
			
			@SuppressWarnings("deprecation")
			Date Month = new Date(0000, month , 00);
			List<Reservation> reservations =reservationService.getAllReservationMonth(Month);
			
			values[month]= reservations.size();
			
		}
		

		
		
		return values;
	}
	
	@RequestMapping("/BO/getVehiculeList")
	public List<Vehicule> vehiculeList(String selected){
		System.out.println("listSize :" + vehiculeService.getVehiculesByDepot(selected).size());
		return vehiculeService.getVehiculesByDepot(selected);
		
			
	}
	
	@RequestMapping("/BO/getAllVehicules")
	public List<Vehicule> vehiculeList(){
		
	return vehiculeService.getAllVehicules();
	
	}
	
	
}
