//Read models and create entitie

import 'package:restaurant_app/driver_adapter/models/RestaurantMockDB/restaurant_from_restaurant_mock.dart';
import 'package:restaurant_app/entities/restaurant.dart';

class RestaurantMapper {

  static Restaurant restaurantFromRestaurantMock(RestaurantFromRestaurantMock restaurantMock) => Restaurant(
    parkName: restaurantMock.parkName,
    img: restaurantMock.img, 
    title: restaurantMock.restaurantName,
    id: restaurantMock.restaurantId, 
    location: restaurantMock.location,
    openTime: restaurantMock.openTime, 
    closeTime: restaurantMock.closeTime, 
    price: restaurantMock.price, 
    menuType: restaurantMock.menuType, 
    diningPlanType: restaurantMock.diningPlanType, 
    acceptedDiningPlans: List<String>.from(restaurantMock.acceptedDiningPlans), 
    typeofCuisine: restaurantMock.typeofCuisine, );

    //If i need restaurant from another source (eg disney API) I create another method
    

}