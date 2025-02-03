class RestaurantFromRestaurantMock {
    final String restaurantId;
    final String restaurantName;
    final String parkName;
    final String location;
    final String img;

    RestaurantFromRestaurantMock({
        required this.restaurantId,
        required this.restaurantName,
        required this.parkName,
        required this.location,
        required this.img,
    });

    factory RestaurantFromRestaurantMock.fromJson(Map<String, dynamic> json) => RestaurantFromRestaurantMock(
        restaurantId: json["restaurantId"],
        restaurantName: json["restaurantName"],
        parkName: json["parkName"],
        location: json["location"],
        img: json["img"],
    );

    Map<String, dynamic> toJson() => {
        "restaurantId": restaurantId,
        "restaurantName": restaurantName,
        "parkName": parkName,
        "location": location,
        "img": img,
    };
}