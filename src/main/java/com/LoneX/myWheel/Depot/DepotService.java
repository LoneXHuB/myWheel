package com.LoneX.myWheel.Depot;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DepotService {

	@Autowired
	private DepotRepository depotRepository;
	
	public void updateDepot(Depot depot) {
		depotRepository.save(depot);
	}

	public List<String> getAllDepots() {
		// TODO Auto-generated method stub
		
		List<Depot> depots = new ArrayList<Depot>();
		depotRepository.findAll().forEach(depots::add);;
		
		List<String> depotList= new ArrayList<String>();
		
		for(Depot dep : depots )
		{
			depotList.add( dep.getName() );
			System.out.println(" depName : "+ dep.getName());
		}
		return depotList;
	}

	public List<Depot> getAll() {
		// TODO Auto-generated method stub
		List<Depot> depots = new ArrayList<Depot>();
		depotRepository.findAll().forEach(depots::add);
		
		return depots;
	}
}
