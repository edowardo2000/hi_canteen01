import '../backend/backend.dart';
import '../cust_cart_page/cust_cart_page_widget.dart';
import '../flutter_flow/flutter_flow_count_controller.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CustViewFoodPageWidget extends StatefulWidget {
  const CustViewFoodPageWidget({
    Key key,
    this.uidFood,
  }) : super(key: key);

  final String uidFood;

  @override
  _CustViewFoodPageWidgetState createState() => _CustViewFoodPageWidgetState();
}

class _CustViewFoodPageWidgetState extends State<CustViewFoodPageWidget> {
  TextEditingController textController;
  int countControllerValue;
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
          'Back',
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
          child: StreamBuilder<List<FoodRecord>>(
            stream: queryFoodRecord(
              queryBuilder: (foodRecord) =>
                  foodRecord.where('uid', isEqualTo: widget.uidFood),
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
              List<FoodRecord> listViewFoodRecordList = snapshot.data;
              final listViewFoodRecord = listViewFoodRecordList.isNotEmpty
                  ? listViewFoodRecordList.first
                  : null;
              return ListView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 210,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 180,
                              height: 180,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                                image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: Image.network(
                                    'https://tse1.mm.bing.net/th?id=OIP.q7GO6j_hjpfE1ePnqukeIwHaFo&pid=Api&P=0&w=210&h=160',
                                  ).image,
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(39, 0, 30, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Hamburger',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: Color(0xFF0D0000),
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      106, 0, 0, 0),
                                  child: Text(
                                    'RM ${listViewFoodRecord.foodPrice.toString()}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: Color(0xFFFF994B),
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(39, 0, 30, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-0.73, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 5, 0, 0),
                                    child: Text(
                                      'Stock Available',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: Color(0xFF888888),
                                            fontSize: 16,
                                          ),
                                    ),
                                  ),
                                ),
                                Text(
                                  listViewFoodRecord.foodStock.toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: Color(0xFFFF994B),
                                        fontSize: 18,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(39, 5, 30, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                'Quantity',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: Color(0xFF888888),
                                      fontSize: 16,
                                    ),
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: Color(0xFFFF994B),
                                  width: 1,
                                ),
                              ),
                              child: FlutterFlowCountController(
                                decrementIconBuilder: (enabled) => FaIcon(
                                  FontAwesomeIcons.minus,
                                  color: enabled
                                      ? Color(0xFF070300)
                                      : Color(0xFFEEEEEE),
                                  size: 17,
                                ),
                                incrementIconBuilder: (enabled) => FaIcon(
                                  FontAwesomeIcons.plus,
                                  color: enabled
                                      ? Color(0xFF0D0202)
                                      : Color(0xFFEEEEEE),
                                  size: 17,
                                ),
                                countBuilder: (count) => Text(
                                  count.toString(),
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                count: countControllerValue ??= 1,
                                updateCount: (count) => setState(
                                    () => countControllerValue = count),
                                stepSize: 1,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    15, 0, 15, 0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 5,
                        thickness: 2,
                        indent: 20,
                        endIndent: 20,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 235, 0),
                        child: Text(
                          'Description',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Roboto',
                                    color: Color(0xFF888888),
                                    fontSize: 16,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 7, 0, 0),
                        child: Text(
                          listViewFoodRecord.description,
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                      Divider(
                        height: 6,
                        thickness: 2,
                        indent: 20,
                        endIndent: 20,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 196, 0),
                        child: Text(
                          'Notes (Optional)',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Roboto',
                                    color: Color(0xFF888888),
                                    fontSize: 16,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 15, 15, 0),
                        child: Container(
                          width: 294,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(11),
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          child: TextFormField(
                            controller: textController,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Eg: pls add more portion',
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
                                  EdgeInsetsDirectional.fromSTEB(15, 0, 0, 15),
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyText2.override(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 75, 0, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CustCartPageWidget(
                                  uidFood: widget.uidFood,
                                  notes: textController.text,
                                  foodPrice: functions.totalPrice(
                                      listViewFoodRecord.foodPrice,
                                      countControllerValue),
                                  totalStock: countControllerValue,
                                  image: listViewFoodRecord.photo,
                                  foodName: listViewFoodRecord.foodName,
                                  uidCanteen: listViewFoodRecord.uidUser,
                                ),
                              ),
                            );
                          },
                          text: 'Add to cart',
                          options: FFButtonOptions(
                            width: 310,
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
              );
            },
          ),
        ),
      ),
    );
  }
}
