import 'package:chronosmedic_app/data/schema/dia.dart';
import 'package:chronosmedic_app/data/schema/list_item.dart';
import 'package:chronosmedic_app/theme/app_theme.dart';
import 'package:chronosmedic_app/theme/util.dart';
import 'package:chronosmedic_app/ui/utils/upload_media.dart';
import 'package:chronosmedic_app/ui/widgets/multi_select_chip.dart';
import 'package:chronosmedic_app/ui/widgets/widgets.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';

class AddSickUser extends StatefulWidget {
  const AddSickUser({Key? key}) : super(key: key);

  @override
  _AddSickUserState createState() => _AddSickUserState();
}

class _AddSickUserState extends State<AddSickUser> {
  PageController? pageViewController;
  DateTime? datePicked;
  String? radioButtonValue;

  TextEditingController? enfermedadController;
  TextEditingController? medicacmentoController;
  TextEditingController? cantidadController;
  TextEditingController? dosisController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Dia> _days = [
    Dia(id: '1', name: 'Lunes'),
    Dia(id: '2', name: 'Martes'),
    Dia(id: '3', name: 'Miercoles'),
    Dia(id: '4', name: 'Jueves'),
    Dia(id: '5', name: 'Viernes'),
    Dia(id: '6', name: 'Sabado'),
    Dia(id: '7', name: 'Domingo'),
  ];

  final List<String> _selectDay = [];

  final List<DateTime> _selectedHMS = [];

  Color selectedDateStyleColor = Colors.blue;
  Color selectedSingleDateDecorationColor = Colors.red;

  @override
  void initState() {
    super.initState();
    enfermedadController = TextEditingController();
    medicacmentoController = TextEditingController();
    cantidadController = TextEditingController();
    dosisController = TextEditingController();
  }

  @override
  void dispose() {
    enfermedadController?.dispose();
    medicacmentoController?.dispose();
    cantidadController?.dispose();
    dosisController?.dispose();
    super.dispose();
  }

