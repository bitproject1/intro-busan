package com.bitc.intro.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitc.intro.domain.CriteriaDetail;
import com.bitc.intro.domain.Hotspot;
import com.bitc.intro.domain.Restaurant;
import com.bitc.intro.repository.RestaurantRepository;

@Service
public class RestaurantService {

	
	@Autowired
	private RestaurantRepository restaurantRepository;
	
	public void insert(Restaurant restaurant) {
		restaurantRepository.insert(restaurant);
	};
	
	public int getRestaurantById(int rid) {
		return restaurantRepository.getRestaurantById(rid);
	};
	
	public List<Restaurant> getRestaurants() {
		return restaurantRepository.getRestaurants();
	};
	
	public void deleteById(int rid) {
		restaurantRepository.deleteById(rid);
	};
	
	public void updateRestaurantById(Restaurant resutaurant) {
		restaurantRepository.updateRestaurantById(resutaurant);
	};
	
	public int getTotalCountBySpotId(Hotspot hotspot) {
		return restaurantRepository.getTotalCountSpotId(hotspot);
	};
	
	public List<Restaurant> getRestaurantsBySpotIdWithPage(Hotspot hotspot, CriteriaDetail cri) {
		return restaurantRepository.getRestaurantsBySpotIdWithPage(hotspot, cri);
	};
}
