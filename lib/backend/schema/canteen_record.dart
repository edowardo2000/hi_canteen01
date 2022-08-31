import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'canteen_record.g.dart';

abstract class CanteenRecord
    implements Built<CanteenRecord, CanteenRecordBuilder> {
  static Serializer<CanteenRecord> get serializer => _$canteenRecordSerializer;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'cant_location')
  String get cantLocation;

  @nullable
  @BuiltValueField(wireName: 'cant_name')
  String get cantName;

  @nullable
  double get rating;

  @nullable
  String get review;

  @nullable
  double get revenue;

  @nullable
  @BuiltValueField(wireName: 'num_order')
  int get numOrder;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CanteenRecordBuilder builder) => builder
    ..uid = ''
    ..cantLocation = ''
    ..cantName = ''
    ..rating = 0.0
    ..review = ''
    ..revenue = 0.0
    ..numOrder = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('canteen');

  static Stream<CanteenRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<CanteenRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  CanteenRecord._();
  factory CanteenRecord([void Function(CanteenRecordBuilder) updates]) =
      _$CanteenRecord;

  static CanteenRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createCanteenRecordData({
  String uid,
  String cantLocation,
  String cantName,
  double rating,
  String review,
  double revenue,
  int numOrder,
}) =>
    serializers.toFirestore(
        CanteenRecord.serializer,
        CanteenRecord((c) => c
          ..uid = uid
          ..cantLocation = cantLocation
          ..cantName = cantName
          ..rating = rating
          ..review = review
          ..revenue = revenue
          ..numOrder = numOrder));
