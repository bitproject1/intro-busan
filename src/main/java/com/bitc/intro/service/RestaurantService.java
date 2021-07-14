package com.bitc.intro.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitc.intro.domain.Restaurant;
import com.bitc.intro.repository.RestaurantRepository;

@Service
public class RestaurantService {

	
	@Autowired
	private RestaurantRepository restaurantRepository;
	
	public void insert(Restaurant restaurant) {
		restaurantRepository.insert(restaurant);
	};
	
	public int getTotalCount() {
		return restaurantRepository.getTotalCount();
	};
	
	public int getRestaurantById(int id) {
		return restaurantRepository.getRestaurantById(id);
	};
	
	public List<Restaurant> getRestaurants() {
		return restaurantRepository.getRestaurants();
	};
	
	public void deleteById(int id) {
		restaurantRepository.deleteById(id);
	};
	
	public void updateRestaurantById(Restaurant resutaurant) {
		restaurantRepository.updateRestaurantById(resutaurant);
	};
	
	public List<Restaurant> getRestaurantsBySpotId(int id) {
		return restaurantRepository.getRestaurantsBySpotId(id);
	};
}
