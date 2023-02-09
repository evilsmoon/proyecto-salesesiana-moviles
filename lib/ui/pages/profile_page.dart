import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:chronosmedic_app/data/controllers/app_controller.dart';
import 'package:chronosmedic_app/data/entities/entities.dart';
import 'package:chronosmedic_app/routers/app_routers.dart';
import 'package:chronosmedic_app/theme/app_theme.dart';
import 'package:chronosmedic_app/ui/widgets/add_sick_user.dart';
import 'package:chronosmedic_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
    this.userProfile,
  }) : super(key: key);

  final String? userProfile;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  AppController controller = Get.find<AppController>();
  UsuarioEntity? usuario;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasContainerTriggered1 = false;
  var hasContainerTriggered2 = false;

  _signOut() async {
    await controller.signOut();
    await Get.offAllNamed(AppRouters.loading);
  }

  @override
  void initState() {
    super.initState();
    usuario = controller.usuario.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppTheme.of(context).primaryBackground,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: AppTheme.of(context).primaryColor,
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      2, 2, 2, 2),
                                  child: Container(
                                    width: 60,
                                    height: 60,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: usuario?.photourl != null
                                        ? Image.memory(
                                            base64Decode(usuario!.photourl!))
                                        : Image.asset(
                                            'assets/images/UI_avatar_2@3x.png',
                                          ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 16, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 44,
                                      height: 44,
                                      decoration: BoxDecoration(
                                        color: AppTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: AppTheme.of(context)
                                              .primaryBackground,
                                          width: 2,
                                        ),
                                      ),
                                      child: CustomIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 30,
                                        buttonSize: 46,
                                        icon: Icon(
                                          Icons.edit_outlined,
                                          color: AppTheme.of(context).grayLight,
                                          size: 24,
                                        ),
                                        onPressed: () async {
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => EditProfile(
                                                userProfile: usuario!,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              12, 0, 0, 0),
                                      child: Container(
                                        width: 44,
                                        height: 44,
                                        decoration: BoxDecoration(
                                          color: AppTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color: AppTheme.of(context)
                                                .primaryBackground,
                                            width: 2,
                                          ),
                                        ),
                                        child: CustomIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30,
                                          buttonSize: 46,
                                          icon: Icon(
                                            Icons.medical_services,
                                            color:
                                                AppTheme.of(context).grayLight,
                                            size: 24,
                                          ),
                                          onPressed: () async {
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    AddSickUser(
                                                        // userProfile: usuario!,
                                                        ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              12, 0, 0, 0),
                                      child: Container(
                                        width: 44,
                                        height: 44,
                                        decoration: BoxDecoration(
                                          color: AppTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color: AppTheme.of(context)
                                                .primaryBackground,
                                            width: 2,
                                          ),
                                        ),
                                        child: CustomIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30,
                                          buttonSize: 46,
                                          icon: Icon(
                                            Icons.login_rounded,
                                            color: AppTheme.of(context)
                                                .secondaryColor,
                                            size: 24,
                                          ),
                                          onPressed: _signOut,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                usuario?.displayname ?? '',
                                style: AppTheme.of(context).title3,
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                child: Text(
                                  "${usuario?.age}",
                                  style: AppTheme.of(context).subtitle1,
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
                                  EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                              child: Text(
                                "${usuario?.email}",
                                style: AppTheme.of(context).bodyText1.override(
                                      fontFamily: 'Outfit',
                                      color: AppTheme.of(context).primaryColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Enfermedad',
                                textAlign: TextAlign.start,
                                style: AppTheme.of(context).bodyText2,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: AutoSizeText(
                                  "profilePageUsersRecord.diabetico!",
                                  style: AppTheme.of(context).title3,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Siguente Dosis',
                                    textAlign: TextAlign.start,
                                    style: AppTheme.of(context).bodyText2,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 4, 0, 0),
                                    child: Text(
                                      'Aug 20, 2021 16pm',
                                      style: AppTheme.of(context).title1,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 4,
                          thickness: 1,
                          color: AppTheme.of(context).primaryBackground,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (!(Theme.of(context).brightness ==
                                  Brightness.dark))
                                InkWell(
                                  onTap: () {
                                    Get.changeTheme(ThemeData.dark());
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 12, 24, 12),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Cambiar a modo oscuro',
                                            style:
                                                AppTheme.of(context).bodyText1,
                                          ),
                                          Container(
                                            width: 80,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: AppTheme.of(context)
                                                  .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Stack(
                                              alignment:
                                                  const AlignmentDirectional(
                                                      0, 0),
                                              children: [
                                                const Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.95, 0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 8, 0),
                                                    child: Icon(
                                                      Icons.nights_stay,
                                                      color: Color(0xFF95A1AC),
                                                      size: 20,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          -0.85, 0),
                                                  child: Container(
                                                    width: 36,
                                                    height: 36,
                                                    decoration: BoxDecoration(
                                                      color: AppTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                      boxShadow: const [
                                                        BoxShadow(
                                                          blurRadius: 4,
                                                          color:
                                                              Color(0x430B0D0F),
                                                          offset: Offset(0, 2),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                      shape: BoxShape.rectangle,
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
                              if (Theme.of(context).brightness ==
                                  Brightness.dark)
                                InkWell(
                                  onTap: () {
                                    Get.changeTheme(ThemeData.light());
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: const BoxDecoration(),
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 12, 24, 12),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Cambiar Modo Claro',
                                            style: AppTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Container(
                                            width: 80,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: AppTheme.of(context)
                                                  .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Stack(
                                              alignment:
                                                  const AlignmentDirectional(
                                                      0, 0),
                                              children: [
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          -0.9, 0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                            8, 2, 0, 0),
                                                    child: Icon(
                                                      Icons.wb_sunny_rounded,
                                                      color:
                                                          AppTheme.of(context)
                                                              .secondaryText,
                                                      size: 24,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.9, 0),
                                                  child: Container(
                                                    width: 36,
                                                    height: 36,
                                                    decoration: BoxDecoration(
                                                      color: AppTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                      boxShadow: const [
                                                        BoxShadow(
                                                          blurRadius: 4,
                                                          color:
                                                              Color(0x430B0D0F),
                                                          offset: Offset(0, 2),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                      shape: BoxShape.rectangle,
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 12, 20, 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Historial de Dosis',
                        style: AppTheme.of(context).bodyText2,
                      ),
                    ],
                  ),
                ),
                // Padding(
                //   padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 24),
                //   child: StreamBuilder<List<AppointmentsRecord>>(
                //     stream: queryAppointmentsRecord(
                //       queryBuilder: (appointmentsRecord) =>
                //           appointmentsRecord
                //               .where('appointmentTime',
                //                   isLessThan: getCurrentTimestamp)
                //               .where('appointmentPerson',
                //                   isEqualTo: currentUserReference),
                //     ),
                //     builder: (context, snapshot) {
                //       // Customize what your widget looks like when it's loading.
                //       if (!snapshot.hasData) {
                //         return Center(
                //           child: SizedBox(
                //             width: 40,
                //             height: 40,
                //             child: SpinKitPumpingHeart(
                //               color: AppTheme.of(context).primaryColor,
                //               size: 40,
                //             ),
                //           ),
                //         );
                //       }
                //       List<AppointmentsRecord>
                //           listViewAppointmentsRecordList = snapshot.data!;
                //       if (listViewAppointmentsRecordList.isEmpty) {
                //         return Center(
                //           child: EmptyListWidget(),
                //         );
                //       }
                //       return ListView.builder(
                //         padding: EdgeInsets.zero,
                //         shrinkWrap: true,
                //         scrollDirection: Axis.vertical,
                //         itemCount: listViewAppointmentsRecordList.length,
                //         itemBuilder: (context, listViewIndex) {
                //           final listViewAppointmentsRecord =
                //               listViewAppointmentsRecordList[listViewIndex];
                //           return Padding(
                //             padding:
                //                 EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                //             child: StreamBuilder<List<AppointmentsRecord>>(
                //               stream: queryAppointmentsRecord(
                //                 singleRecord: true,
                //               ),
                //               builder: (context, snapshot) {
                //                 // Customize what your widget looks like when it's loading.
                //                 if (!snapshot.hasData) {
                //                   return Center(
                //                     child: SizedBox(
                //                       width: 40,
                //                       height: 40,
                //                       child: SpinKitPumpingHeart(
                //                         color: AppTheme.of(context)
                //                             .primaryColor,
                //                         size: 40,
                //                       ),
                //                     ),
                //                   );
                //                 }
                //                 List<AppointmentsRecord>
                //                     appointmentCardAppointmentsRecordList =
                //                     snapshot.data!;
                //                 // Return an empty Container when the item does not exist.
                //                 if (snapshot.data!.isEmpty) {
                //                   return Container();
                //                 }
                //                 final appointmentCardAppointmentsRecord =
                //                     appointmentCardAppointmentsRecordList
                //                             .isNotEmpty
                //                         ? appointmentCardAppointmentsRecordList
                //                             .first
                //                         : null;
                //                 return InkWell(
                //                   onTap: () async {
                //                     await Navigator.push(
                //                       context,
                //                       MaterialPageRoute(
                //                         builder: (context) =>
                //                             AppointmentDetailsProfileWidget(
                //                           appointmentDetails:
                //                               listViewAppointmentsRecord
                //                                   .reference,
                //                         ),
                //                       ),
                //                     );
                //                   },
                //                   child: Container(
                //                     width:
                //                         MediaQuery.of(context).size.width,
                //                     decoration: BoxDecoration(
                //                       color: AppTheme.of(context)
                //                           .secondaryBackground,
                //                       boxShadow: [
                //                         BoxShadow(
                //                           blurRadius: 4,
                //                           color: Color(0x230F1113),
                //                           offset: Offset(0, 2),
                //                         )
                //                       ],
                //                       borderRadius:
                //                           BorderRadius.circular(8),
                //                     ),
                //                     child: Padding(
                //                       padding:
                //                           EdgeInsetsDirectional.fromSTEB(
                //                               12, 12, 12, 12),
                //                       child: Column(
                //                         mainAxisSize: MainAxisSize.max,
                //                         children: [
                //                           Row(
                //                             mainAxisSize: MainAxisSize.max,
                //                             mainAxisAlignment:
                //                                 MainAxisAlignment
                //                                     .spaceBetween,
                //                             children: [
                //                               Expanded(
                //                                 child: Padding(
                //                                   padding:
                //                                       EdgeInsetsDirectional
                //                                           .fromSTEB(
                //                                               4, 0, 0, 0),
                //                                   child: Text(
                //                                     listViewAppointmentsRecord
                //                                         .appointmentType!,
                //                                     style:
                //                                         AppTheme.of(context)
                //                                             .title3,
                //                                   ),
                //                                 ),
                //                               ),
                //                               Icon(
                //                                 Icons.chevron_right_rounded,
                //                                 color: AppTheme.of(context)
                //                                     .grayLight,
                //                                 size: 24,
                //                               ),
                //                             ],
                //                           ),
                //                           Padding(
                //                             padding: EdgeInsetsDirectional
                //                                 .fromSTEB(0, 8, 0, 0),
                //                             child: Row(
                //                               mainAxisSize:
                //                                   MainAxisSize.max,
                //                               children: [
                //                                 Card(
                //                                   clipBehavior: Clip
                //                                       .antiAliasWithSaveLayer,
                //                                   color: AppTheme.of(
                //                                           context)
                //                                       .primaryBackground,
                //                                   shape:
                //                                       RoundedRectangleBorder(
                //                                     borderRadius:
                //                                         BorderRadius
                //                                             .circular(20),
                //                                   ),
                //                                   child: Row(
                //                                     mainAxisSize:
                //                                         MainAxisSize.max,
                //                                     children: [
                //                                       Padding(
                //                                         padding:
                //                                             EdgeInsetsDirectional
                //                                                 .fromSTEB(
                //                                                     8,
                //                                                     4,
                //                                                     8,
                //                                                     4),
                //                                         child: Text(
                //                                           dateTimeFormat(
                //                                               'MMMEd',
                //                                               listViewAppointmentsRecord
                //                                                   .appointmentTime!),
                //                                           style: AppTheme.of(
                //                                                   context)
                //                                               .bodyText2,
                //                                         ),
                //                                       ),
                //                                       Padding(
                //                                         padding:
                //                                             EdgeInsetsDirectional
                //                                                 .fromSTEB(
                //                                                     0,
                //                                                     0,
                //                                                     8,
                //                                                     0),
                //                                         child: Text(
                //                                           dateTimeFormat(
                //                                               'jm',
                //                                               listViewAppointmentsRecord
                //                                                   .appointmentTime!),
                //                                           style: AppTheme.of(
                //                                                   context)
                //                                               .bodyText1,
                //                                         ),
                //                                       ),
                //                                     ],
                //                                   ),
                //                                 ),
                //                                 Padding(
                //                                   padding:
                //                                       EdgeInsetsDirectional
                //                                           .fromSTEB(
                //                                               8, 0, 0, 0),
                //                                   child: Text(
                //                                     'For',
                //                                     style:
                //                                         AppTheme.of(context)
                //                                             .bodyText1,
                //                                   ),
                //                                 ),
                //                                 Expanded(
                //                                   child: Padding(
                //                                     padding:
                //                                         EdgeInsetsDirectional
                //                                             .fromSTEB(
                //                                                 4, 0, 0, 0),
                //                                     child: Text(
                //                                       listViewAppointmentsRecord
                //                                           .appointmentName!,
                //                                       style: AppTheme.of(
                //                                               context)
                //                                           .bodyText1
                //                                           .override(
                //                                             fontFamily:
                //                                                 'Outfit',
                //                                             color: AppTheme.of(
                //                                                     context)
                //                                                 .secondaryColor,
                //                                           ),
                //                                     ),
                //                                   ),
                //                                 ),
                //                               ],
                //                             ),
                //                           ),
                //                         ],
                //                       ),
                //                     ),
                //                   ),
                //                 );
                //               },
                //             ),
                //           );
                //         },
                //       );
                //     },
                //   ),
                // ),
              ],
            ),
          ],
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
    //     final profilePageUsersRecord = snapshot.data!;
    //     return ;
    //   },
    // );
  }
}
