
package com.LoneX.myWheel.Vehicule;



import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.LoneX.myWheel.Depot.Depot;

@Repository
public interface VehiculeRepository extends PagingAndSortingRepository<Vehicule, Integer>{
	
	@Query(value="Select DISTINCT marque from vehicule where categorie=?1" , nativeQuery=true)
	public List<String> getMarquesByCategory(String category);
	
	@Query(value="Select DISTINCT categorie from vehicule" , nativeQuery=true)
	public List<String> getAllCategories();
	
	@Query(value="Select DISTINCT model from vehicule where ( marque=?1 AND categorie=?2 )" , nativeQuery=true)
	public List<String> getModelsByMarque(String marque , String category);
	
	@Query(value="Select DISTINCT marque from vehicule " , nativeQuery=true)
	public List<String> getAllMarques();
	
	public List<Vehicule> findByMatricule(String matricule);
	
	public Page<Vehicule> findByModel(String model , Pageable page);
	
	public Page<Vehicule> findByCategorie(String categorie, Pageable page);	
	
	@Query(value="Select * from Vehicule WHERE"
			+ "(plj<=?4 OR ?4=0.0)"
			+ "AND (marque=?3 OR ?3='') "
			+ "AND (model=?6 OR ?6='' ) "
			+ "AND (categorie=?5 OR ?5='')"
			
			+ "AND (id_vehicule NOT IN (SELECT vehicule_id_vehicule FROM Vehicule v,Reservation r "
			+ "WHERE r.vehicule_id_vehicule=v.id_vehicule AND r.type ='byDay' AND (r.dateD BETWEEN ?1 and ?2 OR r.dateR BETWEEN ?1 and ?2))"
			
			+ "AND id_vehicule NOT IN (SELECT vehicule_id_vehicule FROM Vehicule v,Reservation r "
			+ "WHERE r.vehicule_id_vehicule=v.id_vehicule AND r.type ='byHour' AND r.dateD=?1 AND (r.timeD BETWEEN ?7 and ?8 OR r.timeR BETWEEN ?7 and ?8)))"

			+ "ORDER BY ?#{#pageable}"
			, nativeQuery=true)
	public Page<Vehicule> findByFullFilter(String dateD , String dateR ,String marque ,double plj ,String cat,String model ,String timeD, String timeR, Pageable page);
	
	@Query(value="Select * from Vehicule WHERE id_vehicule NOT IN (select vehicule_id_vehicule from Vehicule v,Reservation r WHERE r.vehicule_id_vehicule=v.id_vehicule AND dateD not BETWEEN ?1 and ?2 OR dateR NOT BETWEEN ?1 and ?2) ORDER BY ?#{#pageable}" , nativeQuery=true)
	public Page<Vehicule> findByDateInterval(Date dateD , Date dateR , Pageable page);
	
	public List<Vehicule> findByMarqueAndModel(String marqueVeh, String modelVeh);
	
	public List<Vehicule> findByDepot(Depot depot);

	

	

}