  _onSave() {
    final resp =
        _days.where((element) => _selectDay.contains(element.id)).toList();

    controller.createEnfMedi(
      enfermedadController!.text,
      medicacmentoController!.text,
      int.parse(cantidadController!.text),
      int.parse(dosisController!.text),
      resp
          .map(
            (e) => e.name,
          )
          .toList(),
      _selectedHMS.map((e) => DateFormat('jm').format(e)).toList(),
    );
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppTheme.of(context).secondaryBackground,
      body: SingleChildScrollView(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (Theme.of(context).brightness == Brightness.dark)
                  Image.asset(
                    'assets/images/choronosmedic_logoVert.png',
                    width: 300,
                    height: 150,
                    fit: BoxFit.fitHeight,
                  ),
                if (!(Theme.of(context).brightness == Brightness.dark))
                  Image.asset(
                    'assets/images/choronosmedic_logoVert.png',
                    width: 300,
                    height: 150,
                    fit: BoxFit.fitHeight,
                  ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Stack(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                        child: PageView(
                          controller: pageViewController ??=
                              PageController(initialPage: 0),
                          scrollDirection: Axis.horizontal,
                          children: [
                            SizedBox(
                              width: 100,
                              height: 100,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 20, 8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Cuentamos que tienes',
                                            textAlign: TextAlign.center,
                                            style: AppTheme.of(context).title1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20, 20, 20, 0),
                                    child: TextFormField(
                                      controller: enfermedadController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Enfermedad',
                                        labelStyle: AppTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: AppTheme.of(context)
                                                  .grayLight,
                                            ),
                                        hintText: 'Diabetes, Presion alta...',
                                        hintStyle: AppTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: AppTheme.of(context)
                                                  .secondaryText,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        filled: true,
                                        fillColor: AppTheme.of(context)
                                            .primaryBackground,
                                        contentPadding:
                                            const EdgeInsetsDirectional
                                                .fromSTEB(20, 24, 20, 24),
                                      ),
                                      style: AppTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: AppTheme.of(context)
                                                .secondaryText,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20, 20, 20, 8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Para ayudarte a tener mas sano.',
                                            textAlign: TextAlign.center,
                                            style:
                                                AppTheme.of(context).subtitle1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 100,
                              decoration: const BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 20, 8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Que medicamento tomas ?',
                                            textAlign: TextAlign.center,
                                            style: AppTheme.of(context).title1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20, 20, 20, 0),
                                    child: TextFormField(
                                      controller: medicacmentoController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Medicamento',
                                        labelStyle: AppTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: AppTheme.of(context)
                                                  .grayLight,
                                            ),
                                        hintText: 'Paracetamol ...',
                                        hintStyle: AppTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: AppTheme.of(context)
                                                  .secondaryText,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        filled: true,
                                        fillColor: AppTheme.of(context)
                                            .primaryBackground,
                                        contentPadding:
                                            const EdgeInsetsDirectional
                                                .fromSTEB(20, 24, 20, 24),
                                      ),
                                      style: AppTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: AppTheme.of(context)
                                                .secondaryText,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20, 20, 20, 8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Programe fácilmente la hora que tiene que tomar su medicamento, etc.',
                                            textAlign: TextAlign.center,
                                            style:
                                                AppTheme.of(context).subtitle1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 300,
                              height: 100,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20, 20, 20, 0),
                                    child: TextFormField(
                                      controller: cantidadController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Cuantos dias',
                                        labelStyle: AppTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: AppTheme.of(context)
                                                  .grayLight,
                                            ),
                                        hintText: 'Paracetamol ...',
                                        hintStyle: AppTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: AppTheme.of(context)
                                                  .secondaryText,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        filled: true,
                                        fillColor: AppTheme.of(context)
                                            .primaryBackground,
                                        contentPadding:
                                            const EdgeInsetsDirectional
                                                .fromSTEB(20, 24, 20, 24),
                                      ),
                                      style: AppTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: AppTheme.of(context)
                                                .secondaryText,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20, 20, 20, 0),
                                    child: TextFormField(
                                      controller: dosisController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Dosis',
                                        labelStyle: AppTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: AppTheme.of(context)
                                                  .grayLight,
                                            ),
                                        hintText: '2 ...',
                                        hintStyle: AppTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: AppTheme.of(context)
                                                  .secondaryText,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        filled: true,
                                        fillColor: AppTheme.of(context)
                                            .primaryBackground,
                                        contentPadding:
                                            const EdgeInsetsDirectional
                                                .fromSTEB(20, 24, 20, 24),
                                      ),
                                      style: AppTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: AppTheme.of(context)
                                                .secondaryText,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            12, 16, 12, 0),
                                    child: MultiSelectChip(
                                      _days
                                          .map((e) => ListItem(e.id, e.name))
                                          .toList(),
                                      _selectDay,
                                      _selectDay,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 16, 0, 0),
                                    child: InkWell(
                                      onTap: () async {
                                        await DatePicker.showTime12hPicker(
                                          context,
                                          showTitleActions: true,
                                          currentTime: DateTime.now(),
                                          onConfirm: (date) {
                                            setState(
                                                () => _selectedHMS.add(date));
                                          },
                                        );
                                      },
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            color: AppTheme.of(context)
                                                .primaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(8),
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
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                              20, 0, 0, 0),
                                                      child: Text(
                                                        'Tiempo',
                                                        style:
                                                            AppTheme.of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  fontSize: 12,
                                                                ),
                                                      ),
                                                    ),
                                                    Wrap(
                                                      children: _selectedHMS
                                                          .map((e) => Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .all(2),
                                                                child:
                                                                    ChoiceChip(
                                                                  label: Text(
                                                                    dateTimeFormat(
                                                                        'jm',
                                                                        e),
                                                                    style: AppTheme.of(
                                                                            context)
                                                                        .bodyText2
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              AppTheme.of(context).tertiaryColor,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                  ),
                                                                  selected: _selectedHMS
                                                                      .map(
                                                                          (e) =>
                                                                              e)
                                                                      .contains(
                                                                          e),
                                                                  onSelected: (seleted) =>
                                                                      setState(() =>
                                                                          _selectedHMS
                                                                              .remove(e)),
                                                                ),
                                                              ))
                                                          .toList(),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(0, 0, 8, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    CustomIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 30,
                                                        buttonSize: 46,
                                                        icon: Icon(
                                                          Icons
                                                              .date_range_outlined,
                                                          color: AppTheme.of(
                                                                  context)
                                                              .grayLight,
                                                          size: 20,
                                                        ),
                                                        onPressed: _onSave),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 1),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: smooth_page_indicator.SmoothPageIndicator(
                            controller: pageViewController ??=
                                PageController(initialPage: 0),
                            count: 3,
                            axisDirection: Axis.horizontal,
                            onDotClicked: (i) {
                              pageViewController!.animateToPage(
                                i,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            effect: smooth_page_indicator.ExpandingDotsEffect(
                              expansionFactor: 2,
                              spacing: 8,
                              radius: 16,
                              dotWidth: 16,
                              dotHeight: 4,
                              dotColor: Color(0x8AC6CAD4),
                              activeDotColor: AppTheme.of(context).primaryText,
                              paintStyle: PaintingStyle.fill,
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
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                  child: Button(
                    onPressed: _onSave,
                    text: 'Guardar',
                    options: ButtonOptions(
                      width: 200,
                      height: 50,
                      color: AppTheme.of(context).primaryBackground,
                      textStyle: AppTheme.of(context).subtitle2.override(
                            fontFamily: 'Outfit',
                            color: AppTheme.of(context).primaryText,
                          ),
                      elevation: 2,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
    // return Scaffold(
    //   key: scaffoldKey,
    //   backgroundColor: AppTheme.of(context).primaryBackground,
    //   appBar: AppBar(
    //     backgroundColor: AppTheme.of(context).primaryBackground,
    //     automaticallyImplyLeading: false,
    //     leading: InkWell(
    //       onTap: () async {
    //         Navigator.pop(context);
    //       },
    //       child: Icon(
    //         Icons.chevron_left_rounded,
    //         color: AppTheme.of(context).grayLight,
    //         size: 32,
    //       ),
    //     ),
    //     title: Text(
    //       'Add Another Profile',
    //       style: AppTheme.of(context).title3,
    //     ),
    //     actions: [],
    //     centerTitle: false,
    //     elevation: 0,
    //   ),
    //   body: Container(
    //     width: MediaQuery.of(context).size.width,
    //     height: MediaQuery.of(context).size.height * 1,
    //     decoration: const BoxDecoration(),
    //     child: Padding(
    //       padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
    //       child: SingleChildScrollView(
    //         child: Column(
    //           mainAxisSize: MainAxisSize.max,
    //           children: [
    //             Expanded(
    //               child: Container(
    //                 width: double.infinity,
    //                 height: MediaQuery.of(context).size.height * 0.6,
    //                 child: Stack(
    //                   children: [
    //                     Padding(
    //                       padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
    //                       child: PageView(
    //                         controller: pageViewController ??=
    //                             PageController(initialPage: 0),
    //                         scrollDirection: Axis.horizontal,
    //                         children: [
    //                           Container(
    //                             width: 100,
    //                             height: 100,
    //                             decoration: BoxDecoration(),
    //                             child: Column(
    //                               mainAxisSize: MainAxisSize.max,
    //                               mainAxisAlignment: MainAxisAlignment.center,
    //                               children: [
    //                                 Row(
    //                                   mainAxisSize: MainAxisSize.max,
    //                                   mainAxisAlignment:
    //                                       MainAxisAlignment.center,
    //                                   children: [
    //                                     Padding(
    //                                       padding:
    //                                           EdgeInsetsDirectional.fromSTEB(
    //                                               0, 0, 0, 20),
    //                                       child: Image.asset(
    //                                         'assets/images/onboarding_1@2x.png',
    //                                         width: 320,
    //                                         height: 300,
    //                                         fit: BoxFit.fitWidth,
    //                                       ),
    //                                     ),
    //                                   ],
    //                                 ),
    //                                 Padding(
    //                                   padding: EdgeInsetsDirectional.fromSTEB(
    //                                       20, 0, 20, 8),
    //                                   child: Row(
    //                                     mainAxisSize: MainAxisSize.max,
    //                                     children: [
    //                                       Expanded(
    //                                         child: Text(
    //                                           'Stay in Touch',
    //                                           textAlign: TextAlign.center,
    //                                           style:
    //                                               AppTheme.of(context).title1,
    //                                         ),
    //                                       ),
    //                                     ],
    //                                   ),
    //                                 ),
    //                                 Padding(
    //                                   padding: EdgeInsetsDirectional.fromSTEB(
    //                                       20, 0, 20, 8),
    //                                   child: Row(
    //                                     mainAxisSize: MainAxisSize.max,
    //                                     children: [
    //                                       Expanded(
    //                                         child: Text(
    //                                           'Always have your medical office at your fingertips.',
    //                                           textAlign: TextAlign.center,
    //                                           style: AppTheme.of(context)
    //                                               .subtitle1,
    //                                         ),
    //                                       ),
    //                                     ],
    //                                   ),
    //                                 ),
    //                               ],
    //                             ),
    //                           ),
    //                           Container(
    //                             width: 100,
    //                             height: 100,
    //                             decoration: BoxDecoration(),
    //                             child: Column(
    //                               mainAxisSize: MainAxisSize.max,
    //                               mainAxisAlignment: MainAxisAlignment.center,
    //                               children: [
    //                                 Row(
    //                                   mainAxisSize: MainAxisSize.max,
    //                                   mainAxisAlignment:
    //                                       MainAxisAlignment.center,
    //                                   children: [
    //                                     Padding(
    //                                       padding:
    //                                           EdgeInsetsDirectional.fromSTEB(
    //                                               0, 0, 0, 20),
    //                                       child: Image.asset(
    //                                         'assets/images/onboarding_2@2x.png',
    //                                         width: 300,
    //                                         height: 270,
    //                                         fit: BoxFit.fitHeight,
    //                                       ),
    //                                     ),
    //                                   ],
    //                                 ),
    //                                 Padding(
    //                                   padding: EdgeInsetsDirectional.fromSTEB(
    //                                       20, 0, 20, 8),
    //                                   child: Row(
    //                                     mainAxisSize: MainAxisSize.max,
    //                                     children: [
    //                                       Expanded(
    //                                         child: Text(
    //                                           'Schedule Appointments',
    //                                           textAlign: TextAlign.center,
    //                                           style:
    //                                               AppTheme.of(context).title1,
    //                                         ),
    //                                       ),
    //                                     ],
    //                                   ),
    //                                 ),
    //                                 Padding(
    //                                   padding: EdgeInsetsDirectional.fromSTEB(
    //                                       20, 0, 20, 8),
    //                                   child: Row(
    //                                     mainAxisSize: MainAxisSize.max,
    //                                     children: [
    //                                       Expanded(
    //                                         child: Text(
    //                                           'Easily schedule appointments for checkups,  routine procedures, etc.',
    //                                           textAlign: TextAlign.center,
    //                                           style: AppTheme.of(context)
    //                                               .subtitle1,
    //                                         ),
    //                                       ),
    //                                     ],
    //                                   ),
    //                                 ),
    //                               ],
    //                             ),
    //                           ),
    //                           Container(
    //                             width: 100,
    //                             height: 100,
    //                             decoration: BoxDecoration(),
    //                             child: Column(
    //                               mainAxisSize: MainAxisSize.max,
    //                               mainAxisAlignment: MainAxisAlignment.center,
    //                               children: [
    //                                 Row(
    //                                   mainAxisSize: MainAxisSize.max,
    //                                   mainAxisAlignment:
    //                                       MainAxisAlignment.center,
    //                                   children: [
    //                                     Padding(
    //                                       padding:
    //                                           EdgeInsetsDirectional.fromSTEB(
    //                                               0, 30, 0, 30),
    //                                       child: Image.asset(
    //                                         'assets/images/onboarding_3@2x.png',
    //                                         width: 300,
    //                                         height: 250,
    //                                         fit: BoxFit.fitWidth,
    //                                       ),
    //                                     ),
    //                                   ],
    //                                 ),
    //                                 Padding(
    //                                   padding: EdgeInsetsDirectional.fromSTEB(
    //                                       20, 0, 20, 8),
    //                                   child: Row(
    //                                     mainAxisSize: MainAxisSize.max,
    //                                     children: [
    //                                       Expanded(
    //                                         child: Text(
    //                                           'Doctor in your pocket',
    //                                           textAlign: TextAlign.center,
    //                                           style:
    //                                               AppTheme.of(context).title1,
    //                                         ),
    //                                       ),
    //                                     ],
    //                                   ),
    //                                 ),
    //                                 Padding(
    //                                   padding: EdgeInsetsDirectional.fromSTEB(
    //                                       20, 0, 20, 8),
    //                                   child: Row(
    //                                     mainAxisSize: MainAxisSize.max,
    //                                     children: [
    //                                       Expanded(
    //                                         child: Text(
    //                                           'Easily find symptoms and common factors that affect you daily.',
    //                                           textAlign: TextAlign.center,
    //                                           style: AppTheme.of(context)
    //                                               .subtitle1,
    //                                         ),
    //                                       ),
    //                                     ],
    //                                   ),
    //                                 ),
    //                               ],
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                     Align(
    //                       alignment: AlignmentDirectional(0, 1),
    //                       child: Padding(
    //                         padding:
    //                             EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
    //                         child: smooth_page_indicator.SmoothPageIndicator(
    //                           controller: pageViewController ??=
    //                               PageController(initialPage: 0),
    //                           count: 3,
    //                           axisDirection: Axis.horizontal,
    //                           onDotClicked: (i) {
    //                             pageViewController!.animateToPage(
    //                               i,
    //                               duration: Duration(milliseconds: 500),
    //                               curve: Curves.ease,
    //                             );
    //                           },
    //                           effect: smooth_page_indicator.ExpandingDotsEffect(
    //                             expansionFactor: 2,
    //                             spacing: 8,
    //                             radius: 16,
    //                             dotWidth: 16,
    //                             dotHeight: 4,
    //                             dotColor: Color(0x8AC6CAD4),
    //                             activeDotColor:
    //                                 AppTheme.of(context).primaryText,
    //                             paintStyle: PaintingStyle.fill,
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             )
    //             // Padding(
    //             //   padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
    //             //   child: TextFormField(
    //             //     controller: phoneNumberController1,
    //             //     obscureText: false,
    //             //     decoration: InputDecoration(
    //             //       labelText: 'Persons Name',
    //             //       labelStyle: AppTheme.of(context).bodyText1.override(
    //             //             fontFamily: 'Outfit',
    //             //             color: AppTheme.of(context).grayLight,
    //             //           ),
    //             //       hintText: 'Official name here...',
    //             //       hintStyle: AppTheme.of(context).bodyText1.override(
    //             //             fontFamily: 'Outfit',
    //             //             color: AppTheme.of(context).secondaryText,
    //             //           ),
    //             //       enabledBorder: OutlineInputBorder(
    //             //         borderSide: const BorderSide(
    //             //           color: Color(0x00000000),
    //             //           width: 1,
    //             //         ),
    //             //         borderRadius: BorderRadius.circular(8),
    //             //       ),
    //             //       focusedBorder: OutlineInputBorder(
    //             //         borderSide: const BorderSide(
    //             //           color: Color(0x00000000),
    //             //           width: 1,
    //             //         ),
    //             //         borderRadius: BorderRadius.circular(8),
    //             //       ),
    //             //       errorBorder: OutlineInputBorder(
    //             //         borderSide: const BorderSide(
    //             //           color: Color(0x00000000),
    //             //           width: 1,
    //             //         ),
    //             //         borderRadius: BorderRadius.circular(8),
    //             //       ),
    //             //       focusedErrorBorder: OutlineInputBorder(
    //             //         borderSide: const BorderSide(
    //             //           color: Color(0x00000000),
    //             //           width: 1,
    //             //         ),
    //             //         borderRadius: BorderRadius.circular(8),
    //             //       ),
    //             //       filled: true,
    //             //       fillColor: AppTheme.of(context).secondaryBackground,
    //             //       contentPadding:
    //             //           const EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
    //             //     ),
    //             //     style: AppTheme.of(context).bodyText1.override(
    //             //           fontFamily: 'Outfit',
    //             //           color: AppTheme.of(context).secondaryText,
    //             //         ),
    //             //   ),
    //             // ),
    //             // Padding(
    //             //   padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
    //             //   child: TextFormField(
    //             //     controller: phoneNumberController2,
    //             //     obscureText: false,
    //             //     decoration: InputDecoration(
    //             //       labelText: 'Persons Age',
    //             //       labelStyle: AppTheme.of(context).bodyText1.override(
    //             //             fontFamily: 'Outfit',
    //             //             color: AppTheme.of(context).grayLight,
    //             //           ),
    //             //       hintText: 'i.e. 34',
    //             //       hintStyle: AppTheme.of(context).bodyText1.override(
    //             //             fontFamily: 'Outfit',
    //             //             color: AppTheme.of(context).secondaryText,
    //             //           ),
    //             //       enabledBorder: OutlineInputBorder(
    //             //         borderSide: const BorderSide(
    //             //           color: Color(0x00000000),
    //             //           width: 1,
    //             //         ),
    //             //         borderRadius: BorderRadius.circular(8),
    //             //       ),
    //             //       focusedBorder: OutlineInputBorder(
    //             //         borderSide: const BorderSide(
    //             //           color: Color(0x00000000),
    //             //           width: 1,
    //             //         ),
    //             //         borderRadius: BorderRadius.circular(8),
    //             //       ),
    //             //       errorBorder: OutlineInputBorder(
    //             //         borderSide: const BorderSide(
    //             //           color: Color(0x00000000),
    //             //           width: 1,
    //             //         ),
    //             //         borderRadius: BorderRadius.circular(8),
    //             //       ),
    //             //       focusedErrorBorder: OutlineInputBorder(
    //             //         borderSide: const BorderSide(
    //             //           color: Color(0x00000000),
    //             //           width: 1,
    //             //         ),
    //             //         borderRadius: BorderRadius.circular(8),
    //             //       ),
    //             //       filled: true,
    //             //       fillColor: AppTheme.of(context).secondaryBackground,
    //             //       contentPadding:
    //             //           EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
    //             //     ),
    //             //     style: AppTheme.of(context).bodyText1.override(
    //             //           fontFamily: 'Outfit',
    //             //           color: AppTheme.of(context).secondaryText,
    //             //         ),
    //             //     keyboardType: TextInputType.number,
    //             //   ),
    //             // ),
    //             // Padding(
    //             //   padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
    //             //   child: TextFormField(
    //             //     controller: phoneNumberController3,
    //             //     obscureText: false,
    //             //     decoration: InputDecoration(
    //             //       labelText: 'Persons Ailments',
    //             //       labelStyle: AppTheme.of(context).bodyText1.override(
    //             //             fontFamily: 'Outfit',
    //             //             color: AppTheme.of(context).grayLight,
    //             //           ),
    //             //       hintText: 'What types of allergies do they have..',
    //             //       hintStyle: AppTheme.of(context).bodyText1.override(
    //             //             fontFamily: 'Outfit',
    //             //             color: AppTheme.of(context).secondaryText,
    //             //           ),
    //             //       enabledBorder: OutlineInputBorder(
    //             //         borderSide: const BorderSide(
    //             //           color: Color(0x00000000),
    //             //           width: 1,
    //             //         ),
    //             //         borderRadius: BorderRadius.circular(8),
    //             //       ),
    //             //       focusedBorder: OutlineInputBorder(
    //             //         borderSide: const BorderSide(
    //             //           color: Color(0x00000000),
    //             //           width: 1,
    //             //         ),
    //             //         borderRadius: BorderRadius.circular(8),
    //             //       ),
    //             //       errorBorder: OutlineInputBorder(
    //             //         borderSide: const BorderSide(
    //             //           color: Color(0x00000000),
    //             //           width: 1,
    //             //         ),
    //             //         borderRadius: BorderRadius.circular(8),
    //             //       ),
    //             //       focusedErrorBorder: OutlineInputBorder(
    //             //         borderSide: const BorderSide(
    //             //           color: Color(0x00000000),
    //             //           width: 1,
    //             //         ),
    //             //         borderRadius: BorderRadius.circular(8),
    //             //       ),
    //             //       filled: true,
    //             //       fillColor: AppTheme.of(context).secondaryBackground,
    //             //       contentPadding:
    //             //           const EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
    //             //     ),
    //             //     style: AppTheme.of(context).bodyText1.override(
    //             //           fontFamily: 'Outfit',
    //             //           color: AppTheme.of(context).textColor,
    //             //         ),
    //             //   ),
    //             // ),
    //             // Padding(
    //             //   padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
    //             //   child: TextFormField(
    //             //     controller: phoneNumberController4,
    //             //     obscureText: false,
    //             //     decoration: InputDecoration(
    //             //       labelText: 'Location',
    //             //       labelStyle: AppTheme.of(context).bodyText1.override(
    //             //             fontFamily: 'Outfit',
    //             //             color: AppTheme.of(context).grayLight,
    //             //           ),
    //             //       hintText: 'Please enter a valid email...',
    //             //       hintStyle: AppTheme.of(context).bodyText1.override(
    //             //             fontFamily: 'Outfit',
    //             //             color: AppTheme.of(context).secondaryText,
    //             //           ),
    //             //       enabledBorder: OutlineInputBorder(
    //             //         borderSide: const BorderSide(
    //             //           color: Color(0x00000000),
    //             //           width: 1,
    //             //         ),
    //             //         borderRadius: BorderRadius.circular(8),
    //             //       ),
    //             //       focusedBorder: OutlineInputBorder(
    //             //         borderSide: const BorderSide(
    //             //           color: Color(0x00000000),
    //             //           width: 1,
    //             //         ),
    //             //         borderRadius: BorderRadius.circular(8),
    //             //       ),
    //             //       errorBorder: OutlineInputBorder(
    //             //         borderSide: const BorderSide(
    //             //           color: Color(0x00000000),
    //             //           width: 1,
    //             //         ),
    //             //         borderRadius: BorderRadius.circular(8),
    //             //       ),
    //             //       focusedErrorBorder: OutlineInputBorder(
    //             //         borderSide: const BorderSide(
    //             //           color: Color(0x00000000),
    //             //           width: 1,
    //             //         ),
    //             //         borderRadius: BorderRadius.circular(8),
    //             //       ),
    //             //       filled: true,
    //             //       fillColor: AppTheme.of(context).secondaryBackground,
    //             //       contentPadding:
    //             //           const EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
    //             //     ),
    //             //     style: AppTheme.of(context).bodyText1.override(
    //             //           fontFamily: 'Outfit',
    //             //           color: AppTheme.of(context).textColor,
    //             //         ),
    //             //     keyboardType: TextInputType.streetAddress,
    //             //   ),
    //             // ),
    //             // Padding(
    //             //   padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
    //             //   child: Button(
    //             //     onPressed: () async {
    //             //       // await Navigator.push(
    //             //       //   context,
    //             //       //   MaterialPageRoute(
    //             //       //     builder: (context) =>
    //             //       //         NavBarPage(initialPage: 'homePage'),
    //             //       //   ),
    //             //       // );
    //             //     },
    //             //     text: 'Complete Profile',
    //             //     options: ButtonOptions(
    //             //       width: 230,
    //             //       height: 50,
    //             //       color: AppTheme.of(context).primaryColor,
    //             //       textStyle: AppTheme.of(context).subtitle2.override(
    //             //             fontFamily: 'Outfit',
    //             //             color: AppTheme.of(context).textColor,
    //             //           ),
    //             //       elevation: 3,
    //             //       borderSide: const BorderSide(
    //             //         color: Colors.transparent,
    //             //         width: 1,
    //             //       ),
    //             //       borderRadius: BorderRadius.circular(40),
    //             //     ),
    //             //   ),
    //             // ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
