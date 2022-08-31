import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'order_record.g.dart';

abstract class OrderRecord implements Built<OrderRecord, OrderRecordBuilder> {
  static Serializer<OrderRecord> get serializer => _$orderRecordSerializer;

  @nullable
  String get uid;

  @nullable
  DateTime get timeorder;

  @nullable
  String get statusorder;

  @nullable
  String get customername;

  @nullable
  String get namefood;

  @nullable
  String get photofood;

  @nullable
  double get pricefood;

  @nullable
  @BuiltValueField(wireName: 'uid_cust')
  String get uidCust;

  @nullable
  @BuiltValueField(wireName: 'uid_food')
  String get uidFood;

  @nullable
  @BuiltValueField(wireName: 'uid_canteen')
  String get uidCanteen;

  @nullable
  String get notes;

  @nullable
  int get stock;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(OrderRecordBuilder builder) => builder
    ..uid = ''
    ..statusorder = ''
    ..customername = ''
    ..namefood = ''
    ..photofood = ''
    ..pricefood = 0.0
    ..uidCust = ''
    ..uidFood = ''
    ..uidCanteen = ''
    ..notes = ''
    ..stock = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('order');

  static Stream<OrderRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<OrderRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  OrderRecord._();
  factory OrderRecord([void Function(OrderRecordBuilder) updates]) =
      _$OrderRecord;

  static OrderRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createOrderRecordData({
  String uid,
  DateTime timeorder,
  String statusorder,
  String customername,
  String namefood,
  String photofood,
  double pricefood,
  String uidCust,
  String uidFood,
  String uidCanteen,
  String notes,
  int stock,
}) =>
    serializers.toFirestore(
        OrderRecord.serializer,
        OrderRecord((o) => o
          ..uid = uid
          ..timeorder = timeorder
          ..statusorder = statusorder
          ..customername = customername
          ..namefood = namefood
          ..photofood = photofood
          ..pricefood = pricefood
          ..uidCust = uidCust
          ..uidFood = uidFood
          ..uidCanteen = uidCanteen
          ..notes = notes
          ..stock = stock));
