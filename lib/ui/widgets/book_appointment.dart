import 'dart:ui';

import 'package:chronosmedic_app/theme/app_theme.dart';
import 'package:chronosmedic_app/theme/util.dart';
import 'package:chronosmedic_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class BookAppointment extends StatefulWidget {
  const BookAppointment({
    Key? key,
    // this.userProfile,
  }) : super(key: key);

  // final DocumentReference? userProfile;

  @override
  _BookAppointmentState createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  DateTime? datePicked;
  String? dropDownValue;
  TextEditingController? personsNameController;
  TextEditingController? problemDescriptionController;

  @override
  void initState() {
    super.initState();

    problemDescriptionController = TextEditingController();
  }

  @override
  void dispose() {
    personsNameController?.dispose();
    problemDescriptionController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 3,
          sigmaY: 3,
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xD60E151B),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 710,
                decoration: BoxDecoration(
                  color: AppTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Divider(
                            thickness: 3,
                            indent: 150,
                            endIndent: 150,
                            color: AppTheme.of(context).primaryBackground,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                            child: Text(
                              'Book Appointment',
                              style: AppTheme.of(context).title3,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 0),
                                  child: Text(
                                    'Fill out the information below in order to book your appointment with our office.',
                                    style: AppTheme.of(context).bodyText2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                            child: Text(
                              'Emails will be sent to:',
                              style: AppTheme.of(context).bodyText1,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 4, 0, 12),
                            child: Text(
                              "currentUserEmail",
                              style: AppTheme.of(context).subtitle1.override(
                                    fontFamily: 'Outfit',
                                    color: AppTheme.of(context).primaryColor,
                                  ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                            child: TextFormField(
                              controller: personsNameController ??=
                                  TextEditingController(
                                text: 'columnUsersRecord.displayName',
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Booking For',
                                labelStyle: AppTheme.of(context).bodyText2,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        AppTheme.of(context).primaryBackground,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        AppTheme.of(context).primaryBackground,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor:
                                    AppTheme.of(context).primaryBackground,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    20, 24, 0, 24),
                              ),
                              style: AppTheme.of(context).subtitle2.override(
                                    fontFamily: 'Outfit',
                                    color: AppTheme.of(context).primaryText,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                            child: CustomDropDown<String>(
                              options: [
                                'Doctors Visit',
                                'Routine Checkup',
                                'Scan/Update'
                              ],
                              onChanged: (val) =>
                                  setState(() => dropDownValue = val),
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: 60,
                              textStyle:
                                  AppTheme.of(context).subtitle2.override(
                                        fontFamily: 'Outfit',
                                        color: AppTheme.of(context).primaryText,
                                      ),
                              hintText: 'Type of Appointment',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: AppTheme.of(context).grayLight,
                                size: 15,
                              ),
                              fillColor: AppTheme.of(context).primaryBackground,
                              elevation: 3,
                              borderColor:
                                  AppTheme.of(context).primaryBackground,
                              borderWidth: 2,
                              borderRadius: 8,
                              margin:
                                  EdgeInsetsDirectional.fromSTEB(20, 4, 16, 4),
                              hidesUnderline: true,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                            child: TextFormField(
                              controller: problemDescriptionController,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'What\'s the problem?',
                                labelStyle: AppTheme.of(context).bodyText2,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        AppTheme.of(context).primaryBackground,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        AppTheme.of(context).primaryBackground,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor:
                                    AppTheme.of(context).primaryBackground,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    20, 24, 0, 24),
                              ),
                              style: AppTheme.of(context).bodyText1,
                              textAlign: TextAlign.start,
                              maxLines: 8,
                              keyboardType: TextInputType.multiline,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                            child: InkWell(
                              onTap: () async {
                                // await DatePicker.showDateTimePicker(
                                //   context,
                                //   showTitleActions: true,
                                //   onConfirm: (date) {
                                //     setState(() => datePicked = date);
                                //   },
                                //   currentTime: getCurrentTimestamp,
                                //   minTime: getCurrentTimestamp,
                                // );
                              },
                              child: Material(
                                color: Colors.transparent,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color:
                                        AppTheme.of(context).primaryBackground,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: AppTheme.of(context)
                                          .primaryBackground,
                                      width: 2,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(20, 0, 0, 0),
                                              child: Text(
                                                'Choose Date & Time',
                                                style: AppTheme.of(context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Outfit',
                                                      fontSize: 12,
                                                    ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20, 4, 0, 0),
                                                  child: Text(
                                                    dateTimeFormat(
                                                        'MMMEd', datePicked),
                                                    style: AppTheme.of(context)
                                                        .bodyText2
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: AppTheme.of(
                                                                  context)
                                                              .tertiaryColor,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(2, 4, 0, 0),
                                                  child: Text(
                                                    dateTimeFormat(
                                                        'jm', datePicked),
                                                    style: AppTheme.of(context)
                                                        .bodyText2
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: AppTheme.of(
                                                                  context)
                                                              .tertiaryColor,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 8, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CustomIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 30,
                                              buttonSize: 46,
                                              icon: Icon(
                                                Icons.date_range_outlined,
                                                color: AppTheme.of(context)
                                                    .grayLight,
                                                size: 20,
                                              ),
                                              onPressed: () {
                                                print('IconButton pressed ...');
                                              },
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
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 24, 0, 20),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Button(
                                  onPressed: () async {
                                    Navigator.pop(context);
                                  },
                                  text: 'Cancel',
                                  options: ButtonOptions(
                                    width: 100,
                                    height: 50,
                                    color:
                                        AppTheme.of(context).primaryBackground,
                                    textStyle: AppTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Outfit',
                                          color:
                                              AppTheme.of(context).primaryText,
                                          fontWeight: FontWeight.w500,
                                        ),
                                    elevation: 0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                ),
                                Button(
                                  onPressed: () async {
                                    // final appointmentsCreateData =
                                    //     createAppointmentsRecordData(
                                    //   appointmentType: dropDownValue,
                                    //   appointmentTime: datePicked,
                                    //   appointmentName:
                                    //       personsNameController?.text ?? '',
                                    //   appointmentDescription:
                                    //       problemDescriptionController!.text,
                                    //   appointmentEmail: currentUserEmail,
                                    //   appointmentPerson: currentUserReference,
                                    // );
                                    // await AppointmentsRecord.collection
                                    //     .doc()
                                    //     .set(appointmentsCreateData);
                                    // Navigator.pop(context);
                                  },
                                  text: 'Book Now',
                                  options: ButtonOptions(
                                    width: 170,
                                    height: 50,
                                    color: AppTheme.of(context).primaryColor,
                                    textStyle:
                                        AppTheme.of(context).subtitle2.override(
                                              fontFamily: 'Outfit',
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                    elevation: 3,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                    // child: StreamBuilder<UsersRecord>(
                    //   stream: UsersRecord.getDocument(currentUserReference!),
                    //   builder: (context, snapshot) {
                    //     // Customize what your widget looks like when it's loading.
                    //     if (!snapshot.hasData) {
                    //       return Center(
                    //         child: SizedBox(
                    //           width: 40,
                    //           height: 40,
                    //           child: SpinKitPumpingHeart(
                    //             color: AppTheme.of(context).primaryColor,
                    //             size: 40,
                    //           ),
                    //         ),
                    //       );
                    //     }
                    //     final columnUsersRecord = snapshot.data!;
                    //     return ;
                    //   },
                    // ),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
