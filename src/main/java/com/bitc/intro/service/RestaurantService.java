package com.bitc.intro.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bitc.intro.domain.CriteriaDetail;
import com.bitc.intro.domain.Hotspot;
import com.bitc.intro.domain.Restaurant;
import com.bitc.intro.repository.RestaurantRepository;

@Service
@Transactional
public class RestaurantService {

	
	@Autowired
	private RestaurantRepository restaurantRepository;
	
	public void insert(Restaurant restaurant) {
		restaurantRepository.insert(restaurant);
	};
	
	public Restaurant getRestaurantById(int rid) {
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
	
	public int getLoveCount(int rid) {
		return restaurantRepository.getLoveCount(rid);
	}
	
	public Integer getRecommendationsByage(int rid) {
		return restaurantRepository.getRecommendationsByage(rid);
	}
	
	public String getRecommendationsByGender(int rid) {
		return restaurantRepository.getRecommendationsByGender(rid);
	}
<<<<<<< HEAD
	
	public void increaseLove(int rid) {
		restaurantRepository.increaseLove(rid);
	}
	
	public void decreaseLove(int rid) {
		restaurantRepository.decreaseLove(rid);
	}
=======
>>>>>>> ccec924 (연령, 성별에 따른 추천 기능 추가)
}
