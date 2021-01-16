package com.LoneX.myWheel.Controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.LoneX.myWheel.Depot.Depot;
import com.LoneX.myWheel.Depot.DepotService;
import com.LoneX.myWheel.FeedBack.FeedBackService;
import com.LoneX.myWheel.Filters.Filter;
import com.LoneX.myWheel.Reservation.Reservation;
import com.LoneX.myWheel.Reservation.ReservationService;
import com.LoneX.myWheel.User.MyUser;
import com.LoneX.myWheel.User.MyUserService;
import com.LoneX.myWheel.Vehicule.Vehicule;
import com.LoneX.myWheel.Vehicule.VehiculeService;

@Controller
public class AgentController {
	

	


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
			 
		private static String UPLOAD_FOLDER = "D:\\Spring boot projects\\myWheel\\src\\main\\resources\\static\\images\\cars\\";
		
		
		@Autowired
		private DepotService depotService;
		
		@Order(1)
		@PreAuthorize("hasRole('ROLE_AGENT')")
		@RequestMapping("/BO/depStat")
		public ModelAndView etablirEtatDepot( ) {
			
			 ModelAndView model= new ModelAndView("BODepStat");

			 return model;
		}
		 @PreAuthorize("hasRole('ROLE_AGENT')")
		@RequestMapping("/BO/addVehicule")
		public ModelAndView addVehiculePage() {
			ModelAndView model= new ModelAndView("BOdepot");
			
			model.addObject("vehicule",new Vehicule());
			
			List<Depot> depots = new ArrayList<Depot>();
			depotService.getAll().forEach(depots::add);
			System.out.println("size Liste dep: " +depots.size());
			
			model.addObject("listDep",depots);
			
			return model;
		}
		
		@RequestMapping("/BO/removeVehicule")
		public ModelAndView supprimerVehicule() {
			ModelAndView model= new ModelAndView("BORemove");
			
			model.addObject("vehicule",new Vehicule());
			
			return model;
		}
		
		@RequestMapping(value="/BO/addVehicule", method=RequestMethod.POST)
		public ModelAndView ajouterVehicule(@ModelAttribute("vehicule") Vehicule  vehicule ,@RequestParam("file") MultipartFile file, RedirectAttributes redirectAttributes ) {
			
	       ModelAndView model= new ModelAndView("BOdepot");
	       
	       
	       List<Depot> depots = new ArrayList<Depot>();
			depotService.getAll().forEach(depots::add);
			System.out.println("size Liste dep: " +depots.size());
			
			model.addObject("listDep",depots);
	  
	       if (file.isEmpty()) {
	    	   ModelAndView errorModel=new ModelAndView("BOdepot", "message", "Veuillez inserer une image !");
				errorModel.addObject("successMsg" , false );
				return errorModel;
			}
	       
	       String mat=vehicule.getMatricule();
	       
	       if ( ! vehiculeService.getVehiculeByMatricule( mat ).isEmpty() )
	    	   return new ModelAndView("BOdepot", "message2", "Conflit matricule détécté!");
	       
			try {
			
				byte[] bytes = file.getBytes();
				Path path = Paths.get(UPLOAD_FOLDER + file.getOriginalFilename());
				Files.write(path, bytes);
				vehicule.setImagePath(file.getOriginalFilename());
				System.out.println("fileName: "+file.getOriginalFilename());
				String fileName=file.getOriginalFilename();
				
				System.out.println("format: "+file.getOriginalFilename().substring(fileName.length()-3,fileName.length() ));
				String format=file.getOriginalFilename().substring(fileName.length()-3,fileName.length());
				
				if(! format.equals("png") && ! format.equals("jpg"))
					 return new ModelAndView("BOdepot", "message", "Format image incorrect");
				
				vehiculeService.addVehicule(vehicule);

			} catch (IOException e){
				e.printStackTrace();
				ModelAndView errorModel=new ModelAndView("BOdepot", "message", "erreur de chargement de l'image !");
				errorModel.addObject("successMsg" , false );
				return errorModel;

			}
			
			model.addObject("successMsg" , true );
			 
			 
			return model;
		}
		
