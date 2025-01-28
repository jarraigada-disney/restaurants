

class RestaurantSlot {
  final String restaurantId;
  final List<String> slotTimes;

  RestaurantSlot({required this.restaurantId, required this.slotTimes});

  
   factory RestaurantSlot.fromJson(Map<String, dynamic> json) {
    return RestaurantSlot(
      restaurantId: json['restaurantId'],
      slotTimes: List<String>.from(json['slotTimes']),
    );
  }
}