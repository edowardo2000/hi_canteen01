import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/next_confirmation_request_widget.dart';
import '../cust_add_friend_list_page/cust_add_friend_list_page_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustFriendReqPageWidget extends StatefulWidget {
  const CustFriendReqPageWidget({Key key}) : super(key: key);

  @override
  _CustFriendReqPageWidgetState createState() =>
      _CustFriendReqPageWidgetState();
}

class _CustFriendReqPageWidgetState extends State<CustFriendReqPageWidget> {
  Completer<List<FriendReqRecord>> _firestoreRequestCompleter1;
  Completer<List<SplitBillRecord>> _firestoreRequestCompleter2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFFF994B),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Friend List',
          style: FlutterFlowTheme.of(context).subtitle1.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.of(context).primaryBtnText,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(14, 40, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                      child: Text(
                        'Incoming Request',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Roboto',
                              color: Color(0xFFFF994B),
                              fontSize: 18,
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(60, 0, 0, 0),
                      child: InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CustAddFriendListPageWidget(),
                            ),
                          );
                        },
                        child: Text(
                          'Add Friend',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Roboto',
                                    color: Color(0xFFF3CCAA),
                                    fontSize: 18,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 25,
                thickness: 3,
                indent: 20,
                endIndent: 20,
                color: Colors.white,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(28, 0, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                      child: Text(
                        'Split Bills Request',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Roboto',
                              fontSize: 17,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                  child: FutureBuilder<List<SplitBillRecord>>(
                    future: (_firestoreRequestCompleter2 ??=
                            Completer<List<SplitBillRecord>>()
                              ..complete(querySplitBillRecordOnce(
                                queryBuilder: (splitBillRecord) =>
                                    splitBillRecord
                                        .where('emailAcc',
                                            arrayContains: currentUserEmail)
                                        .where('reqReq', isEqualTo: false)
                                        .orderBy('timestamp'),
                              )))
                        .future,
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(
                              color: FlutterFlowTheme.of(context).primaryColor,
                            ),
                          ),
                        );
                      }
                      List<SplitBillRecord> listViewSplitBillRecordList =
                          snapshot.data;
                      return RefreshIndicator(
                        onRefresh: () async {
                          setState(() => _firestoreRequestCompleter2 = null);
                          await waitForFirestoreRequestCompleter2();
                        },
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewSplitBillRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewSplitBillRecord =
                                listViewSplitBillRecordList[listViewIndex];
                            return Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                              child: Container(
                                width: 100,
                                height: 90,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15, 0, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 5, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Split Bill Request - RM ${listViewSplitBillRecord.splitPrice.toString()}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            Color(0xFFFF3006),
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 0, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                listViewSplitBillRecord.nameReq,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .title3
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          fontSize: 27,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(120, 0, 0, 0),
                                              child: InkWell(
                                                onTap: () async {
                                                  final splitBillUpdateData = {
                                                    ...createSplitBillRecordData(
                                                      uid:
                                                          listViewSplitBillRecord
                                                              .uid,
                                                      oriPrice:
                                                          listViewSplitBillRecord
                                                              .oriPrice,
                                                      splitPrice:
                                                          listViewSplitBillRecord
                                                              .splitPrice,
                                                      emailReq:
                                                          listViewSplitBillRecord
                                                              .emailReq,
                                                      reqReq: false,
                                                      accReq: true,
                                                      rejReq: false,
                                                      timestamp:
                                                          getCurrentTimestamp,
                                                      nameReq:
                                                          listViewSplitBillRecord
                                                              .nameReq,
                                                    ),
                                                    'emailAcc':
                                                        listViewSplitBillRecord
                                                            .emailAcc
                                                            .toList(),
                                                  };
                                                  await listViewSplitBillRecord
                                                      .reference
                                                      .update(
                                                          splitBillUpdateData);

                                                  final userUpdateData = {
                                                    ...createUserRecordData(
                                                      email: currentUserEmail,
                                                      displayName:
                                                          currentUserDisplayName,
                                                      photoUrl:
                                                          currentUserPhoto,
                                                      uid: currentUserUid,
                                                      createdTime:
                                                          getCurrentTimestamp,
                                                      phoneNumber:
                                                          currentPhoneNumber,
                                                      userBalance: functions.balanceDeduct(
                                                          valueOrDefault(
                                                              currentUserDocument
                                                                  ?.userBalance,
                                                              0.0),
                                                          listViewSplitBillRecord
                                                              .splitPrice),
                                                    ),
                                                    'friendList':
                                                        (currentUserDocument
                                                                ?.friendList
                                                                ?.toList() ??
                                                            []),
                                                  };
                                                  await currentUserReference
                                                      .update(userUpdateData);
                                                },
                                                child: Icon(
                                                  Icons.check_circle_outlined,
                                                  color: Color(0xFF3FDE07),
                                                  size: 37,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 10, 0),
                                              child: InkWell(
                                                onTap: () async {
                                                  final splitBillUpdateData = {
                                                    ...createSplitBillRecordData(
                                                      uid:
                                                          listViewSplitBillRecord
                                                              .uid,
                                                      oriPrice:
                                                          listViewSplitBillRecord
                                                              .oriPrice,
                                                      splitPrice:
                                                          listViewSplitBillRecord
                                                              .splitPrice,
                                                      emailReq:
                                                          listViewSplitBillRecord
                                                              .emailReq,
                                                      reqReq: false,
                                                      accReq: false,
                                                      rejReq: true,
                                                      timestamp:
                                                          getCurrentTimestamp,
                                                      nameReq:
                                                          listViewSplitBillRecord
                                                              .nameReq,
                                                    ),
                                                    'emailAcc':
                                                        listViewSplitBillRecord
                                                            .emailAcc
                                                            .toList(),
                                                  };
                                                  await listViewSplitBillRecord
                                                      .reference
                                                      .update(
                                                          splitBillUpdateData);
                                                },
                                                child: Icon(
                                                  Icons.highlight_off_outlined,
                                                  color: Color(0xFFD52E2E),
                                                  size: 37,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 50, 0, 0),
                      child: Text(
                        'Friend Request',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Roboto',
                              fontSize: 19,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                  child: FutureBuilder<List<FriendReqRecord>>(
                    future: (_firestoreRequestCompleter1 ??=
                            Completer<List<FriendReqRecord>>()
                              ..complete(queryFriendReqRecordOnce(
                                queryBuilder: (friendReqRecord) =>
                                    friendReqRecord
                                        .where('reqReq', isEqualTo: true)
                                        .where('emailAcc',
                                            isEqualTo: currentUserEmail)
                                        .orderBy('timestamp'),
                              )))
                        .future,
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(
                              color: FlutterFlowTheme.of(context).primaryColor,
                            ),
                          ),
                        );
                      }
                      List<FriendReqRecord> listViewFriendReqRecordList =
                          snapshot.data;
                      return RefreshIndicator(
                        onRefresh: () async {
                          setState(() => _firestoreRequestCompleter1 = null);
                          await waitForFirestoreRequestCompleter1();
                        },
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewFriendReqRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewFriendReqRecord =
                                listViewFriendReqRecordList[listViewIndex];
                            return Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                              child: Container(
                                width: 100,
                                height: 90,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15, 0, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 5, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'New Friend Request',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            Color(0xFF0062D4),
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 0, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                listViewFriendReqRecord.nameReq,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .title3
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          fontSize: 27,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                final friendReqUpdateData =
                                                    createFriendReqRecordData(
                                                  uid: listViewFriendReqRecord
                                                      .uid,
                                                  emailAcc:
                                                      listViewFriendReqRecord
                                                          .emailAcc,
                                                  emailReq:
                                                      listViewFriendReqRecord
                                                          .emailReq,
                                                  accReq: true,
                                                  reqReq: false,
                                                  rejReq: false,
                                                  timestamp:
                                                      getCurrentTimestamp,
                                                  nameReq:
                                                      listViewFriendReqRecord
                                                          .nameReq,
                                                );
                                                await listViewFriendReqRecord
                                                    .reference
                                                    .update(
                                                        friendReqUpdateData);
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  context: context,
                                                  builder: (context) {
                                                    return Padding(
                                                      padding:
                                                          MediaQuery.of(context)
                                                              .viewInsets,
                                                      child:
                                                          NextConfirmationRequestWidget(
                                                        email:
                                                            listViewFriendReqRecord
                                                                .emailReq,
                                                        uid:
                                                            listViewFriendReqRecord
                                                                .uid,
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              child: Icon(
                                                Icons.check_circle_outlined,
                                                color: Color(0xFF3FDE07),
                                                size: 37,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 30, 0),
                                              child: InkWell(
                                                onTap: () async {
                                                  final friendReqUpdateData =
                                                      createFriendReqRecordData(
                                                    uid: listViewFriendReqRecord
                                                        .uid,
                                                    emailAcc:
                                                        listViewFriendReqRecord
                                                            .emailAcc,
                                                    emailReq:
                                                        listViewFriendReqRecord
                                                            .emailReq,
                                                    accReq: false,
                                                    reqReq: false,
                                                    rejReq: true,
                                                    timestamp:
                                                        getCurrentTimestamp,
                                                    nameReq:
                                                        listViewFriendReqRecord
                                                            .nameReq,
                                                  );
                                                  await listViewFriendReqRecord
                                                      .reference
                                                      .update(
                                                          friendReqUpdateData);
                                                },
                                                child: Icon(
                                                  Icons.highlight_off_outlined,
                                                  color: Color(0xFFD52E2E),
                                                  size: 37,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5, 0, 0, 0),
                                            child: Text(
                                              listViewFriendReqRecord.emailReq,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            Color(0xFF070101),
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future waitForFirestoreRequestCompleter1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = _firestoreRequestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForFirestoreRequestCompleter2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = _firestoreRequestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
