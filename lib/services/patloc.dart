class patloc{
  static double lat;
  static double lng;
}
pattloc({String latlng}){
  var firstindex=latlng.indexOf("(");
  var secondindex=latlng.indexOf(',');
  var thirdindex=latlng.indexOf(')');
  String lat=latlng.substring(firstindex+1,secondindex);
  String lng=latlng.substring(secondindex+1,thirdindex);
  var latt=double.parse(lat);
  var lngg=double.parse(lng);
  patloc.lat=latt;
  patloc.lng=lngg;

}