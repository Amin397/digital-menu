import 'storage.dart';



class StorageUtils{

  static Future<dynamic> getProfileCity()async{
    return MyStorage.getString(name: 'profilePosition');
  }

  static Future<dynamic> getCity()async{
    return MyStorage.getString(name: 'position');
  }



}