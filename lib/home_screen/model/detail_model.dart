import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../../../utils/generics/model_factory.dart';

class DetailModelFactory extends ModelFactory<DetailModel> {
  @override
  DetailModel fromMap(Map<String, dynamic> map) {
    return DetailModel.fromMap(map);
  }
}

@immutable
class DetailModel {
  final String title;
  final String price;

  DetailModel({
    required this.title,
    required this.price,
    // ignore: non_constant_identifier_names
  });

  DetailModel copyWith({
    String? title,
    String? price,
    // ignore: non_constant_identifier_names
  }) {
    return DetailModel(
      title: title ?? this.title,
      price: price ?? this.price,
      // ignore: non_constant_identifier_names
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'price': price,
      // ignore: non_constant_identifier_titles
    };
  }

  factory DetailModel.fromMap(Map<String, dynamic> map) {
    return DetailModel(
      title: map['title'] as String,
      price: map['price'].toString(),
      // ignore: non_constant_identifier_titles
    );
  }

  String toJson() => json.encode(toMap());

  factory DetailModel.fromJson(String source) =>
      DetailModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    // ignore: non_constant_identifier_titles
    return 'DetailModel(title: $title, price: $price)';
  }

  @override
  bool operator ==(covariant DetailModel other) {
    if (identical(this, other)) return true;

    return other.title == title && other.price == price;
    // ignore: non_constant_identifier_titles
  }

  @override
  int get hashCode {
    return title.hashCode ^ price.hashCode;
  }
}
// class DetailModel {
//   const PendingModel({
//     required this.count,
//     required this.next,
//     required this.previous,
//     required this.results,
//   });

//   final int count;
//   final dynamic next;
//   final dynamic previous;
//   final List<Result> results;

//   factory PendingModel.fromMap(Map<String, dynamic> json) => PendingModel(
//       count: json['count'] as int,
//       next: json['next'] as dynamic,
//       previous: json['previous'] as dynamic,
//       results: (json['results'] as List? ?? [])
//           .map((e) => Result.fromJson(e as Map<String, dynamic>))
//           .toList());

//   Map<String, dynamic> toJson() => {
//         'count': count,
//         'next': next,
//         'previous': previous,
//         'results': results.map((e) => e.toJson()).toList()
//       };

//   PendingModel clone() => PendingModel(
//       count: count,
//       next: next,
//       previous: previous,
//       results: results.map((e) => e.clone()).toList());

//   PendingModel copyWith(
//           {int? count,
//           dynamic? next,
//           dynamic? previous,
//           List<Result>? results}) =>
//       PendingModel(
//         count: count ?? this.count,
//         next: next ?? this.next,
//         previous: previous ?? this.previous,
//         results: results ?? this.results,
//       );

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is PendingModel &&
//           count == other.count &&
//           next == other.next &&
//           previous == other.previous &&
//           results == other.results;

//   @override
//   int get hashCode =>
//       count.hashCode ^ next.hashCode ^ previous.hashCode ^ results.hashCode;
// }

// @immutable
// class Result {
//   const Result({
//     required this.staticId,
//     required this.title,
//     required this.titleId,
//     required this.bookerMob,
//     required this.tripCost,
//     required this.price,
//     required this.timeOfJourney,
//     required this.uniqueHash,
//     required this.trip,
//     required this.noOfPassengers,
//     required this.driverName,
//     required this.driverMobileNumber,
//     required this.vehicleNumber,
//     required this.notifRole,
//   });

//   final String staticId;
//   final dynamic booker;
//   final dynamic bookerId;
//   final dynamic bookerMob;
//   final double tripCost;
//   final String price;
//   final String timeOfJourney;
//   final String uniqueHash;
//   final Trip trip;
//   final int noOfPassengers;
//   final String driverName;
//   final int driverMobileNumber;
//   final String vehicleNumber;
//   final String notifRole;

//   factory Result.fromJson(Map<String, dynamic> json) => Result(
//       staticId: json['static_id'].toString(),
//       booker: json['booker'] as dynamic,
//       bookerId: json['booker_id'] as dynamic,
//       bookerMob: json['booker_mob'] as dynamic,
//       tripCost: (json['trip_cost'] as num).toDouble(),
//       status: json['status'].toString(),
//       timeOfJourney: json['time_of_journey'].toString(),
//       uniqueHash: json['unique_hash'].toString(),
//       trip: Trip.fromJson(json['trip'] as Map<String, dynamic>),
//       noOfPassengers: json['no_of_passengers'] as int,
//       driverName: json['driver_name'].toString(),
//       driverMobileNumber: json['driver_mobile_number'] as int,
//       vehicleNumber: json['vehicle_number'].toString(),
//       notifRole: json['notif_role'].toString());

//   Map<String, dynamic> toJson() => {
//         'static_id': staticId,
//         'booker': booker,
//         'booker_id': bookerId,
//         'booker_mob': bookerMob,
//         'trip_cost': tripCost,
//         'status': status,
//         'time_of_journey': timeOfJourney,
//         'unique_hash': uniqueHash,
//         'trip': trip.toJson(),
//         'no_of_passengers': noOfPassengers,
//         'driver_name': driverName,
//         'driver_mobile_number': driverMobileNumber,
//         'vehicle_number': vehicleNumber,
//         'notif_role': notifRole
//       };

