package com.LoneX.myWheel.Controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.LoneX.myWheel.FeedBack.FeedBack;
import com.LoneX.myWheel.FeedBack.FeedBackService;
import com.LoneX.myWheel.Reservation.Reservation;
import com.LoneX.myWheel.Reservation.ReservationService;
import com.LoneX.myWheel.User.MyUser;
import com.LoneX.myWheel.User.MyUserService;
import com.LoneX.myWheel.Vehicule.Vehicule;
import com.LoneX.myWheel.Vehicule.VehiculeService;

@Controller
public class AdminController {
	
	


	@Autowired
	MyUserService userService;
	
	@Autowired
	JdbcUserDetailsManager userDetailsManager;
	
	 
		@Autowired
		VehiculeService vehiculeService;
		@Autowired
		MyUserService myUserService;
		@Autowired
		ReservationService reservationService;
		@Autowired
		FeedBackService feedService;
			 
		
	
	
	
	
	@RequestMapping("/BO/registerAgent")
	public ModelAndView ajouterAgent() {
		
		return new ModelAndView("BOAddAgent","user",new MyUser());
	}
	
	@RequestMapping(value="/BO/registerAgent",method=RequestMethod.POST)
	public ModelAndView ajouterAgent(@ModelAttribute("user") MyUser myUser , RedirectAttributes redirectAttributes ) {
		String emailVerification=myUser.getEmail();
		
		if( userService.getMyUser(emailVerification) != null )
			return new ModelAndView("BOAddAgent" , "msg" , "Email existe deja !");
		
		
		userService.addMyUser(myUser);
		
		
		 List<MyUser> userList=userService.getAllMyUsers();
			for(MyUser user2 : userList) {
				System.out.println("userFound! name: "+user2.getName());
			}
			
		
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		authorities.add(new SimpleGrantedAuthority("ROLE_AGENT"));
	
		
		User user = new User(myUser.getEmail() , myUser.getPass() , authorities);
		userDetailsManager.createUser(user);
		
		
		ModelAndView model=new ModelAndView("BOAddAgent");
		
		model.addObject("msg" , "Agent ajouté avec succès!");
		
		return model;
	}
	
	
	
	
	
@RequestMapping(value="/BO/removeAgent" , method=RequestMethod.GET)
public ModelAndView supprimerAgent() {
	
	 ModelAndView model= new ModelAndView("BORemoveAgent" ,"user" , new MyUser());
	 
	 
	 return model;
}


@RequestMapping(value="/BO/removeAgent" , method=RequestMethod.POST)
public ModelAndView supprimerAgent(@ModelAttribute("user") MyUser user) {
	
	 ModelAndView model= new ModelAndView("BORemoveAgent");
	
	 
	 if(userService.getMyUser(user.getEmail()) == null)
		 return new ModelAndView("BORemoveAgent","msgError" ,"Utilisateur introuvable!");
		 
     if(! (userService.getMyUser(user.getEmail()).getRol().equals("ROLE_AGENT")))
			 return new ModelAndView("BORemoveAgent","msgError" ,"l'utilisateur n'est pas un Agent");
	 
     userDetailsManager.deleteUser(user.getEmail());
     
	 userService.removeMyUser(user.getEmail());
	
	
	 model.addObject("msg" , "Agent Supprimé avec succès !");
	 
	 
	 return model;
}


@RequestMapping(value="/BO/blockAgent", method=RequestMethod.GET)
public ModelAndView bloquerAgent() {
	
	ModelAndView model=new ModelAndView ("BOBlockAgent");

	
	List<MyUser> users=new ArrayList<MyUser>();
	userService.getAllMyUsers().forEach(users::add);



	
	model.addObject("users" , users);
	model.addObject("numUsers", users.size());
	
	return model;
}
	
	@RequestMapping("/BO/editVehicule")
	public ModelAndView modifierPrix( ) {
		
		 ModelAndView model= new ModelAndView("BOEditVehicule");
			
		 model.addObject("vehicule" , new Vehicule());
		 return model;
	}
	
	@RequestMapping(value="/BO/editVehicule",method=RequestMethod.POST)
	public ModelAndView modifierPrix(@ModelAttribute("vehicule") Vehicule vehicule ) {
		
		 ModelAndView model= new ModelAndView("BOEditVehicule");
		 String marqueVeh=vehicule.getMarque();
		 String modelVeh=vehicule.getModel();
		 
		List<Vehicule> vehiculesToUpdate = vehiculeService.findByMarqueAndModel(marqueVeh , modelVeh);
		 
			for(Vehicule v : vehiculesToUpdate)
			{
				if(vehicule.getPlh() != 0.0)
					v.setPlh(vehicule.getPlh());
				if(vehicule.getPlj() != 0.0)
					v.setPlj(vehicule.getPlj());
				
					
				vehiculeService.updateVehicule(v);
				
			}
			
			model.addObject("success" , true);
		 return model;
	}
	
	
	@RequestMapping("/BO/stats")
	public ModelAndView consulterStatistiques() {
		ModelAndView model=new ModelAndView("BOStats");
		
		List<FeedBack> feeds= feedService.getAllFeed();
		List<Reservation> reservations= reservationService.getALLReservations();
		List<MyUser> clients= myUserService.getUsersByRole("ROLE_CLIENT");
		
		model.addObject("numFeed",feeds.size());
		model.addObject("numReservation",reservations.size());
		model.addObject("numClient",clients.size());
		
		return model;
		
	}

}
