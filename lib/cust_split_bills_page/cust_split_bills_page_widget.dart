import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/next_confirmation_split_widget.dart';
import '../flutter_flow/flutter_flow_checkbox_group.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustSplitBillsPageWidget extends StatefulWidget {
  const CustSplitBillsPageWidget({
    Key key,
    this.money,
  }) : super(key: key);

  final double money;

  @override
  _CustSplitBillsPageWidgetState createState() =>
      _CustSplitBillsPageWidgetState();
}

class _CustSplitBillsPageWidgetState extends State<CustSplitBillsPageWidget> {
  List<String> checkboxGroupValues;
  SplitBillRecord you;
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
          'Split Bills',
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
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 25, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Total Bills: ',
                          textAlign: TextAlign.end,
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Roboto',
                                    color: Color(0xFF030000),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                          child: Text(
                            'RM ${widget.money.toString()}',
                            textAlign: TextAlign.end,
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Roboto',
                                      color: Color(0xFFFF994B),
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                        child: Text(
                          'Select friend to split bills',
                          style: FlutterFlowTheme.of(context).title3,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 25,
                    thickness: 3,
                    indent: 20,
                    endIndent: 20,
                    color: Colors.white,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      AuthUserStreamWidget(
                        child: FlutterFlowCheckboxGroup(
                          initiallySelected: checkboxGroupValues ??= [],
                          options:
                              (currentUserDocument?.friendList?.toList() ?? [])
                                  .toList(),
                          onChanged: (val) =>
                              setState(() => checkboxGroupValues = val),
                          activeColor: Color(0xFFFF994B),
                          checkColor: Colors.white,
                          checkboxBorderColor: Color(0xFF95A1AC),
                          textStyle:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Roboto',
                                    fontSize: 18,
                                  ),
                          labelPadding:
                              EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                          itemPadding:
                              EdgeInsetsDirectional.fromSTEB(15, 0, 0, 10),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 75, 0, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        final splitBillCreateData = {
                          ...createSplitBillRecordData(
                            uid: getCurrentTimestamp.toString(),
                            oriPrice: widget.money,
                            splitPrice: functions.splitBill(
                                widget.money, checkboxGroupValues.length),
                            emailReq: currentUserEmail,
                            reqReq: true,
                            accReq: false,
                            rejReq: false,
                            timestamp: getCurrentTimestamp,
                            nameReq: currentUserDisplayName,
                          ),
                          'emailAcc': checkboxGroupValues,
                        };
                        var splitBillRecordReference =
                            SplitBillRecord.collection.doc();
                        await splitBillRecordReference.set(splitBillCreateData);
                        you = SplitBillRecord.getDocumentFromData(
                            splitBillCreateData, splitBillRecordReference);
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: MediaQuery.of(context).viewInsets,
                              child: NextConfirmationSplitWidget(
                                email: currentUserEmail,
                                uid: you.uid,
                                money: widget.money,
                              ),
                            );
                          },
                        );

                        setState(() {});
                      },
                      text: 'Confirm',
                      options: FFButtonOptions(
                        width: 310,
                        height: 40,
                        color: Color(0xFFFF994B),
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Roboto',
                                  color: Colors.white,
                                  fontSize: 18,
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
