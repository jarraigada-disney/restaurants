import 'package:restaurant_app/core/data_source/arrival_window_data_source.dart';
import 'package:restaurant_app/core/repositories/arrival_window_repository.dart';
import 'package:restaurant_app/driver_adapter/data_sources/aw_data_source_imp.dart';

class AwRepositoryImp extends ArrivalWindowRepository{

final ArrivalWindowDataSource dataSource;

  AwRepositoryImp({required this.dataSource});

  @override
  Future<List<String>> slotPeriod({required String restaurantId}) async{
      await Future.delayed(Duration(seconds: 2));
      return dataSource.slotPeriod(restaurantId: restaurantId);
  }
}