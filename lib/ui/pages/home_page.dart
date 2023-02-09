import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:chronosmedic_app/data/controllers/app_controller.dart';
import 'package:chronosmedic_app/data/entities/entities.dart';
import 'package:chronosmedic_app/theme/app_theme.dart';
import 'package:chronosmedic_app/theme/util.dart';
import 'package:chronosmedic_app/ui/widgets/book_appointment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  AppController controller = Get.find<AppController>();
  UsuarioEntity? usuario;
  @override
  void initState() {
    controller.getUsuario();
    usuario = controller.usuario.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppTheme.of(context).primaryBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: AppTheme.of(context).primaryColor,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                        child: Container(
                          width: 60,
                          height: 60,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: usuario?.photourl != null
                              ? Image.memory(base64Decode(usuario!.photourl!))
                              : Image.asset(
                                  'assets/images/UI_avatar_2@3x.png',
                                ),
                        ),
                      ),
                    ),
                    // MainLogoWidget(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: Text(
                        usuario?.sex == 'Hombre' ? 'Bienvenido' : 'Bienvenida',
                        style: AppTheme.of(context).title1,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                      child: Text(
                        usuario?.displayname ?? "Users",
                        style: AppTheme.of(context).title2.override(
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                      child: Image.asset(
                        'assets/images/waving-hand-sign_emoji-modifier-fitzpatrick-type-5_1f44b_1f3fe.png',
                        width: 36,
                        height: 36,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                      child: Text(
                        'Nuestos Servicios',
                        style: AppTheme.of(context).bodyText1,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [],
                  // children: List.generate(
                  //     nextAppointmentSectionAppointmentsRecordList.length,
                  //     (nextAppointmentSectionIndex) {
                  //   final nextAppointmentSectionAppointmentsRecord =
                  //       nextAppointmentSectionAppointmentsRecordList[
                  //           nextAppointmentSectionIndex];
                  //   return Padding(
                  //     padding:
                  //         const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                  //     child: InkWell(
                  //       onTap: () async {
                  //         // await Navigator.push(
                  //         //   context,
                  //         //   MaterialPageRoute(
                  //         //     builder: (context) =>
                  //         //         AppointmentDetailsWidget(
                  //         //       appointmentDetails:
                  //         //           appointmentCardAppointmentsRecord
                  //         //               .reference,
                  //         //     ),
                  //         //   ),
                  //         // );
                  //       },
                  //       child: Container(
                  //         width: MediaQuery.of(context).size.width * 0.86,
                  //         decoration: BoxDecoration(
                  //           color: AppTheme.of(context).secondaryBackground,
                  //           boxShadow: [
                  //             BoxShadow(
                  //               blurRadius: 4,
                  //               color: Color(0x230E151B),
                  //               offset: Offset(0, 2),
                  //             )
                  //           ],
                  //           borderRadius: BorderRadius.circular(8),
                  //         ),
                  //         child: Padding(
                  //           padding: const EdgeInsetsDirectional.fromSTEB(
                  //               12, 12, 12, 12),
                  //           child: Column(
                  //             mainAxisSize: MainAxisSize.max,
                  //             children: [
                  //               Row(
                  //                 mainAxisSize: MainAxisSize.max,
                  //                 mainAxisAlignment:
                  //                     MainAxisAlignment.spaceBetween,
                  //                 children: [
                  //                   Expanded(
                  //                     child: Padding(
                  //                       padding: EdgeInsetsDirectional.fromSTEB(
                  //                           4, 0, 0, 0),
                  //                       child: Text(
                  //                         nextAppointmentSectionAppointmentsRecord
                  //                             .appointmentType!,
                  //                         style: AppTheme.of(context).title3,
                  //                       ),
                  //                     ),
                  //                   ),
                  //                   Icon(
                  //                     Icons.chevron_right_rounded,
                  //                     color: AppTheme.of(context).grayLight,
                  //                     size: 24,
                  //                   ),
                  //                 ],
                  //               ),
                  //               Row(
                  //                 mainAxisSize: MainAxisSize.max,
                  //                 mainAxisAlignment:
                  //                     MainAxisAlignment.spaceBetween,
                  //                 children: [
                  //                   Expanded(
                  //                     child: Padding(
                  //                       padding: EdgeInsetsDirectional.fromSTEB(
                  //                           4, 4, 0, 0),
                  //                       child: AutoSizeText(
                  //                         nextAppointmentSectionAppointmentsRecord
                  //                             .appointmentDescription!,
                  //                         style: AppTheme.of(context).bodyText1,
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //               Padding(
                  //                 padding: EdgeInsetsDirectional.fromSTEB(
                  //                     0, 8, 0, 0),
                  //                 child: Row(
                  //                   mainAxisSize: MainAxisSize.max,
                  //                   mainAxisAlignment: MainAxisAlignment.center,
                  //                   children: [
                  //                     Card(
                  //                       clipBehavior:
                  //                           Clip.antiAliasWithSaveLayer,
                  //                       color: AppTheme.of(context)
                  //                           .primaryBackground,
                  //                       shape: RoundedRectangleBorder(
                  //                         borderRadius:
                  //                             BorderRadius.circular(20),
                  //                       ),
                  //                       child: Padding(
                  //                         padding:
                  //                             EdgeInsetsDirectional.fromSTEB(
                  //                                 8, 4, 8, 4),
                  //                         child: Row(
                  //                           mainAxisSize: MainAxisSize.max,
                  //                           children: [
                  //                             Padding(
                  //                               padding: EdgeInsetsDirectional
                  //                                   .fromSTEB(8, 4, 2, 4),
                  //                               child: Text(
                  //                                 dateTimeFormat(
                  //                                     'MMMEd',
                  //                                     nextAppointmentSectionAppointmentsRecord
                  //                                         .appointmentTime!),
                  //                                 style: AppTheme.of(context)
                  //                                     .bodyText1,
                  //                               ),
                  //                             ),
                  //                             Padding(
                  //                               padding: EdgeInsetsDirectional
                  //                                   .fromSTEB(2, 4, 8, 4),
                  //                               child: Text(
                  //                                 dateTimeFormat(
                  //                                     'jm',
                  //                                     nextAppointmentSectionAppointmentsRecord
                  //                                         .appointmentTime!),
                  //                                 style: AppTheme.of(context)
                  //                                     .bodyText2,
                  //                               ),
                  //                             ),
                  //                           ],
                  //                         ),
                  //                       ),
                  //                     ),
                  //                     Padding(
                  //                       padding: EdgeInsetsDirectional.fromSTEB(
                  //                           8, 0, 0, 0),
                  //                       child: Text(
                  //                         'For',
                  //                         style: AppTheme.of(context).bodyText1,
                  //                       ),
                  //                     ),
                  //                     Expanded(
                  //                       child: Padding(
                  //                         padding:
                  //                             EdgeInsetsDirectional.fromSTEB(
                  //                                 4, 0, 0, 0),
                  //                         child: Text(
                  //                           nextAppointmentSectionAppointmentsRecord
                  //                               .appointmentName!,
                  //                           style: AppTheme.of(context)
                  //                               .bodyText1
                  //                               .override(
                  //                                 fontFamily: 'Outfit',
                  //                                 color: AppTheme.of(context)
                  //                                     .secondaryColor,
                  //                               ),
                  //                         ),
                  //                       ),
                  //                     ),
                  //                   ],
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     // child: StreamBuilder<AppointmentsRecord>(
                  //     //   stream: AppointmentsRecord.getDocument(
                  //     //       nextAppointmentSectionAppointmentsRecord
                  //     //           .reference),
                  //     //   builder: (context, snapshot) {
                  //     //     // Customize what your widget looks like when it's loading.
                  //     //     if (!snapshot.hasData) {
                  //     //       return Center(
                  //     //         child: SizedBox(
                  //     //           width: 40,
                  //     //           height: 40,
                  //     //           child: SpinKitPumpingHeart(
                  //     //             color: AppTheme.of(context).primaryColor,
                  //     //             size: 40,
                  //     //           ),
                  //     //         ),
                  //     //       );
                  //     //     }
                  //     //     final appointmentCardAppointmentsRecord =
                  //     //         snapshot.data!;
                  //     //     return ;
                  //     //   },
                  //   );
                  // }),
                ),
                // child: StreamBuilder<List<AppointmentsRecord>>(
                //   stream: queryAppointmentsRecord(
                //     queryBuilder: (appointmentsRecord) => appointmentsRecord
                //         .where('appointmentPerson',
                //             isEqualTo: currentUserReference)
                //         .orderBy('appointmentTime'),
                //     limit: 1,
                //   ),
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
                //     List<dynamic> nextAppointmentSectionAppointmentsRecordList =
                //         snapshot.data!;
                //     if (nextAppointmentSectionAppointmentsRecordList.isEmpty) {
                //       return Center(
                //         child: Image.asset(
                //           'assets/images/noUpcomingAppointments.png',
                //           width: MediaQuery.of(context).size.width * 0.8,
                //         ),
                //       );
                //     }
                //     return ;
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Material(
                            color: Colors.transparent,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.86,
                              height: 100,
                              decoration: BoxDecoration(
                                color: AppTheme.of(context).tertiaryColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: InkWell(
                                onTap: () async {
                                  // await showModalBottomSheet(
                                  //   isScrollControlled: true,
                                  //   backgroundColor: Colors.transparent,
                                  //   context: context,
                                  //   builder: (context) {
                                  //     return Padding(
                                  //       padding:
                                  //           MediaQuery.of(context).viewInsets,
                                  //       child: Container(
                                  //         height: MediaQuery.of(context)
                                  //                 .size
                                  //                 .height *
                                  //             1,
                                  //         child: BookAppointment(
                                  //             // userProfile:
                                  //             //     homePageUsersRecord.reference,
                                  //             ),
                                  //       ),
                                  //     );
                                  //   },
                                  // ).then((value) => setState(() {}));
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              15, 0, 0, 0),
                                      child: Image.asset(
                                        'assets/images/iconCalendar.png',
                                        width: 60,
                                        height: 60,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(10, 15, 10, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Visualizar Calentario',
                                              textAlign: TextAlign.start,
                                              style: AppTheme.of(context)
                                                  .title3
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: AppTheme.of(context)
                                                        .alternate,
                                                    fontSize: 19,
                                                  ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 8),
                                                child: AutoSizeText(
                                                  'Observar cuales dias tomas tu medicamento000.',
                                                  style: AppTheme.of(context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xB4FFFFFF),
                                                      ),
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
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                            child: InkWell(
                              onTap: () async {
                                // await launchURL('tel:1234567890');
                              },
                              child: Material(
                                color: Colors.transparent,
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.86,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: AppTheme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(15, 0, 0, 0),
                                        child: Image.asset(
                                          'assets/images/iconPhone.png',
                                          width: 60,
                                          height: 60,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 15, 10, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Contactanos',
                                                textAlign: TextAlign.start,
                                                style: AppTheme.of(context)
                                                    .title3
                                                    .override(
                                                      fontFamily: 'Outfit',
                                                      color:
                                                          AppTheme.of(context)
                                                              .alternate,
                                                    ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 8),
                                                  child: AutoSizeText(
                                                    'Comunicate con nuestras oficinas.',
                                                    style: AppTheme.of(context)
                                                        .bodyText2
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              Color(0xB4FFFFFF),
                                                        ),
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
                              ),
                            ),
                          ),
                          // Padding(
                          //   padding:
                          //       EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                          //   child: InkWell(
                          //     onTap: () async {
                          //       // await launchURL(
                          //       //     'mailto:contact@health.ai.demo');
                          //     },
                          //     child: Material(
                          //       color: Colors.transparent,
                          //       elevation: 3,
                          //       shape: RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.circular(8),
                          //       ),
                          //       child: Container(
                          //         width:
                          //             MediaQuery.of(context).size.width * 0.86,
                          //         height: 100,
                          //         decoration: BoxDecoration(
                          //           color: AppTheme.of(context).secondaryColor,
                          //           borderRadius: BorderRadius.circular(8),
                          //         ),
                          //         child: Row(
                          //           mainAxisSize: MainAxisSize.max,
                          //           children: [
                          //             Padding(
                          //               padding: const EdgeInsetsDirectional
                          //                   .fromSTEB(15, 0, 0, 0),
                          //               child: Image.asset(
                          //                 'assets/images/iconEmail.png',
                          //                 width: 60,
                          //                 height: 60,
                          //                 fit: BoxFit.cover,
                          //               ),
                          //             ),
                          //             Expanded(
                          //               child: Padding(
                          //                 padding:
                          //                     EdgeInsetsDirectional.fromSTEB(
                          //                         10, 15, 10, 0),
                          //                 child: Column(
                          //                   mainAxisSize: MainAxisSize.max,
                          //                   mainAxisAlignment:
                          //                       MainAxisAlignment.center,
                          //                   crossAxisAlignment:
                          //                       CrossAxisAlignment.start,
                          //                   children: [
                          //                     Text(
                          //                       'Email Us',
                          //                       textAlign: TextAlign.start,
                          //                       style: AppTheme.of(context)
                          //                           .title3
                          //                           .override(
                          //                             fontFamily: 'Outfit',
                          //                             color:
                          //                                 AppTheme.of(context)
                          //                                     .alternate,
                          //                           ),
                          //                     ),
                          //                     Expanded(
                          //                       child: Padding(
                          //                         padding: EdgeInsetsDirectional
                          //                             .fromSTEB(0, 0, 0, 8),
                          //                         child: AutoSizeText(
                          //                           'Send us an email and we will get back to you within 2 days.',
                          //                           style: AppTheme.of(context)
                          //                               .bodyText2
                          //                               .override(
                          //                                 fontFamily: 'Outfit',
                          //                                 color:
                          //                                     Color(0xB4FFFFFF),
                          //                               ),
                          //                         ),
                          //                       ),
                          //                     ),
                          //                   ],
                          //                 ),
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
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
    // return StreamBuilder<UsersRecord>(
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
    //     final homePageUsersRecord = snapshot.data!;
    //     return ;
    //   },
    // );
  }
}
