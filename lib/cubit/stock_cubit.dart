import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../api_service.dart';
import '../model/model.dart';

part 'stock_state.dart';

class StockCubit extends Cubit<StockState> {
  final _service = ApiService();

  StockCubit() : super(StockInitial());
  List<Model> foundedStocks = [];
  List<Model> allStocks = [];

  void getStocks() async {
    emit(StockLoading());
    final list = await _service.getStocks();
    if (list.isNotEmpty) {
      allStocks = list;
      emit(StockLoaded(list));
    } else {
      emit(StockError('Error check request'));
    }
  }

  void searchStocks(String query) async {
    if (query.isNotEmpty) {
      foundedStocks =
          allStocks.where((element) => element.companyName.toLowerCase().contains(query.toLowerCase())).toList();
      emit(StockLoaded(foundedStocks));
    } else {
      emit(StockLoaded(allStocks));
    }
  }

  void showComplient(bool isCompliant){
    if(isCompliant){
      foundedStocks = allStocks.where((element) => element.isCompliant).toList();
      emit(StockLoaded(foundedStocks));
    }else{
      foundedStocks = allStocks.where((element) => !element.isCompliant).toList();
      emit(StockLoaded(foundedStocks));
    }
  }
}
