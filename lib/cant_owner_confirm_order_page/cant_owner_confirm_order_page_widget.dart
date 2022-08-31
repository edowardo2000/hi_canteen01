import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CantOwnerConfirmOrderPageWidget extends StatefulWidget {
  const CantOwnerConfirmOrderPageWidget({Key key}) : super(key: key);

  @override
  _CantOwnerConfirmOrderPageWidgetState createState() =>
      _CantOwnerConfirmOrderPageWidgetState();
}

class _CantOwnerConfirmOrderPageWidgetState
    extends State<CantOwnerConfirmOrderPageWidget> {
  Completer<List<OrderRecord>> _firestoreRequestCompleter;
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
          'Order Request',
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
                        'Incoming Order Request',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Roboto',
                              color: Color(0xFFFF994B),
                              fontSize: 18,
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
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                  child: FutureBuilder<List<OrderRecord>>(
                    future: (_firestoreRequestCompleter ??=
                            Completer<List<OrderRecord>>()
                              ..complete(queryOrderRecordOnce(
                                queryBuilder: (orderRecord) => orderRecord
                                    .where('uid_canteen',
                                        isEqualTo: currentUserUid)
                                    .where('statusorder', isEqualTo: 'Order')
                                    .orderBy('timeorder'),
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
                      List<OrderRecord> listViewOrderRecordList = snapshot.data;
                      return RefreshIndicator(
                        onRefresh: () async {
                          setState(() => _firestoreRequestCompleter = null);
                          await waitForFirestoreRequestCompleter();
                        },
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewOrderRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewOrderRecord =
                                listViewOrderRecordList[listViewIndex];
                            return Container(
                              width: 100,
                              height: 150,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
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
                                            listViewOrderRecord.customername,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText2
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  color: Color(0xFF0062D4),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
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
                                          Text(
                                            listViewOrderRecord.namefood,
                                            style: FlutterFlowTheme.of(context)
                                                .title3
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    120, 0, 0, 0),
                                            child: InkWell(
                                              onTap: () async {
                                                final orderUpdateData =
                                                    createOrderRecordData(
                                                  uid: listViewOrderRecord.uid,
                                                  timeorder:
                                                      getCurrentTimestamp,
                                                  statusorder: 'Prepare',
                                                  customername:
                                                      listViewOrderRecord
                                                          .customername,
                                                  namefood: listViewOrderRecord
                                                      .namefood,
                                                  photofood: listViewOrderRecord
                                                      .photofood,
                                                  pricefood: listViewOrderRecord
                                                      .pricefood,
                                                  uidCust: listViewOrderRecord
                                                      .uidCust,
                                                  uidFood: listViewOrderRecord
                                                      .uidFood,
                                                  uidCanteen:
                                                      listViewOrderRecord
                                                          .uidCanteen,
                                                  notes:
                                                      listViewOrderRecord.notes,
                                                  stock:
                                                      listViewOrderRecord.stock,
                                                );
                                                await listViewOrderRecord
                                                    .reference
                                                    .update(orderUpdateData);
                                              },
                                              child: Icon(
                                                Icons.check_circle_outlined,
                                                color: Color(0xFF3FDE07),
                                                size: 37,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 0, 0, 0),
                                            child: InkWell(
                                              onTap: () async {
                                                final orderUpdateData =
                                                    createOrderRecordData(
                                                  uid: listViewOrderRecord.uid,
                                                  timeorder:
                                                      getCurrentTimestamp,
                                                  statusorder: 'Reject',
                                                  customername:
                                                      listViewOrderRecord
                                                          .customername,
                                                  namefood: listViewOrderRecord
                                                      .namefood,
                                                  photofood: listViewOrderRecord
                                                      .photofood,
                                                  pricefood: listViewOrderRecord
                                                      .pricefood,
                                                  uidCust: listViewOrderRecord
                                                      .uidCust,
                                                  uidFood: listViewOrderRecord
                                                      .uidFood,
                                                  uidCanteen:
                                                      listViewOrderRecord
                                                          .uidCanteen,
                                                  notes:
                                                      listViewOrderRecord.notes,
                                                  stock:
                                                      listViewOrderRecord.stock,
                                                );
                                                await listViewOrderRecord
                                                    .reference
                                                    .update(orderUpdateData);
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 0, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'RM ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  fontSize: 18,
                                                ),
                                          ),
                                          Text(
                                            listViewOrderRecord.pricefood
                                                .toString(),
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  fontSize: 18,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 5, 0, 2),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            listViewOrderRecord.notes,
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  fontSize: 18,
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
                                                  5, 5, 0, 0),
                                          child: Text(
                                            dateTimeFormat('d/M/y',
                                                listViewOrderRecord.timeorder),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  color: Color(0xFF070101),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
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

  Future waitForFirestoreRequestCompleter({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = _firestoreRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
