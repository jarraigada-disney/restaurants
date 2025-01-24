import 'package:restaurant_app/core/data_source/arrival_window_data_source.dart';
import 'package:restaurant_app/core/mock/mock_slot_period.dart';

class LocalAwDataSource extends ArrivalWindowDataSource{
  @override
  Future<List<String>> slotPeriod({required String restaurantId}) async{
    throw Exception();
    return mockSlotPeriodLocal;
  }

}