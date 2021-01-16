package com.LoneX.myWheel.Controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.provisioning.UserDetailsManager;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.LoneX.myWheel.FeedBack.FeedBack;
import com.LoneX.myWheel.FeedBack.FeedBackService;
import com.LoneX.myWheel.Filters.XenoLCryptor;
import com.LoneX.myWheel.Mail.MailService;
import com.LoneX.myWheel.Reservation.Reservation;
import com.LoneX.myWheel.Reservation.ReservationService;
import com.LoneX.myWheel.User.MyUser;
import com.LoneX.myWheel.User.MyUserService;
import com.LoneX.myWheel.Vehicule.Vehicule;
import com.LoneX.myWheel.Vehicule.VehiculeService;

@RestController
@SessionAttributes("reservation")
public class ClientController {
	
	@Autowired
	MyUserService myUserService;
	@Autowired
	UserDetailsManager userDetailsManager;
	@Autowired
	MyUserService userService;
	@Autowired
	MailService mailService;

	@Autowired
	VehiculeService vehiculeService;
	
	@Autowired
	ReservationService reservationService;
	
	@Autowired
	HttpServletRequest request;
 
	@Autowired
	FeedBackService feedService;
	
	
	@RequestMapping(value="/contact",method=RequestMethod.POST)
	public ModelAndView envoyerFeedBack(@ModelAttribute("feed") FeedBack feed ,BindingResult bind){
		ModelAndView model = new ModelAndView("contact");
		
		
		 Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			String currentUserEmail = authentication.getName();
			
			feed.setEmail(currentUserEmail);
			feed.setSeen(false);
			
		feedService.addFeed(feed);
		model.addObject("success", true );
		
		return model;
		
	}
	
	@RequestMapping("/editProfile")
	
	public ModelAndView modifier() {
		ModelAndView model=new ModelAndView("editProfile");
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String currentUserName = authentication.getName();
		MyUser currentUser= userService.getMyUser( currentUserName );
		
		model.addObject("user" , currentUser);
	
		return model;
	}
	
@RequestMapping(value="/editProfile", method=RequestMethod.POST)
	
	public ModelAndView modifier(@ModelAttribute("user") MyUser myUser) {
		ModelAndView model=new ModelAndView();
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String currentUserName = authentication.getName();
		
		myUser.setId( userService.getMyUser( currentUserName ).getId() );

		
		
		userService.updateUser( myUser );
		
		return model;
	}
	
		@ModelAttribute("reservation")
		public Reservation getReservation() {
		
				return new Reservation();
			
		}
		
	
	 
	@RequestMapping("/single/{idVehicule}")
	public ModelAndView infos(@PathVariable ("idVehicule") int idVehicule ,String dateD , String dateR ,String timeD , String timeR ,String type) {
		
		
		
		ModelAndView model=new ModelAndView("single");
		
		HttpSession session=request.getSession();
		Reservation reservation=this.getReservation();
		reservation.setType(type);
		session.setAttribute("reservation",reservation);
		
		Date dateDeb;
		Date dateRet;
		Date timeDeb;
		Date timeRet;
		try {
			if(!dateR.equals(""))
			{
			dateRet=new SimpleDateFormat("yyyy-MM-dd").parse(dateR);
			reservation.setDateR(dateRet);
			}
			if(   !(  timeD.equals("") && timeR.equals("") )  ) {
			timeDeb = new SimpleDateFormat("hh:mm").parse(timeD);
			timeRet=new SimpleDateFormat("hh:mm").parse(timeR);
			reservation.setTimeD(timeDeb);
			reservation.setTimeR(timeRet);
			}
			
			
			dateDeb = new SimpleDateFormat("yyyy-MM-dd").parse(dateD);
			reservation.setDateD(dateDeb);
			;
		
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return new ModelAndView("Single" , "errorMsg" , true );
		}
		System.out.println("--------------Single--------------");
		System.out.println("dateD : "+ reservation.getDateD());
		System.out.println("dateR : "+ reservation.getDateR());
		System.out.println("timeD : "+ reservation.getDateD());
		System.out.println("timeR : "+ reservation.getDateR());
		
		session.setAttribute("reservation" , reservation);
		
		Vehicule vehicule = vehiculeService.getVehicule(idVehicule);
		List<Vehicule> allVehicules=vehiculeService.getAllVehicules();
		Random random=new Random();
		
		
		List<Vehicule> randomVehicules=new ArrayList<Vehicule>();
		
		int rand=random.nextInt(allVehicules.size());
		 randomVehicules.add(allVehicules.get(rand));
		 rand=random.nextInt(allVehicules.size());
		 randomVehicules.add(allVehicules.get(rand));
		 rand=random.nextInt(allVehicules.size());
		 randomVehicules.add(allVehicules.get(rand));
		 
		model.addObject("vehicule" , vehicule);
		model.addObject("reservation" , reservation);
		model.addObject("randomVehicules",randomVehicules);
		
		return model;
	}
	
