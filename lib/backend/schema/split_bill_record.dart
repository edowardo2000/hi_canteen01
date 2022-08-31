import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'split_bill_record.g.dart';

abstract class SplitBillRecord
    implements Built<SplitBillRecord, SplitBillRecordBuilder> {
  static Serializer<SplitBillRecord> get serializer =>
      _$splitBillRecordSerializer;

  @nullable
  String get uid;

  @nullable
  double get oriPrice;

  @nullable
  double get splitPrice;

  @nullable
  String get emailReq;

  @nullable
  BuiltList<String> get emailAcc;

  @nullable
  bool get reqReq;

  @nullable
  bool get accReq;

  @nullable
  bool get rejReq;

  @nullable
  DateTime get timestamp;

  @nullable
  String get nameReq;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(SplitBillRecordBuilder builder) => builder
    ..uid = ''
    ..oriPrice = 0.0
    ..splitPrice = 0.0
    ..emailReq = ''
    ..emailAcc = ListBuilder()
    ..reqReq = false
    ..accReq = false
    ..rejReq = false
    ..nameReq = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('splitBill');

  static Stream<SplitBillRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<SplitBillRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  SplitBillRecord._();
  factory SplitBillRecord([void Function(SplitBillRecordBuilder) updates]) =
      _$SplitBillRecord;

  static SplitBillRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createSplitBillRecordData({
  String uid,
  double oriPrice,
  double splitPrice,
  String emailReq,
  bool reqReq,
  bool accReq,
  bool rejReq,
  DateTime timestamp,
  String nameReq,
}) =>
    serializers.toFirestore(
        SplitBillRecord.serializer,
        SplitBillRecord((s) => s
          ..uid = uid
          ..oriPrice = oriPrice
          ..splitPrice = splitPrice
          ..emailReq = emailReq
          ..emailAcc = null
          ..reqReq = reqReq
          ..accReq = accReq
          ..rejReq = rejReq
          ..timestamp = timestamp
          ..nameReq = nameReq));
