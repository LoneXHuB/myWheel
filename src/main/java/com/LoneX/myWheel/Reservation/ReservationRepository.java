package com.LoneX.myWheel.Reservation;





import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.LoneX.myWheel.Vehicule.Vehicule;

@Repository
public interface ReservationRepository extends PagingAndSortingRepository<Reservation, Integer>{
	
	
	@Query(value="SELECT * from reservation WHERE user_id=?1 ORDER BY dated " 
			, nativeQuery=true)
	public List<Reservation> findByUserId(int userId);
		
	@Query(value="SELECT dateD,dateR,vehicule_id_vehicule from reservation WHERE user_id=?1 ORDER BY dated " 
			, nativeQuery=true)
	public List<Reservation> findByFilter(int id, String category, String marque, String model);
	
	@Query(value="SELECT * from reservation ORDER BY date_Reservation DESC" ,nativeQuery=true)
	public List<Reservation> findAllOrdered();

	@Query(value="SELECT * from reservation where date_Reservation=?1 ORDER BY date_Reservation DESC" ,nativeQuery=true)
	public List<Reservation> findByDateReservation(Date today);

	@Query(value="SELECT * from reservation where Year(date_Reservation)=Year(CURDATE()) AND Month(date_Reservation)=Month(?1)" ,nativeQuery=true)
	public List<Reservation> getMonthReservation(Date month);

	@Query(value="SELECT * FROM reservation WHERE dateD >= CURDATE() AND user_id=?1" , nativeQuery=true)
	public List<Reservation> getUpcomingRes(int user);

	@Query(value="SELECT * FROM reservation WHERE dateD >= CURDATE() AND vehicule_id_vehicule=?1" , nativeQuery=true)
	public List<Reservation> getUpcomingVehiculeRes(Vehicule vehicule);



	

}
