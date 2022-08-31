import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../cust_cart_page/cust_cart_page_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustChangeAddressPageWidget extends StatefulWidget {
  const CustChangeAddressPageWidget({Key key}) : super(key: key);

  @override
  _CustChangeAddressPageWidgetState createState() =>
      _CustChangeAddressPageWidgetState();
}

class _CustChangeAddressPageWidgetState
    extends State<CustChangeAddressPageWidget> {
  TextEditingController locationFieldController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    locationFieldController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CustomerRecord>>(
      stream: queryCustomerRecord(
        singleRecord: true,
      ),
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
        List<CustomerRecord> custChangeAddressPageCustomerRecordList =
            snapshot.data;
        // Return an empty Container when the document does not exist.
        if (snapshot.data.isEmpty) {
          return Container();
        }
        final custChangeAddressPageCustomerRecord =
            custChangeAddressPageCustomerRecordList.isNotEmpty
                ? custChangeAddressPageCustomerRecordList.first
                : null;
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
              'Change Address',
              style: FlutterFlowTheme.of(context).subtitle1.override(
                    fontFamily: 'Roboto',
                    color: FlutterFlowTheme.of(context).primaryBtnText,
                  ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 2,
          ),
          backgroundColor: Color(0xFFF1F4F8),
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Container(
                          width: double.infinity,
                          height: 900,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                              topLeft: Radius.circular(80),
                              topRight: Radius.circular(80),
                            ),
                            shape: BoxShape.rectangle,
                          ),
                          child: ListView(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 65, 0, 0),
                                    child: Text(
                                      'Your current location:',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Roboto',
                                            fontSize: 16,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    custChangeAddressPageCustomerRecord
                                        .custLocation,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: Color(0xFFFF994B),
                                          fontSize: 18,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 25, 0, 0),
                                    child: Text(
                                      'Insert your new location:',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Roboto',
                                            fontSize: 16,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 18, 0, 0),
                                    child: Container(
                                      width: 300,
                                      height: 140,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFFFCFC),
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                          color: Color(0xFF6F6F6F),
                                        ),
                                      ),
                                      child: TextFormField(
                                        controller: locationFieldController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15, 0, 0, 0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Roboto',
                                              fontSize: 16,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        45, 0, 45, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 8, 0, 0),
                                          child: Text(
                                            '0/200',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  fontSize: 12,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 75, 0, 0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        final customerUpdateData =
                                            createCustomerRecordData(
                                          uid:
                                              custChangeAddressPageCustomerRecord
                                                  .uid,
                                          custLocation:
                                              locationFieldController.text,
                                          custUniv:
                                              custChangeAddressPageCustomerRecord
                                                  .custUniv,
                                          custBalance:
                                              custChangeAddressPageCustomerRecord
                                                  .custBalance,
                                        );
                                        await custChangeAddressPageCustomerRecord
                                            .reference
                                            .update(customerUpdateData);
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                CustCartPageWidget(),
                                          ),
                                        );
                                      },
                                      text: 'Change Address',
                                      options: FFButtonOptions(
                                        width: 310,
                                        height: 40,
                                        color: Color(0xFFFF994B),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
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
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