		@RequestMapping(value="/BO/removeVehicule" , method=RequestMethod.POST)
		public ModelAndView supprimerVehicule(@ModelAttribute("vehicule") Vehicule Vehicule ) {
			
			 ModelAndView model= new ModelAndView("BORemove");
			
			 Vehicule vehicule=vehiculeService.getVehiculeByMatricule(Vehicule.getMatricule()).get(0);
				
			
			 if(vehicule == null)
				 return new ModelAndView("BORemove","msgError" ,"Vehicule introuvable!");
		
			 System.out.println("vehicule to remove : " + vehicule.getMatricule() + "id : "+ vehicule.getIdVehicule());
			
			 
			 List<Reservation> upcomingRes = reservationService.getUpcomingVehiculeRes(vehicule);
			 
			 System.out.println("upComingRes size : " + upcomingRes.size());
			
			 if(upcomingRes.size() != 0)
				 return new ModelAndView("BORemove","msgError" ,"Le Vehicule est résérvé");
			 

			 vehiculeService.removeVehicule(vehicule.getMatricule());
			 model.addObject("msg" , "le véhicule a été supprimé avec succès");
			 return model;
		}
		
		@RequestMapping("/BO/editDep")
		public ModelAndView modifDepot() {
			
			 ModelAndView model= new ModelAndView("BOInfoDep");
			
			 Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
				String currentUserName = authentication.getName();
				MyUser currentUser= userService.getMyUser( currentUserName );
				
				Depot depot =new Depot();
				
				
				depot=currentUser.getDepot();
				
				model.addObject("depot" , depot);
			 
			 return model;
		}
		
		@RequestMapping(value="/BO/editDep",method=RequestMethod.POST)
		public ModelAndView modifierDepot(@ModelAttribute("depot") Depot depot ) {
			
			 ModelAndView model= new ModelAndView("BOInfoDep");
				
			 Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
				String currentUserName = authentication.getName();
				MyUser currentUser= userService.getMyUser( currentUserName );
			 
				depot.setIdDepot(currentUser.getDepot().getIdDepot());
			 
				depotService.updateDepot(depot);
				
			 return model;
		}
		
		
			
			
			
			@RequestMapping("/BO/location")
			public ModelAndView location() {
				
				ModelAndView model=new ModelAndView("BOLocation");
				model.addObject("filter",new Filter());
			
				return model;
				
			}
			
			
			@RequestMapping("/BO/confirmerLocation/{idLocation}")
			public ModelAndView confirmerReservation(@PathVariable int idLocation ) {
				
				ModelAndView model=new ModelAndView("facture");
				Reservation reservation=reservationService.getReservation(idLocation);
				
				model.addObject("user", reservation.getUser() );
				model.addObject("reservation" , reservation);
			
				return model;
				
			}
	
			@RequestMapping("/BO/contract/{idLocation}")
			
			public ModelAndView imprimerContrat(@PathVariable int idLocation ) {
				
				ModelAndView model=new ModelAndView("BOContract");
				Reservation reservation=reservationService.getReservation(idLocation);
				
				model.addObject("user", reservation.getUser() );
				model.addObject("reservation" , reservation);
			
				return model;
				
			}
			
			@RequestMapping(value="/BO/confirmerLocation/{idLocation}", method=RequestMethod.POST)
			
