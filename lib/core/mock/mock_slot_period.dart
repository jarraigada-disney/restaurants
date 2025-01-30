import 'package:restaurant_app/core/mock/mock_restaurant_period.dart';

//const mockSlotPeriodLocal= ['8:00 am - 8:30 am'];
//const mockSlotPeriodRemote = ['8:30 am - 9:30 am','9:30 am - 10:00 am'];


// final List <RestaurantSlot> mockRestaurantSlots = [
//   RestaurantSlot(restaurantId: '00001', slotTimes: ['8:30 am - 9:30 am','9:30 am - 10:00 am']),
//   RestaurantSlot(restaurantId: '00002', slotTimes: ['19:30 pm - 20:00 pm','20:00 pm - 20:30 pm']),
// ];

const String mockRestaurantSlotsJson = '''
[
  {
    "restaurantId": "00001",
    "slotTimes": ["8:30 - 9:30","9:30 - 10:00","10:00 - 10:30","10:30 - 11:00"]
  },
  {
    "restaurantId": "00002",
    "slotTimes": ["19:30 pm - 20:00 pm","20:00 pm - 20:30 pm","20:30 pm - 21:00 pm"]
  },
  {
    "restaurantId": "00003",
    "slotTimes": ["12:00 pm - 12:30 pm"]
  }
]
''';