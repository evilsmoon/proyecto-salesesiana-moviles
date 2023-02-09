import 'package:chronosmedic_app/theme/app_theme.dart';
import 'package:chronosmedic_app/theme/util.dart';
import 'package:chronosmedic_app/ui/utils/upload_media.dart';
import 'package:chronosmedic_app/ui/widgets/add_sick_user.dart';
import 'package:chronosmedic_app/ui/widgets/book_appointment.dart';
import 'package:chronosmedic_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppointmentsPage extends StatefulWidget {
  const MyAppointmentsPage({Key? key}) : super(key: key);

  @override
  _MyAppointmentsPageState createState() => _MyAppointmentsPageState();
}

class _MyAppointmentsPageState extends State<MyAppointmentsPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppTheme.of(context).primaryBackground,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) {
              return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: Container(
                  height: double.infinity,
                  child: AddSickUser(),
                ),
              );
            },
          ).then((value) => setState(() {}));
        },
        backgroundColor: AppTheme.of(context).primaryColor,
        elevation: 8,
        child: Icon(
          Icons.add_rounded,
          color: AppTheme.of(context).textColor,
          size: 36,
        ),
      ),
      appBar: AppBar(
        backgroundColor: AppTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        title: Text(
          'Medicamentos',
          style: AppTheme.of(context).title1,
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Mis Medcamentos',
                    style: AppTheme.of(context).bodyText2,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: controller.usuario.value.enfermedadesUsu.length,
                itemBuilder: (context, i) {
                  // final listViewAppointmentsRecord =
                  //     listViewAppointmentsRecordList[listViewIndex];
                  return Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                    child: InkWell(
                      onTap: () async {
                        // await Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) =>
                        //         AppointmentDetailsWidget(
                        //       appointmentDetails:
                        //           appointmentCardAppointmentsRecord
                        //               .reference,
                        //     ),
                        //   ),
                        // );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 150,
                        decoration: BoxDecoration(
                          color: AppTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              color: Color(0x230E151B),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4, 0, 0, 0),
                                      child: Text(
                                        "${controller.usuario.value.enfermedadesUsu[i].nombre}",
                                        style: AppTheme.of(context).title3,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.chevron_right_rounded,
                                    color: AppTheme.of(context).grayLight,
                                    size: 24,
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      4, 4, 4, 0),
                                  child: Wrap(
                                    children: controller.usuario.value
                                        .enfermedadesUsu[i].medicacmendosUsu
                                        .map((element) =>
                                            Text('${element.hora}'))
                                        .toList(),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4, 4, 4, 0),
                                  child: Wrap(
                                    children: controller.usuario.value
                                        .enfermedadesUsu[i].medicacmendosUsu
                                        .map((element) => Text(
                                              'Tomar ${element.dosis}',
                                              style: AppTheme.of(context)
                                                  .bodyText1,
                                            ))
                                        .toList(),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: AppTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 0, 16, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 4, 0, 4),
                                            child: Wrap(
                                              children: controller
                                                  .usuario
                                                  .value
                                                  .enfermedadesUsu[i]
                                                  .medicacmendosUsu
                                                  .map(
                                                    (element) => Text(
                                                      '${element.diasSemana}',
                                                      style:
                                                          AppTheme.of(context)
                                                              .bodyText1,
                                                    ),
                                                  )
                                                  .toList(),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4, 0, 0, 0),
                                            child: Text(
                                              "dias",
                                              // dateTimeFormat(
                                              //     'jm',
                                              //     appointmentCardAppointmentsRecord
                                              //         .appointmentTime!),
                                              style: AppTheme.of(context)
                                                  .bodyText2,
                                            ),
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
                    ),
                    // child: StreamBuilder<AppointmentsRecord>(
                    //   stream: AppointmentsRecord.getDocument(
                    //       listViewAppointmentsRecord.reference),
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
                    //     final appointmentCardAppointmentsRecord =
                    //         snapshot.data!;
                    //     return ;
                    //   },
                    // ),
                  );
                },
              ),
              // child: StreamBuilder<List<AppointmentsRecord>>(
              //   stream: queryAppointmentsRecord(
              //     queryBuilder: (appointmentsRecord) => appointmentsRecord
              //         .where('appointmentPerson',
              //             isEqualTo: currentUserReference)
              //         .orderBy('appointmentTime'),
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
              //     List<AppointmentsRecord> listViewAppointmentsRecordList =
              //         snapshot.data!;
              //     if (listViewAppointmentsRecordList.isEmpty) {
              //       return Center(
              //         child: EmptyListWidget(),
              //       );
              //     }
              //     return ;
              //   },
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