//   Result clone() => Result(
//       staticId: staticId,
//       booker: booker,
//       bookerId: bookerId,
//       bookerMob: bookerMob,
//       tripCost: tripCost,
//       status: status,
//       timeOfJourney: timeOfJourney,
//       uniqueHash: uniqueHash,
//       trip: trip.clone(),
//       noOfPassengers: noOfPassengers,
//       driverName: driverName,
//       driverMobileNumber: driverMobileNumber,
//       vehicleNumber: vehicleNumber,
//       notifRole: notifRole);

//   Result copyWith(
//           {String? staticId,
//           dynamic? booker,
//           dynamic? bookerId,
//           dynamic? bookerMob,
//           double? tripCost,
//           String? status,
//           String? timeOfJourney,
//           String? uniqueHash,
//           Trip? trip,
//           int? noOfPassengers,
//           String? driverName,
//           int? driverMobileNumber,
//           String? vehicleNumber,
//           String? notifRole}) =>
//       Result(
//         staticId: staticId ?? this.staticId,
//         booker: booker ?? this.booker,
//         bookerId: bookerId ?? this.bookerId,
//         bookerMob: bookerMob ?? this.bookerMob,
//         tripCost: tripCost ?? this.tripCost,
//         status: status ?? this.status,
//         timeOfJourney: timeOfJourney ?? this.timeOfJourney,
//         uniqueHash: uniqueHash ?? this.uniqueHash,
//         trip: trip ?? this.trip,
//         noOfPassengers: noOfPassengers ?? this.noOfPassengers,
//         driverName: driverName ?? this.driverName,
//         driverMobileNumber: driverMobileNumber ?? this.driverMobileNumber,
//         vehicleNumber: vehicleNumber ?? this.vehicleNumber,
//         notifRole: notifRole ?? this.notifRole,
//       );

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is Result &&
//           staticId == other.staticId &&
//           booker == other.booker &&
//           bookerId == other.bookerId &&
//           bookerMob == other.bookerMob &&
//           tripCost == other.tripCost &&
//           status == other.status &&
//           timeOfJourney == other.timeOfJourney &&
//           uniqueHash == other.uniqueHash &&
//           trip == other.trip &&
//           noOfPassengers == other.noOfPassengers &&
//           driverName == other.driverName &&
//           driverMobileNumber == other.driverMobileNumber &&
//           vehicleNumber == other.vehicleNumber &&
//           notifRole == other.notifRole;

//   @override
//   int get hashCode =>
//       staticId.hashCode ^
//       booker.hashCode ^
//       bookerId.hashCode ^
//       bookerMob.hashCode ^
//       tripCost.hashCode ^
//       status.hashCode ^
//       timeOfJourney.hashCode ^
//       uniqueHash.hashCode ^
//       trip.hashCode ^
//       noOfPassengers.hashCode ^
//       driverName.hashCode ^
//       driverMobileNumber.hashCode ^
//       vehicleNumber.hashCode ^
//       notifRole.hashCode;
// }

// @immutable
// class Trip {
//   const Trip({
//     required this.startLocation,
//     required this.endLocation,
//     required this.ratePerKm,
//     required this.packageBookingRate,
//     required this.package,
//   });

//   final String startLocation;
//   final String endLocation;
//   final String ratePerKm;
//   final String packageBookingRate;
//   final Package package;

//   factory Trip.fromJson(Map<String, dynamic> json) => Trip(
//       startLocation: json['start_location'].toString(),
//       endLocation: json['end_location'].toString(),
//       ratePerKm: json['rate_per_km'].toString(),
//       packageBookingRate: json['package_booking_rate'].toString(),
//       package: Package.fromJson(json['package'] as Map<String, dynamic>));

//   Map<String, dynamic> toJson() => {
//         'start_location': startLocation,
//         'end_location': endLocation,
//         'rate_per_km': ratePerKm,
//         'package_booking_rate': packageBookingRate,
//         'package': package.toJson()
//       };

//   Trip clone() => Trip(
//       startLocation: startLocation,
//       endLocation: endLocation,
//       ratePerKm: ratePerKm,
//       packageBookingRate: packageBookingRate,
//       package: package.clone());

//   Trip copyWith(
//           {String? startLocation,
//           String? endLocation,
//           String? ratePerKm,
//           String? packageBookingRate,
//           Package? package}) =>
//       Trip(
//         startLocation: startLocation ?? this.startLocation,
//         endLocation: endLocation ?? this.endLocation,
//         ratePerKm: ratePerKm ?? this.ratePerKm,
//         packageBookingRate: packageBookingRate ?? this.packageBookingRate,
//         package: package ?? this.package,
//       );

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is Trip &&
//           startLocation == other.startLocation &&
//           endLocation == other.endLocation &&
//           ratePerKm == other.ratePerKm &&
//           packageBookingRate == other.packageBookingRate &&
//           package == other.package;

