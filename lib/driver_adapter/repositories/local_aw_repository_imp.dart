import 'package:restaurant_app/core/data_source/arrival_window_data_source.dart';
import 'package:restaurant_app/core/repositories/arrival_window_repository.dart';

class LocalArrivalWindowRepositoryImp extends ArrivalWindowRepository {
  LocalArrivalWindowRepositoryImp(
      {required this.remoteDataSource, required this.localDataSource});
  final ArrivalWindowDataSource localDataSource;
  final ArrivalWindowDataSource remoteDataSource;
  @override
  Future<List<String>> slotPeriod({required String restaurantId}) async {
    List<String> list1;
    List<String> list2;

    try {
       list1 =
          await localDataSource.slotPeriod(restaurantId: restaurantId);
    } catch (e) {
      list1=[];
    }
    try {
       list2 =
          await remoteDataSource.slotPeriod(restaurantId: restaurantId);
    } catch (e) {
      list2 =[];
    }
    if(list1.isEmpty && list2.isEmpty){
      throw Exception('Local and remote sources are empty');
    }
    else{
      return [...list1, ...list2];
    }
  }
}
