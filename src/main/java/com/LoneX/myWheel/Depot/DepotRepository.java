package com.LoneX.myWheel.Depot;


import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;


public interface DepotRepository extends CrudRepository<Depot , Integer>{
	
	@Query(value="Select Distinct * from Depot Where name=?1",nativeQuery=true)
	public List<Depot> findByName(String selected);

}