//   @override
//   int get hashCode =>
//       startLocation.hashCode ^
//       endLocation.hashCode ^
//       ratePerKm.hashCode ^
//       packageBookingRate.hashCode ^
//       package.hashCode;
// }

// @immutable
// class Package {
//   const Package({
//     required this.packageStaticId,
//     required this.distance,
//   });

//   final dynamic packageStaticId;
//   final dynamic distance;

//   factory Package.fromJson(Map<String, dynamic> json) => Package(
//       packageStaticId: json['package_static_id'] as dynamic,
//       distance: json['distance'] as dynamic);

//   Map<String, dynamic> toJson() =>
//       {'package_static_id': packageStaticId, 'distance': distance};

//   Package clone() =>
//       Package(packageStaticId: packageStaticId, distance: distance);

//   Package copyWith({dynamic? packageStaticId, dynamic? distance}) => Package(
//         packageStaticId: packageStaticId ?? this.packageStaticId,
//         distance: distance ?? this.distance,
//       );

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is Package &&
//           packageStaticId == other.packageStaticId &&
//           distance == other.distance;

//   @override
//   int get hashCode => packageStaticId.hashCode ^ distance.hashCode;
// }

// import 'package:flutter/foundation.dart';
// import 'package:quiver/core.dart';

// import '../../../utils/generics/model_factory.dart';

// class PendingModelFactory extends ModelFactory<PendingModel> {
//   @override
//   PendingModel fromMap(Map<String, dynamic> map) {
//     return PendingModel.fromMap(map);
//   }
// }

// @immutable
// class PendingModel {
//   const PendingModel({
//     required this.count,
//   });

//   final int count;

//   factory PendingModel.fromMap(Map<String, dynamic> json) =>
//       PendingModel(count: json['count'] as int);

//   Map<String, dynamic> toJson() => {'count': count};

//   PendingModel clone() => PendingModel(count: count);

//   PendingModel copyWith({int? count}) => PendingModel(
//         count: count ?? this.count,
//       );

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) || other is PendingModel && count == other.count;

//   @override
//   int get hashCode => count.hashCode;
// }

// // @immutable
// // class PendingModel {
// //   const PendingModel({
// //     required this.staticId,
// //     required this.roles,
// //     required this.text,
// //     required this.datetime,
// //     required this.bookingStaticId,
// //     required this.bookingStatus,
// //     required this.trip,
// //   });


// //   final String staticId;
// //   final String roles;
// //   final String text;
// //   final String datetime;
// //   final String bookingStaticId;
// //   final String bookingStatus;
// //   final String trip;

// //   factory PendingModel.fromMap(Map<String, dynamic> json) => PendingModel(
// //       staticId: json['static_id'].toString(),
// //       roles: json['roles'].toString(),
// //       text: json['text'].toString(),
// //       datetime: json['datetime'].toString(),
// //       bookingStaticId: json['booking_static_id'].toString(),
// //       bookingStatus: json['booking_status'].toString(),
// //       trip: json['trip'].toString());

// //   Map<String, dynamic> toMap() => {
// //         'static_id': staticId,
// //         'roles': roles,
// //         'text': text,
// //         'datetime': datetime,
// //         'booking_static_id': bookingStaticId,
// //         'booking_status': bookingStatus,
// //         'trip': trip
// //       };

// //   PendingModel clone() => PendingModel(
// //       staticId: staticId,
// //       roles: roles,
// //       text: text,
// //       datetime: datetime,
// //       bookingStaticId: bookingStaticId,
// //       bookingStatus: bookingStatus,
// //       trip: trip);

// //   PendingModel copyWith(
// //           {String? staticId,
// //           String? roles,
// //           String? text,
// //           String? datetime,
// //           String? bookingStaticId,
// //           String? bookingStatus,
// //           String? trip}) =>
// //       PendingModel(
// //         staticId: staticId ?? this.staticId,
// //         roles: roles ?? this.roles,
// //         text: text ?? this.text,
// //         datetime: datetime ?? this.datetime,
// //         bookingStaticId: bookingStaticId ?? this.bookingStaticId,
// //         bookingStatus: bookingStatus ?? this.bookingStatus,
// //         trip: trip ?? this.trip,
// //       );

// //   @override
// //   bool operator ==(Object other) =>
// //       identical(this, other) ||
// //       other is PendingModel &&
// //           staticId == other.staticId &&
// //           roles == other.roles &&
// //           text == other.text &&
// //           datetime == other.datetime &&
// //           bookingStaticId == other.bookingStaticId &&
// //           bookingStatus == other.bookingStatus &&
// //           trip == other.trip;

// //   @override
// //   int get hashCode =>
// //       staticId.hashCode ^
// //       roles.hashCode ^
// //       text.hashCode ^
// //       datetime.hashCode ^
// //       bookingStaticId.hashCode ^
// //       bookingStatus.hashCode ^
// //       trip.hashCode;
// // }
