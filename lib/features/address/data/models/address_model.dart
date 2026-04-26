import 'package:kartify/features/address/domain/domain.dart';

class AddressModel extends AddressEntity {
  const AddressModel({
    required super.id,
    required super.name,
    required super.street,
    required super.city,
    required super.state,
    required super.zipCode,
    required super.country,
    required super.isDefault,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['id'] as String,
      name: json['name'] as String,
      street: json['street'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      zipCode: json['zipCode'] as String,
      country: json['country'] as String,
      isDefault: json['isDefault'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'street': street,
      'city': city,
      'state': state,
      'zipCode': zipCode,
      'country': country,
      'isDefault': isDefault,
    };
  }
}
