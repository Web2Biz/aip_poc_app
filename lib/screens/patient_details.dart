import 'package:aip_poc/config/app_color_constants.dart';
import 'package:aip_poc/config/app_font_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class PatientDetails extends StatefulWidget {
  final List<DataGridRow> employeeDataGridRows;
  final int index;
  final String patientName;
  const PatientDetails(
      {Key? key,
      required this.employeeDataGridRows,
      required this.index,
      required this.patientName})
      : super(key: key);

  @override
  State<PatientDetails> createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: (widget.index == widget.employeeDataGridRows.length - 1)
              ? const BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(
                    10.0,
                  ),
                )
              : BorderRadius.zero,
        ),
        elevation: 0.0,
        child: Container(
          // alignment: Alignment.center,
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.symmetric(
            vertical: 0.0,
            horizontal: 8.0,
          ),
          padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 0.0),
          decoration: BoxDecoration(
            border: (widget.index == widget.employeeDataGridRows.length - 1)
                ? const Border(bottom: BorderSide.none)
                : Border(
                    bottom: BorderSide(
                      color: const Color(0xFF0C71C3).withOpacity(0.5),
                      width: 1.0,
                    ),
                  ),
          ),
          child: InkWell(
            onTap: () {
              _buildBottomSheet();
            },
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      // Counter Circle
                      Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColorConstants.primaryColor,
                        ),
                        padding: const EdgeInsets.all(4.0),
                        child: Center(
                          child: SvgPicture.asset(
                            "assets/svg-icons/down-arrow.svg",
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 14.0,
                      ),
                      Text(
                        "Patient Name",
                        style: TextStyle(
                          color: AppColorConstants.fontColor,
                          fontFamily: AppFontConstants.nunitaSans,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    widget.patientName,
                    style: TextStyle(
                      color: AppColorConstants.primaryColor,
                      fontFamily: AppFontConstants.nunitaSans,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildBottomSheet() {
    _scaffoldKey.currentState!.showBottomSheet<void>((context) {
      return GestureDetector(
        onVerticalDragStart: (_) {},
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Text("hoooooooooo\ndfggggggggggd\nsdfgggsgdsg\n"),
        ),
      );
    });
  }
}
