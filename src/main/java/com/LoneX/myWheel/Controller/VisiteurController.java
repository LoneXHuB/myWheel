package com.LoneX.myWheel.Controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.LoneX.myWheel.Filters.Filter;
import com.LoneX.myWheel.Filters.XenoLCryptor;
import com.LoneX.myWheel.Mail.MailService;
import com.LoneX.myWheel.User.MyUser;
import com.LoneX.myWheel.User.MyUserService;
import com.LoneX.myWheel.Vehicule.Vehicule;
import com.LoneX.myWheel.Vehicule.VehiculeService;

@Controller
@SessionAttributes("filter ,marqueList ,listCategory")
public class VisiteurController {
	
	@Autowired
	MyUserService userService;
	@Autowired
	JdbcUserDetailsManager userDetailsManager;
	@Autowired
	MailService mailService;
	@Autowired
	VehiculeService vehiculeService;
	@Autowired
	HttpServletRequest request;
	
	@ModelAttribute("filter")
	public Filter getFilter() {
		return new Filter();
	}
		

	@RequestMapping("/shop")
	 public ModelAndView rechercher() {
			
			ModelAndView model=new ModelAndView("redirect:/shop/0");
			
			HttpSession session=request.getSession();
			
			
			session.setAttribute("filter", this.getFilter());
	
			return model;
			
		}

	@RequestMapping("/shop/{pageId}")
    public ModelAndView Rechercher(@PathVariable ("pageId") int pageId) {
		
		ModelAndView model=new ModelAndView("filter");
	     
		 Page<Vehicule> vPage = vehiculeService.getVehiculesPaged(pageId);
		 List<Vehicule> list = new ArrayList<Vehicule>();
		 
	     for(Vehicule v : vPage) {
	    	 list.add(v);
	     }
	     
	     int numOfPages = vPage.getTotalPages();
	    
			List<String> listCateg=vehiculeService.getAllCategories();
			
			HttpSession session=request.getSession();
			session.setAttribute("listCategory", listCateg);
			
	      
			
		 model.addObject("numOfPages" , numOfPages);
		 model.addObject("vPage", list);
		 model.addObject("numVehicules" , list.size());
         return model;
     }
	
	@RequestMapping(value="/shop/{pageId}/filter",method=RequestMethod.GET)
	public ModelAndView reChercher(@PathVariable int pageId ,@ModelAttribute("filter") Filter filter, BindingResult bindingResult) {
		ModelAndView model=new ModelAndView("shop");
	
		
		
		System.out.println("filter.categ : " + filter.getCategory());
		System.out.println("filter.model : " + filter.getModel());
		System.out.println("filter.dateD : " + filter.getDateD());
		System.out.println("filter.timeD : " + filter.getTimeD());
		System.out.println("filter.timeR : " + filter.getTimeR());
		
		Page<Vehicule> page=vehiculeService.getVehiculeFilteredAndPaged(filter , pageId );
		 List<Vehicule> list = new ArrayList<Vehicule>();
		
		 System.out.println("ListContent :");
		for(Vehicule v : page) {
	    	 list.add(v);
	    	 System.out.println("vModel : "+ v.getModel() );
	    	 System.out.println("imagePath : "+ v.getImagePath());
	     }
		 
		 System.out.println("/ListContent---");
		 	
		 
		 HttpSession session=request.getSession();
			session.setAttribute("filter", filter);
		
		int numOfPages = page.getTotalPages();
		
		model.addObject("currentPage" , page.getNumber());
		model.addObject("numOfPages" , numOfPages);
		model.addObject("numVehicules" , list.size());
		model.addObject("vPage", list);
		
		return model;
	}
	
	@RequestMapping("/register")
	public ModelAndView sinscrire() {
		
		return new ModelAndView("register","user",new MyUser());
	}
	
	@RequestMapping(value="/register",method=RequestMethod.POST)
	public ModelAndView sinscrire(@ModelAttribute("user") MyUser myUser,HttpServletRequest request) {
		
		
		String emailVerification=myUser.getEmail();
		
		if( userService.getMyUser(emailVerification) != null )
			return new ModelAndView("register" , "msg" , "Email existe deja !");
		
			
		userService.addMyUser(myUser);
		
		
		 List<MyUser> userList=userService.getAllMyUsers();
			for(MyUser user2 : userList) {
				System.out.println("userFound! name: "+user2.getName());
			}
		
		
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		authorities.add(new SimpleGrantedAuthority("ROLE_CLIENT"));
		
		User user = new User(myUser.getEmail(), myUser.getPass(), false , true ,true , true ,authorities);
		
		
		double cryptedId= XenoLCryptor.cryptThis(myUser.getId());
		
		System.out.println("new user Id : "+myUser.getId());
		System.out.println("crypted Id : "+cryptedId);
	
		String url= "http://localhost:4000/activateAccount/"+cryptedId;
		String email="Chère Mr "+myUser.getName()+",\n \n"
				+ "Veillez Acceder au lien si dessou pour activer Votre Compte :\n \n"
				+ url;
		
		try {		
		mailService.sendEmail(user.getUsername(), "Activation du Compte " , email);

		}catch(Exception e){
			if (myUser!=null)
			userService.removeMyUser(user.getUsername());
			e.printStackTrace();
			return new ModelAndView("register" , "failure" , true);
			
		}
		
		userDetailsManager.createUser(user);
		
		
		ModelAndView model=new ModelAndView();
		
		
		model.addObject("logout","Un email d'activation vous a été envoyé <br>Veuillez activer votre compte.");
		model.setViewName("redirect:/login");
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String currentUserName = authentication.getName();
		
		if(userService.getMyUser(currentUserName) != null)
			model.setViewName("redirect:/BO/registerClient");
		
		return model;
	}
	
	
	@RequestMapping("/activateAccount/{crypted:.+}")
	public ModelAndView activerCompte(@PathVariable double crypted) {
		ModelAndView model= new ModelAndView("redirect:/login?logout=Votre Compte est actif!");
		
		int id= XenoLCryptor.decryptThis(crypted);
		
		System.out.println("crypted : " + crypted);
		System.out.println("decripted  : " + id);
		
		MyUser user=userService.getUser(id);
		user.setEnabled(true);

		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		authorities.add(new SimpleGrantedAuthority(user.getRol()));
		
		User springUser = new User(user.getEmail() , user.getPass() , true , true , true , true, authorities);

		userDetailsManager.updateUser(springUser);
		
		userService.updateUser(user);
		
		
		return model;
	}
	
	
	
}
