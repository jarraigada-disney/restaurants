class RestaurantFromApiMock {
    final String restaurantId;
    final String restaurantName;
    final String parkName;
    final String location;
    final String img;
    final String openTime;
    final String closeTime;
    final String price;
    final String menuType;
    final String diningPlanType;
    final List<String> acceptedDiningPlans;
    final String typeofCuisine;

    RestaurantFromApiMock
  ({
        required this.restaurantId,
        required this.restaurantName,
        required this.parkName,
        required this.location,
        required this.img,
        required this.openTime,
        required this.closeTime,
        required this.price,
        required this.menuType,
        required this.diningPlanType,
        required this.acceptedDiningPlans,
        required this.typeofCuisine,
    });

    factory RestaurantFromApiMock
  .fromJson(Map<String, dynamic> json) => RestaurantFromApiMock
  (
        restaurantId: json["restaurantId"],
        restaurantName: json["restaurantName"],
        parkName: json["parkName"],
        location: json["location"],
        img: json["img"],
        openTime: json["openTime"],
        closeTime: json["closeTime"],
        price: json["price"],
        menuType: json["menuType"],
        diningPlanType: json["diningPlanType"],
        acceptedDiningPlans: List<String>.from(json["acceptedDiningPlans"]),
        typeofCuisine: json["typeofCuisine"],
    );

    Map<String, dynamic> toJson() => {
        "restaurantId": restaurantId,
        "restaurantName": restaurantName,
        "parkName": parkName,
        "location": location,
        "img": img,
        "openTime": openTime,
        "closeTime": closeTime,
        "price": price,
        "menuType": menuType,
        "diningPlanType": diningPlanType,
        "acceptedDiningPlans": acceptedDiningPlans,
        "typeofCuisine": typeofCuisine,
    };
}