			public ModelAndView ConfirmerReservation(@PathVariable int idLocation ) {
				
				ModelAndView model=new ModelAndView("facture");
				Reservation reservation=reservationService.getReservation(idLocation);
				if(reservation.getEtat().equals("en Attente"))
				{
					model.addObject("success" , true);
					reservation.setState("Confirmé");
					reservationService.updateReservation(reservation);
					model.addObject("user", reservation.getUser() );
					model.addObject("reservation" , reservation);
					return model;
				}
				
				else if(reservation.getEtat().equals("Confirmé"))
					model.addObject("error" , true);
				 else
					return new ModelAndView("redirect:/BO/locationFilter?email="+reservation.getUser().getEmail());

				
				model.addObject("user", reservation.getUser() );
				model.addObject("reservation" , reservation);
				
				return model;
				
			}
		
			
			@RequestMapping("/BO/locationFilter")
			public ModelAndView etablirEtatClient(@ModelAttribute("filter") Filter filter) {
				
				ModelAndView model=new ModelAndView ("BOLocation");
				
				
				MyUser user= myUserService.getMyUser( filter.getEmail() );
				if(user==null)
					return new ModelAndView("BOLocation" , "notFound" , true);
				
				List<Reservation> cart=reservationService.getUserReservations(user.getId() );
				
				System.out.println("user : "+ user.getEmail());
				System.out.println("numReservation : "+ cart.size());
				
				List<Vehicule> vehicules=new ArrayList<Vehicule>();
				//getting vehicules by id from reservations
				for(Reservation reservation: cart) {
					vehicules.add( vehiculeService.getVehicule( reservation.getVehicule().getIdVehicule() ) );
				}
				
				model.addObject("user" , user);
				model.addObject("numVehicules" , vehicules.size());
				model.addObject("vPage" , vehicules );
				model.addObject("cart" , cart);
				model.addObject("numReservation" , cart.size());
				
				
				return model;
			}
			
			
			
			@RequestMapping(value="/BO/locationGlobal", method=RequestMethod.GET)
			public ModelAndView etablirEtatGlobal() {
				
				ModelAndView model=new ModelAndView ("BOLocationGlobal");
				
				
		
				
				List<Reservation> cart=reservationService.getALLReservations();
				List<MyUser> userList=new ArrayList<MyUser>();
				List<Vehicule> vehicules=new ArrayList<Vehicule>();

				for(Reservation reservation: cart) {
					MyUser user= reservation.getUser();
					vehicules.add(reservation.getVehicule());
					userList.add(user);
				}
		
				System.out.println("numReservations : "+ cart.size());
				
				
			
				
				model.addObject("users" , userList);
				model.addObject("numVehicules" , vehicules.size());
				model.addObject("vPage" , vehicules );
				model.addObject("cart" , cart);
				model.addObject("numReservation" , cart.size());
				model.addObject("filter",new Filter());
			
				return model;
		
			}
	

@RequestMapping(value="/BO/blockClient", method=RequestMethod.GET)
	public ModelAndView bloquerClient() {
	
	ModelAndView model=new ModelAndView ("BOBlockClient");
	
	
	List<MyUser> users=new ArrayList<MyUser>();
	userService.getAllMyUsers().forEach(users::add);



	
	model.addObject("users" , users);
	model.addObject("numUsers", users.size());
	
	return model;
}

@RequestMapping(value="/BO/removeClient" , method=RequestMethod.GET)
	public ModelAndView supprimerClient() {
	
	 ModelAndView model= new ModelAndView("BORemoveClient" ,"user" , new MyUser());
	 
	 
	 
	 return model;
}
@RequestMapping(value="/BO/removeClient" , method=RequestMethod.POST)
public ModelAndView supprimerAgent(@ModelAttribute("user") MyUser user) {
	
	 ModelAndView model= new ModelAndView("BORemoveClient");
	
	 if(userService.getMyUser(user.getEmail()) == null)
		 return new ModelAndView("BORemoveClient","msgError" ,"Utilisateur introuvable!");
	
	 if(! (userService.getMyUser(user.getEmail()).getRol().equals("ROLE_CLIENT")))
		 return new ModelAndView("BORemoveClient","msgError" ,"l'utilisateur n'est pas un cLient");
	 
	 MyUser User= userService.getMyUser(user.getEmail());
	 
	 List<Reservation> upcomingRes = reservationService.getUpcomingRes(User);
	 
	 System.out.println("upComingRes size : " + upcomingRes.size());
	
	 if(upcomingRes.size() != 0)
		 return new ModelAndView("BORemoveClient","msgError" ,"Le client possède des reservations");
	 

		
		
		
		
	
	 userService.removeMyUser(user.getEmail());
	 
	 userDetailsManager.deleteUser(user.getEmail());
	
	 model.addObject("msg" , "Client Supprimé avec succès !");
	 
	 return model;
}


	
	@RequestMapping("/BO/registerClient")
	public ModelAndView ajouterClient() {
		
		return new ModelAndView("BOAddClient","user",new MyUser());
	}

}
