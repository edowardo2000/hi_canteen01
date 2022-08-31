import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../cust_friend_req_page/cust_friend_req_page_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustAddFriendListPageWidget extends StatefulWidget {
  const CustAddFriendListPageWidget({Key key}) : super(key: key);

  @override
  _CustAddFriendListPageWidgetState createState() =>
      _CustAddFriendListPageWidgetState();
}

class _CustAddFriendListPageWidgetState
    extends State<CustAddFriendListPageWidget> {
  TextEditingController textController;
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
          child: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(14, 40, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                          child: InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CustFriendReqPageWidget(),
                                ),
                              );
                            },
                            child: Text(
                              'Incoming Request',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: Color(0xFFF3CCAA),
                                    fontSize: 18,
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(60, 0, 0, 0),
                          child: Text(
                            'Add Friend',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
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
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 200, 0),
                    child: Text(
                      'Enter email',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Roboto',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Container(
                      width: 280,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xFFDACECE),
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                        child: TextFormField(
                          controller: textController,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'email',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyText2.override(
                                    fontFamily: 'Roboto',
                                    fontSize: 15,
                                  ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 95, 0, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        final friendReqCreateData = createFriendReqRecordData(
                          uid: random_data.randomString(
                            10,
                            10,
                            true,
                            true,
                            true,
                          ),
                          emailAcc: textController.text,
                          emailReq: currentUserEmail,
                          accReq: false,
                          rejReq: false,
                          reqReq: true,
                          timestamp: getCurrentTimestamp,
                          nameReq: currentUserDisplayName,
                        );
                        await FriendReqRecord.collection
                            .doc()
                            .set(friendReqCreateData);
                        Navigator.pop(context);
                      },
                      text: 'Send Friend Request',
                      icon: Icon(
                        Icons.send,
                        size: 15,
                      ),
                      options: FFButtonOptions(
                        width: 280,
                        height: 40,
                        color: Color(0xFFFF994B),
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Roboto',
                                  color: Colors.white,
                                ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
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
  }
}
