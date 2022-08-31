import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'friend_req_record.g.dart';

abstract class FriendReqRecord
    implements Built<FriendReqRecord, FriendReqRecordBuilder> {
  static Serializer<FriendReqRecord> get serializer =>
      _$friendReqRecordSerializer;

  @nullable
  String get uid;

  @nullable
  String get emailAcc;

  @nullable
  String get emailReq;

  @nullable
  bool get accReq;

  @nullable
  bool get reqReq;

  @nullable
  bool get rejReq;

  @nullable
  DateTime get timestamp;

  @nullable
  String get nameReq;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(FriendReqRecordBuilder builder) => builder
    ..uid = ''
    ..emailAcc = ''
    ..emailReq = ''
    ..accReq = false
    ..reqReq = false
    ..rejReq = false
    ..nameReq = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('friendReq');

  static Stream<FriendReqRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<FriendReqRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  FriendReqRecord._();
  factory FriendReqRecord([void Function(FriendReqRecordBuilder) updates]) =
      _$FriendReqRecord;

  static FriendReqRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createFriendReqRecordData({
  String uid,
  String emailAcc,
  String emailReq,
  bool accReq,
  bool reqReq,
  bool rejReq,
  DateTime timestamp,
  String nameReq,
}) =>
    serializers.toFirestore(
        FriendReqRecord.serializer,
        FriendReqRecord((f) => f
          ..uid = uid
          ..emailAcc = emailAcc
          ..emailReq = emailReq
          ..accReq = accReq
          ..reqReq = reqReq
          ..rejReq = rejReq
          ..timestamp = timestamp
          ..nameReq = nameReq));
