import 'package:costume_api/Models/address.dart';

extension FormatToAdress on Address {
  formatedAdress() {
    Address address = this;
    return "${address.street} ${address.suite} ${address.city}, ${address.zipcode}";
  }
}
