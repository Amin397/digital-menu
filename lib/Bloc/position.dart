// import 'dart:async';
//
// class Location {
//   // ignore: close_sinks
//   final streamController = StreamController.broadcast();
//
//   /// The [getStream] getter would be used to expose our stream to other classes
//   Stream get getStream => streamController.stream;
//
//   void changeCity(CityModel city) {
//     this.city = city;
//     StorageUtils.setCity(city: city);
//     streamController.sink.add(true);
//     streamController.sink.add(this.city);
//   }
//
//   void changeState(StatesModel state) {
//     this.state = state;
//     StorageUtils.setState(state: state);
//     streamController.sink.add(true);
//     streamController.sink.add(this.state);
//   }
//
//   CityModel? city;
//   StatesModel? state;
//
//   addPosition({
//     CityModel? myCity,
//     StatesModel? myState,
//   }) {
//     city = myCity;
//     state = myState;
//     streamController.sink.add(city);
//     streamController.sink.add(state);
//   }
// }
