import '../all_signin_page/all_signin_page_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../cust_verification_reg_email/cust_verification_reg_email_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AllSignupPageWidget extends StatefulWidget {
  const AllSignupPageWidget({Key key}) : super(key: key);

  @override
  _AllSignupPageWidgetState createState() => _AllSignupPageWidgetState();
}

class _AllSignupPageWidgetState extends State<AllSignupPageWidget> {
  TextEditingController emailFieldController;
  TextEditingController nameFieldController;
  TextEditingController passwordField1Controller;
  bool passwordField1Visibility;
  TextEditingController passwordField2Controller;
  bool passwordField2Visibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailFieldController = TextEditingController();
    nameFieldController = TextEditingController();
    passwordField1Controller = TextEditingController();
    passwordField1Visibility = false;
    passwordField2Controller = TextEditingController();
    passwordField2Visibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: 219,
                decoration: BoxDecoration(
                  color: Color(0xFFFF994B),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(78),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(245, 20, 0, 0),
                      child: Text(
                        'HiCanteen',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Satisfy',
                              color: Colors.white,
                              fontSize: 17,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(179, 90, 0, 0),
                      child: Text(
                        'Sign Up',
                        style: FlutterFlowTheme.of(context).title1.override(
                              fontFamily: 'Roboto',
                              color: Colors.white,
                              fontSize: 45,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 210, 0),
                            child: Text(
                              'Full Name',
                              style:
                                  FlutterFlowTheme.of(context).title3.override(
                                        fontFamily: 'Roboto',
                                        fontSize: 18,
                                      ),
                            ),
                          ),
                          Container(
                            width: 290,
                            height: 46,
                            decoration: BoxDecoration(
                              color: Color(0xFFB7B7B7),
                              borderRadius: BorderRadius.circular(21),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      14, 0, 0, 0),
                                  child: Icon(
                                    Icons.person,
                                    color: Color(0xFF747171),
                                    size: 20,
                                  ),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: nameFieldController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'name',
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
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              14, 0, 0, 0),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Roboto',
                                          fontSize: 15,
                                        ),
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 220, 0),
                            child: Text(
                              'Email',
                              style:
                                  FlutterFlowTheme.of(context).title3.override(
                                        fontFamily: 'Roboto',
                                        fontSize: 18,
                                      ),
                            ),
                          ),
                          Container(
                            width: 290,
                            height: 46,
                            decoration: BoxDecoration(
                              color: Color(0xFFB7B7B7),
                              borderRadius: BorderRadius.circular(21),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      14, 0, 0, 0),
                                  child: Icon(
                                    Icons.email,
                                    color: Color(0xFF747171),
                                    size: 20,
                                  ),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: emailFieldController,
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
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              14, 0, 0, 0),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Roboto',
                                          fontSize: 15,
                                        ),
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 185, 0),
                            child: Text(
                              'Password',
                              textAlign: TextAlign.start,
                              style:
                                  FlutterFlowTheme.of(context).title3.override(
                                        fontFamily: 'Roboto',
                                        fontSize: 18,
                                      ),
                            ),
                          ),
                          Container(
                            width: 290,
                            height: 46,
                            decoration: BoxDecoration(
                              color: Color(0xFFB7B7B7),
                              borderRadius: BorderRadius.circular(21),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      14, 0, 0, 0),
                                  child: Icon(
                                    Icons.vpn_key,
                                    color: Color(0xFF747171),
                                    size: 20,
                                  ),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: passwordField1Controller,
                                    obscureText: !passwordField1Visibility,
                                    decoration: InputDecoration(
                                      hintText: 'password',
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
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              14, 5, 0, 0),
                                      suffixIcon: InkWell(
                                        onTap: () => setState(
                                          () => passwordField1Visibility =
                                              !passwordField1Visibility,
                                        ),
                                        focusNode:
                                            FocusNode(skipTraversal: true),
                                        child: Icon(
                                          passwordField1Visibility
                                              ? Icons.visibility_outlined
                                              : Icons.visibility_off_outlined,
                                          color: Color(0xFF757575),
                                          size: 22,
                                        ),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Roboto',
                                          fontSize: 15,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 110, 0),
                            child: Text(
                              'Confirm Password',
                              textAlign: TextAlign.start,
                              style:
                                  FlutterFlowTheme.of(context).title3.override(
                                        fontFamily: 'Roboto',
                                        fontSize: 18,
                                      ),
                            ),
                          ),
                          Container(
                            width: 290,
                            height: 46,
                            decoration: BoxDecoration(
                              color: Color(0xFFB7B7B7),
                              borderRadius: BorderRadius.circular(21),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      14, 0, 0, 0),
                                  child: Icon(
                                    Icons.vpn_key,
                                    color: Color(0xFF747171),
                                    size: 20,
                                  ),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: passwordField2Controller,
                                    obscureText: !passwordField2Visibility,
                                    decoration: InputDecoration(
                                      hintText: 'password',
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
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              14, 5, 0, 0),
                                      suffixIcon: InkWell(
                                        onTap: () => setState(
                                          () => passwordField2Visibility =
                                              !passwordField2Visibility,
                                        ),
                                        focusNode:
                                            FocusNode(skipTraversal: true),
                                        child: Icon(
                                          passwordField2Visibility
                                              ? Icons.visibility_outlined
                                              : Icons.visibility_off_outlined,
                                          color: Color(0xFF757575),
                                          size: 22,
                                        ),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Roboto',
                                          fontSize: 15,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 35, 0, 15),
                            child: FFButtonWidget(
                              onPressed: () async {
                                // Signupemail
                                if (passwordField1Controller?.text !=
                                    passwordField2Controller?.text) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Passwords don\'t match!',
                                      ),
                                    ),
                                  );
                                  return;
                                }

                                final user = await createAccountWithEmail(
                                  context,
                                  emailFieldController.text,
                                  passwordField1Controller.text,
                                );
                                if (user == null) {
                                  return;
                                }

                                final userCreateData = createUserRecordData(
                                  displayName: nameFieldController.text,
                                );
                                await UserRecord.collection
                                    .doc(user.uid)
                                    .update(userCreateData);

                                final customerCreateData =
                                    createCustomerRecordData(
                                  uid: currentUserUid,
                                );
                                await CustomerRecord.collection
                                    .doc()
                                    .set(customerCreateData);
                                await sendEmailVerification();
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        CustVerificationRegEmailWidget(),
                                  ),
                                );
                              },
                              text: 'Sign Up',
                              options: FFButtonOptions(
                                width: 290,
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
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already have an account? ',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                              InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          AllSigninPageWidget(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Sign In here!',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: Color(0xFFFF994B),
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
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
  }
}
