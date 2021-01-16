package com.LoneX.myWheel.FeedBack;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FeedBackService {
	
	@Autowired
	FeedBackRepository feedBackReposiritory;
	
	public List<FeedBack> getAllFeed(){
		
		List<FeedBack> feedList= new ArrayList<FeedBack>();
		feedBackReposiritory.findAll().forEach(feedList::add);
		
		return feedList;
	}

	public void addFeed(FeedBack feed) {
		// TODO Auto-generated method stub
		feedBackReposiritory.save(feed);
	}

	public List<FeedBack> getAllUnseenFeed() {
		// TODO Auto-generated method stub
		return feedBackReposiritory.findBySeen(false);
	}
	

}
