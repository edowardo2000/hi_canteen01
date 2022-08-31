import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'customer_record.g.dart';

abstract class CustomerRecord
    implements Built<CustomerRecord, CustomerRecordBuilder> {
  static Serializer<CustomerRecord> get serializer =>
      _$customerRecordSerializer;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'cust_location')
  String get custLocation;

  @nullable
  @BuiltValueField(wireName: 'cust_univ')
  String get custUniv;

  @nullable
  @BuiltValueField(wireName: 'cust_balance')
  double get custBalance;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CustomerRecordBuilder builder) => builder
    ..uid = ''
    ..custLocation = ''
    ..custUniv = ''
    ..custBalance = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('customer');

  static Stream<CustomerRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<CustomerRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  CustomerRecord._();
  factory CustomerRecord([void Function(CustomerRecordBuilder) updates]) =
      _$CustomerRecord;

  static CustomerRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createCustomerRecordData({
  String uid,
  String custLocation,
  String custUniv,
  double custBalance,
}) =>
    serializers.toFirestore(
        CustomerRecord.serializer,
        CustomerRecord((c) => c
          ..uid = uid
          ..custLocation = custLocation
          ..custUniv = custUniv
          ..custBalance = custBalance));
