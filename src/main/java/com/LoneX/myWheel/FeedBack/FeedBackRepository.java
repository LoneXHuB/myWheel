package com.LoneX.myWheel.FeedBack;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

public interface FeedBackRepository extends CrudRepository<FeedBack , Integer > {

	List<FeedBack> findBySeen(boolean b);

}
