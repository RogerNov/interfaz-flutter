import 'package:http/http.dart' as http;
import 'package:rentcar/model/brand_model.dart';
import 'package:rentcar/model/car_model.dart';
import 'package:rentcar/utils/const_app.dart';

class CarHttpService{
  final String _url = "https://car-data.p.rapidapi.com/";
  final String _headerKey = "f6501dc5fbmsh45e9daf72e868acp1ee981jsn7305189dfc0d";
  final String _headerHost = "car-data.p.rapidapi.co";


  Future<List<CarsModel>> getCars() async {
    var uri = Uri.parse(_url + endPointCars);
    var response = await http.get(uri,
        headers: {
          headerKey: _headerKey,
          headerHost : _headerHost
        });

    if(response.statusCode == 200){
      return carsModelFromJson(response.body);
    }else{
      throw(messageErrorCarsApi);
    }
  }

  Future<List<String>> getBrand() async {
    var uri = Uri.parse(_url + endPointBrands);
    var response = await http.get(uri ,
        headers: {
          headerKey: _headerKey,
          headerHost : _headerHost
        });

    if(response.statusCode == 200){
      return brandModelFromJson(response.body);
    }else{
      throw(messageErrorBrandApi);
    }
  }

}