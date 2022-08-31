import '../all_edit_account/all_edit_account_widget.dart';
import '../all_main_page_hi_canteen/all_main_page_hi_canteen_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../cant_owner_confirm_order_page/cant_owner_confirm_order_page_widget.dart';
import '../cant_owner_transaction_history/cant_owner_transaction_history_widget.dart';
import '../cant_owner_view_menu_page/cant_owner_view_menu_page_widget.dart';
import '../cant_q_r_code/cant_q_r_code_widget.dart';
import '../cust_account_page/cust_account_page_widget.dart';
import '../cust_edit_profile/cust_edit_profile_widget.dart';
import '../cust_friend_list_page/cust_friend_list_page_widget.dart';
import '../cust_order_history_page/cust_order_history_page_widget.dart';
import '../cust_view_food_list/cust_view_food_list_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';

class AllHomePageWidget extends StatefulWidget {
  const AllHomePageWidget({Key key}) : super(key: key);

  @override
  _AllHomePageWidgetState createState() => _AllHomePageWidgetState();
}

class _AllHomePageWidgetState extends State<AllHomePageWidget> {
  Completer<List<UserRecord>> _firestoreRequestCompleter;
  TextEditingController textController;
  var qrCanteen = '';
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFD8D6D6),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: FutureBuilder<List<UserRecord>>(
            future:
                (_firestoreRequestCompleter ??= Completer<List<UserRecord>>()
                      ..complete(queryUserRecordOnce(
                        queryBuilder: (userRecord) =>
                            userRecord.where('uid', isEqualTo: currentUserUid),
                        singleRecord: true,
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
              List<UserRecord> listViewUserRecordList = snapshot.data;
              final listViewUserRecord = listViewUserRecordList.isNotEmpty
                  ? listViewUserRecordList.first
                  : null;
              return RefreshIndicator(
                onRefresh: () async {
                  setState(() => _firestoreRequestCompleter = null);
                  await waitForFirestoreRequestCompleter();
                },
                child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  children: [
                    if (!(valueOrDefault(
                            currentUserDocument?.isCanteen, false)) ??
                        true)
                      AuthUserStreamWidget(
                        child: Stack(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 230,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFF994B),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-0.85, -0.1),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 15, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(12, 0, 0, 0),
                                                child: InkWell(
                                                  onTap: () async {
                                                    await Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            CustAccountPageWidget(
                                                          uid: currentUserUid,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                    child: Image.network(
                                                      'https://pluspng.com/img-png/png-user-icon-icons-logos-emojis-users-2400.png',
                                                      width: 100,
                                                      height: 100,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 25, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10, 0, 10, 0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          InkWell(
                                                            onTap: () async {
                                                              await Navigator
                                                                  .push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          CustFriendListPageWidget(),
                                                                ),
                                                              );
                                                            },
                                                            child: Icon(
                                                              Icons.people,
                                                              color:
                                                                  Colors.black,
                                                              size: 24,
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: () async {
                                                              await Navigator
                                                                  .push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          CustFriendListPageWidget(),
                                                                ),
                                                              );
                                                            },
                                                            child: Text(
                                                              'Friends',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    fontSize:
                                                                        12,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        InkWell(
                                                          onTap: () async {
                                                            await Navigator
                                                                .push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        CustOrderHistoryPageWidget(),
                                                              ),
                                                            );
                                                          },
                                                          child: Icon(
                                                            Icons
                                                                .article_rounded,
                                                            color: Colors.black,
                                                            size: 24,
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () async {
                                                            await Navigator
                                                                .push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        CustOrderHistoryPageWidget(),
                                                              ),
                                                            );
                                                          },
                                                          child: Text(
                                                            'History',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  fontSize: 12,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0, -1),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10, 0,
                                                                    0, 0),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            qrCanteen =
                                                                await FlutterBarcodeScanner
                                                                    .scanBarcode(
                                                              '#C62828', // scanning line color
                                                              'Cancel', // cancel button text
                                                              true, // whether to show the flash icon
                                                              ScanMode.QR,
                                                            );

                                                            setState(() {});
                                                          },
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .qr_code_scanner_rounded,
                                                                color: Colors
                                                                    .black,
                                                                size: 24,
                                                              ),
                                                              Text(
                                                                'Scan QR',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      fontSize:
                                                                          12,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
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
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-0.05, 0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  14, 0, 15, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -0.91, 0.1),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(2, 5, 0, 0),
                                                  child: Text(
                                                    'Hello ',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                          fontSize: 19,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1, 0.1),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 5, 0, 0),
                                                    child: StreamBuilder<
                                                        List<UserRecord>>(
                                                      stream: queryUserRecord(
                                                        queryBuilder: (userRecord) =>
                                                            userRecord.where(
                                                                'uid',
                                                                isEqualTo:
                                                                    currentUserUid),
                                                        singleRecord: true,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50,
                                                              height: 50,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<UserRecord>
                                                            textUserRecordList =
                                                            snapshot.data;
                                                        // Return an empty Container when the document does not exist.
                                                        if (snapshot
                                                            .data.isEmpty) {
                                                          return Container();
                                                        }
                                                        final textUserRecord =
                                                            textUserRecordList
                                                                    .isNotEmpty
                                                                ? textUserRecordList
                                                                    .first
                                                                : null;
                                                        return Text(
                                                          currentUserDisplayName,
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBtnText,
                                                                fontSize: 19,
                                                              ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () async {
                                                  await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          CustEditProfileWidget(),
                                                    ),
                                                  );
                                                },
                                                child: Icon(
                                                  Icons.edit,
                                                  color: Colors.black,
                                                  size: 24,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-0.85, 0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 10, 0, 0),
                                          child: Text(
                                            'Hunting for delicious foods?',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 15, 0, 0),
                                        child: Container(
                                          width: 250,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFEEEEEE),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              color: Colors.white,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(12, 0, 0, 0),
                                                child: Icon(
                                                  Icons.search,
                                                  color: Color(0xFFA7A7A7),
                                                  size: 17,
                                                ),
                                              ),
                                              Expanded(
                                                child: TextFormField(
                                                  controller: textController,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 0, 0, 18),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText2,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    if (!(valueOrDefault(
                            currentUserDocument?.isCanteen, false)) ??
                        true)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
                        child: AuthUserStreamWidget(
                          child: FutureBuilder<List<CanteenRecord>>(
                            future: queryCanteenRecordOnce(),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                    ),
                                  ),
                                );
                              }
                              List<CanteenRecord> listViewCanteenRecordList =
                                  snapshot.data;
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listViewCanteenRecordList.length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewCanteenRecord =
                                      listViewCanteenRecordList[listViewIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 10),
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEEEEEE),
                                      ),
                                      child: InkWell(
                                        onTap: () async {
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  CustViewFoodListWidget(),
                                            ),
                                          );
                                        },
                                        child: Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          color: Color(0xFFF5F5F5),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Image.network(
                                                'https://static.vecteezy.com/system/resources/previews/000/168/356/original/canteen-vector-design.jpg',
                                                width: 100,
                                                height: 100,
                                                fit: BoxFit.cover,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(5, 0, 0, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      valueOrDefault<String>(
                                                        listViewCanteenRecord
                                                            .cantName,
                                                        'fff',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle1,
                                                    ),
                                                    Text(
                                                      listViewCanteenRecord
                                                          .cantLocation,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .star_purple500_sharp,
                                                          color:
                                                              Color(0xFFFF994B),
                                                          size: 24,
                                                        ),
                                                        Text(
                                                          listViewCanteenRecord
                                                              .rating
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.6, 0),
                                                  child: Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: Colors.black,
                                                    size: 30,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    if (valueOrDefault(currentUserDocument?.isCanteen, false) ??
                        true)
                      AuthUserStreamWidget(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 339,
                              decoration: BoxDecoration(
                                color: Color(0xFFFF994B),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(80),
                                  bottomRight: Radius.circular(0),
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(0),
                                ),
                              ),
                              child: Visibility(
                                visible: valueOrDefault(
                                        currentUserDocument?.isCanteen,
                                        false) ??
                                    true,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          200, 25, 0, 0),
                                      child: Text(
                                        'HiCanteen',
                                        textAlign: TextAlign.justify,
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle1
                                            .override(
                                              fontFamily: 'Satisfy',
                                              color: Colors.white,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 0),
                                      child: InkWell(
                                        onTap: () async {
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  AllEditAccountWidget(),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          width: 290,
                                          height: 110,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFEEEEEE),
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 2,
                                                color: Color(0xFF525252),
                                                offset: Offset(1, 4),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 1, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(12, 0, 0, 0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                    child: Image.network(
                                                      'https://static.vecteezy.com/system/resources/previews/000/168/356/original/canteen-vector-design.jpg',
                                                      width: 80,
                                                      height: 80,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(15, 0, 0, 17),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 15,
                                                                    0, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              currentUserDisplayName,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .title3
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Icon(
                                                                Icons.mode_edit,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                size: 19,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 3,
                                                                    41, 0),
                                                        child: StreamBuilder<
                                                            List<
                                                                CanteenRecord>>(
                                                          stream:
                                                              queryCanteenRecord(
                                                            singleRecord: true,
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50,
                                                                  height: 50,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryColor,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<CanteenRecord>
                                                                textCanteenRecordList =
                                                                snapshot.data;
                                                            // Return an empty Container when the document does not exist.
                                                            if (snapshot
                                                                .data.isEmpty) {
                                                              return Container();
                                                            }
                                                            final textCanteenRecord =
                                                                textCanteenRecordList
                                                                        .isNotEmpty
                                                                    ? textCanteenRecordList
                                                                        .first
                                                                    : null;
                                                            return Text(
                                                              textCanteenRecord
                                                                  .cantLocation,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    color: Color(
                                                                        0xFFF10000),
                                                                    fontSize:
                                                                        15,
                                                                  ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 3, 0, 0),
                                                        child: Text(
                                                          currentUserEmail,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                fontSize: 15,
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
                                      ),
                                    ),
                                    Divider(
                                      height: 39,
                                      thickness: 3,
                                      indent: 45,
                                      endIndent: 45,
                                      color: Color(0xFFFAFAFA),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 140,
                                          height: 95,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFEEEEEE),
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 2,
                                                color: Color(0xFF585858),
                                                offset: Offset(1, 2),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(14),
                                          ),
                                          child: StreamBuilder<
                                              List<CanteenRecord>>(
                                            stream: queryCanteenRecord(
                                              singleRecord: true,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child:
                                                        CircularProgressIndicator(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<CanteenRecord>
                                                  columnCanteenRecordList =
                                                  snapshot.data;
                                              final columnCanteenRecord =
                                                  columnCanteenRecordList
                                                          .isNotEmpty
                                                      ? columnCanteenRecordList
                                                          .first
                                                      : null;
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 20, 0, 0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        'RM${listViewUserRecord.userBalance.toString()}',
                                                        '0',
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'Roboto',
                                                            color: Color(
                                                                0xFF070000),
                                                            fontSize: 24,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ),
                                                  Text(
                                                    'Total Revenue',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: Colors.black,
                                                        ),
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  17, 0, 0, 0),
                                          child: Container(
                                            width: 140,
                                            height: 95,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFEEEEEE),
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 2,
                                                  color: Color(0xFF5B5B5B),
                                                  offset: Offset(1, 2),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                            ),
                                            child: StreamBuilder<
                                                List<CanteenRecord>>(
                                              stream: queryCanteenRecord(
                                                singleRecord: true,
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50,
                                                      height: 50,
                                                      child:
                                                          CircularProgressIndicator(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<CanteenRecord>
                                                    columnCanteenRecordList =
                                                    snapshot.data;
                                                final columnCanteenRecord =
                                                    columnCanteenRecordList
                                                            .isNotEmpty
                                                        ? columnCanteenRecordList
                                                            .first
                                                        : null;
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 20, 0, 0),
                                                      child: Text(
                                                        columnCanteenRecord
                                                            .numOrder
                                                            .toString(),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color: Color(
                                                                      0xFF000600),
                                                                  fontSize: 24,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                      ),
                                                    ),
                                                    Text(
                                                      'Orders',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: Color(
                                                                    0xFF00080C),
                                                              ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 500,
                              decoration: BoxDecoration(
                                color: Color(0xFFD8D6D6),
                              ),
                              child: Visibility(
                                visible: valueOrDefault(
                                        currentUserDocument?.isCanteen,
                                        false) ??
                                    true,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 25, 0, 0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  CantQRCodeWidget(),
                                            ),
                                          );
                                        },
                                        text: 'My Canteen QR Code',
                                        icon: Icon(
                                          Icons.qr_code,
                                          size: 15,
                                        ),
                                        options: FFButtonOptions(
                                          width: 270,
                                          height: 60,
                                          color: Color(0xFFEEEEEE),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .subtitle2
                                                  .override(
                                                    fontFamily: 'Roboto',
                                                    color: Color(0xFFFF994B),
                                                  ),
                                          borderSide: BorderSide(
                                            color: Color(0xFFFF994B),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 35, 0, 0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  CantOwnerViewMenuPageWidget(),
                                            ),
                                          );
                                        },
                                        text: 'Manage My Menu',
                                        icon: Icon(
                                          Icons.fastfood,
                                          size: 15,
                                        ),
                                        options: FFButtonOptions(
                                          width: 270,
                                          height: 60,
                                          color: Color(0xFFEEEEEE),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .subtitle2
                                                  .override(
                                                    fontFamily: 'Roboto',
                                                    color: Color(0xFFFF994B),
                                                  ),
                                          borderSide: BorderSide(
                                            color: Color(0xFFFF994B),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 35, 0, 0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  CantOwnerConfirmOrderPageWidget(),
                                            ),
                                          );
                                        },
                                        text: 'View Incoming Order',
                                        icon: Icon(
                                          Icons.pending_actions,
                                          size: 15,
                                        ),
                                        options: FFButtonOptions(
                                          width: 270,
                                          height: 60,
                                          color: Color(0xFFEEEEEE),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .subtitle2
                                                  .override(
                                                    fontFamily: 'Roboto',
                                                    color: Color(0xFFFF994B),
                                                  ),
                                          borderSide: BorderSide(
                                            color: Color(0xFFFF994B),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 35, 0, 0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  CantOwnerTransactionHistoryWidget(),
                                            ),
                                          );
                                        },
                                        text: 'View Transaction History',
                                        icon: Icon(
                                          Icons.article,
                                          size: 15,
                                        ),
                                        options: FFButtonOptions(
                                          width: 270,
                                          height: 60,
                                          color: Color(0xFFEEEEEE),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .subtitle2
                                                  .override(
                                                    fontFamily: 'Roboto',
                                                    color: Color(0xFFFF994B),
                                                  ),
                                          borderSide: BorderSide(
                                            color: Color(0xFFFF994B),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 75, 0, 0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          await signOut();
                                          await Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  AllMainPageHiCanteenWidget(),
                                            ),
                                            (r) => false,
                                          );
                                        },
                                        text: 'Log Out',
                                        options: FFButtonOptions(
                                          width: 170,
                                          height: 40,
                                          color: Color(0xFFEF3958),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .subtitle2
                                                  .override(
                                                    fontFamily: 'Roboto',
                                                    color: Colors.white,
                                                  ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              );
            },
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