	@RequestMapping(value="/single/{idVehicule}/reserver" , method=RequestMethod.POST)
	public ModelAndView Reserver(@PathVariable("idVehicule") int idVehicule , Reservation reservation) {
		
		ModelAndView model = new ModelAndView("redirect:/checkout/success");
		
		Vehicule vehicule = vehiculeService.getVehicule(idVehicule);
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String currentUserName = authentication.getName();
		
		MyUser user= myUserService.getMyUser( currentUserName );
		
		System.out.println("------------Reservation Info------------");
		System.out.println("user : "+ user.getEmail());
		System.out.println("vehicule : "+ vehicule.getModel());
		System.out.println("dateD : "+ reservation.getDateD());
		System.out.println("dateR : "+ reservation.getDateR());
		System.out.println("timeD : "+ reservation.getTimeD());
		System.out.println("type : "+ reservation.getType());
        
		List<Reservation> reservations=reservationService.getALLReservations();
		for(Reservation res:reservations)
		{
			Date dateD=reservation.getDateD();
			Date dateR=reservation.getDateR();
			Date timeD=reservation.getTimeD();
			Date timeR=reservation.getTimeR();
			if(reservation.getType().equals("byDay"))
			{
		 if(res.getDateD().equals(dateD) && res.getDateR().equals(dateR) && reservation.getState().equals("en Attente"))
			return new ModelAndView("redirect:/checkout","error",true);
			}
			if(reservation.getType().equals("byHour"))
				if(( res.getTimeD().equals(timeD) && res.getTimeR().equals(timeR) ))
					return new ModelAndView("redirect:/checkout","error",true);
					
			
		}
		
		model.addObject("success" , true );
		
		reservation.setUser(user);
		reservation.setVehicule(vehicule);
		
		reservationService.reserver(reservation);
		
		return model;
	}
	@RequestMapping("/checkout")
	public ModelAndView consulterReservation(boolean error) {
		
		ModelAndView model=new ModelAndView ("checkout");
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String currentUserName = authentication.getName();
		
		MyUser user= myUserService.getMyUser( currentUserName );
		
		List<Reservation> cart=reservationService.getUserReservations(user.getId());
		
		System.out.println("user : "+ user.getEmail());
		System.out.println("numReservation : "+ cart.size());
		
		List<Vehicule> vehicules=new ArrayList<Vehicule>();
		//getting vehicules by id from reservations
		for(Reservation reservation: cart) {
			vehicules.add( vehiculeService.getVehicule( reservation.getVehicule().getIdVehicule() ) );
		}
		
		model.addObject("numVehicules" , vehicules.size());
		model.addObject("vPage" , vehicules );
		model.addObject("cart" , cart);
		model.addObject("numReservation" , cart.size());
		model.addObject("error" , error);
		
		
		return model;
	}
	
	
	@RequestMapping("/checkout/success")
	public ModelAndView checkoutPageSuccess() {
		
		ModelAndView model=new ModelAndView ("checkout");
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String currentUserName = authentication.getName();
		
		MyUser user= myUserService.getMyUser( currentUserName );
		System.out.println("user Id : "+user.getId());
		List<Reservation> cart=reservationService.getUserReservations(user.getId());
		
		System.out.println("user : "+ user.getEmail());
		System.out.println("numReservation : "+ cart.size());
		
		List<Vehicule> vehicules=new ArrayList<Vehicule>();
		//getting vehicules by id from reservations
		for(Reservation reservation: cart) {
			vehicules.add( vehiculeService.getVehicule( reservation.getVehicule().getIdVehicule() ) );
		}
		
		model.addObject("numVehicules" , vehicules.size());
		model.addObject("vPage" , vehicules );
		model.addObject("cart" , cart);
		model.addObject("numReservation" , cart.size());
		model.addObject("success" , true );
		
		return model;
	}
	
	
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView seConnecter( String error, String logout) {
		
		ModelAndView model=new ModelAndView("login" ,"userF", new MyUser());
	
		
		
        if (error != null)
        {
            model.addObject("errorMsg", error);
            
        }
    
        if (logout != null)
        {
        	if(logout.equals(""))
            model.addObject("msg", "Au revoire !");
        	else
        	model.addObject("msg", logout);
        }
        
        return model;
    }
	
	
	@RequestMapping(value="/forgot-password" , method=RequestMethod.POST)
	public ModelAndView reinitialiser(@ModelAttribute MyUser userF , BindingResult bind) {
		

		
		 MyUser user=userService.getMyUser(userF.getEmail());
		
		 if(user==null)
			return new ModelAndView("redirect:/login" , "error" , "mot de pass non renouvelé");
		
		double newPassword= XenoLCryptor.cryptThis(user.getId());
		
		String addrs="Chère Mr/Mm. "+user.getName()+",\n \n"
				+ "Voici votre nouveau mot de passe :\n \n"
				+ newPassword +"\n \n"
				+ "pensez a le changer. ";
		
		try {		
		mailService.sendEmail(user.getEmail(), "Renouvelement Mot de passe" , addrs);
		
		}catch(Exception e){
			if (user!=null)
			userService.removeMyUser(user.getEmail());
			
			e.printStackTrace();
			return new ModelAndView("redirect:/login" , "error" , "mot de pass non renouvelé");
			
		}
		
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		authorities.add(new SimpleGrantedAuthority(user.getRol()));
		user.setPass(""+newPassword);
		
		User springUser = new User(user.getEmail() , user.getPass() , authorities);
		
		userDetailsManager.updateUser(springUser);
		
		userService.updateUser(user);
		
		return new ModelAndView("redirect:/login" ,"logout", "Vous avez reçu un nouveau mot de pass par email!");
		
	}
	
	
	

}
