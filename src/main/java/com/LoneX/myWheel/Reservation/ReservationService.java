package com.LoneX.myWheel.Reservation;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.LoneX.myWheel.Filters.Filter;
import com.LoneX.myWheel.User.MyUser;
import com.LoneX.myWheel.Vehicule.Vehicule;



@Service
public class ReservationService {
	
	@Autowired
	ReservationRepository ReservationRepository;
	
	
	public Reservation getReservation(int idReservation) {
		return ReservationRepository.findOne(idReservation);
	}
	
	public List<Reservation> getALLReservations(){
		List<Reservation> listRes=new ArrayList<Reservation>();
		ReservationRepository.findAllOrdered().forEach(listRes::add);
		
		return listRes;
	}
	
	public void reserver(Reservation reservation) {
		
		ReservationRepository.save(reservation);
	}
	public List<Reservation> getUserReservations(int userId){
		
		return ReservationRepository.findByUserId(userId);
	}
	public void removeReservation(int id) {
		
		ReservationRepository.delete(id);	
		
	}

	public List<Reservation> getUserReservationsFiltered(int id , Filter filter) {
		// TODO Auto-generated method stub
		
		String category=filter.getCategory();
		String model=filter.getModel();
		String marque=filter.getMarque();
		
		ReservationRepository.findByFilter(id , category , marque , model);
		return null;
	}

	public void updateReservation(Reservation reservation) {

			ReservationRepository.save(reservation);
		
	}

	public List<Reservation> getReservationByDate(Date today) {
		// TODO Auto-generated method stub
		return ReservationRepository.findByDateReservation(today);
	}

	public List<Reservation> getAllReservationMonth(Date month) {
		// TODO Auto-generated method stub
		return ReservationRepository.getMonthReservation(month);
	}

	public List<Reservation> getUpcomingRes(MyUser user) {
		// TODO Auto-generated method stub
		return ReservationRepository.getUpcomingRes(user.getId());
	}

	public List<Reservation> getUpcomingVehiculeRes(Vehicule vehicule) {
		// TODO Auto-generated method stub
		return ReservationRepository.getUpcomingVehiculeRes(vehicule);
	}
	
}

    
	
