import 'package:aip_poc/config/app_color_constants.dart';
import 'package:aip_poc/config/app_font_constants.dart';
import 'package:aip_poc/screens/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

const int _rowsPerPage = 5;
final _scaffoldKey = GlobalKey<ScaffoldState>();

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Employee> employees = <Employee>[];
  late EmployeeDataSource employeeDataSource;
  double datapagerHeight = 60.0;

  @override
  void initState() {
    super.initState();
    employees = getEmployeeData();
    employeeDataSource = EmployeeDataSource(employeeData: employees);
  }

  updateWidget() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColorConstants.primaryLightColor,
      appBar: AppBar(
        backgroundColor: AppColorConstants.primaryColor,
        // automaticallyImplyLeading: false,
        title: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const Padding(
            padding: EdgeInsets.only(
              right: 40.0,
            ),
            child: Image(
              width: 44.0,
              height: 24.0,
              image: AssetImage("assets/images/logo.png"),
            ),
          ),
        ),
        leading: IconButton(
          icon: SvgPicture.asset("assets/svg-icons/drawer-icon.svg"),
          onPressed: () => _scaffoldKey.currentState!.openDrawer(),
        ),
        elevation: 0.0,
        bottomOpacity: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColorConstants.primaryColor,
        ),
      ),
      drawer: const MyDrawer(),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 0.0,
            horizontal: 16.0,
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                  const SizedBox(
                    height: 16.0,
                  ),
                  _buildSearchTextField(),
                  const SizedBox(
                    height: 12.0,
                  ),
                  _buildThreeRowButton(),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Expanded(child: _buildSFDataGrid(constraints)),
                  SizedBox(
                    height: datapagerHeight,
                    child: SfDataPager(
                      delegate: employeeDataSource,
                      pageCount:
                          (employees.length / _rowsPerPage).ceilToDouble(),
                      direction: Axis.horizontal,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  SizedBox _buildSFDataGrid(BoxConstraints constraints) {
    return SizedBox(
      height: constraints.maxHeight - datapagerHeight,
      width: constraints.maxWidth,
      child: SfDataGrid(
        source: employeeDataSource,
        columnWidthMode: ColumnWidthMode.fill,
        gridLinesVisibility: GridLinesVisibility.none,
        headerGridLinesVisibility: GridLinesVisibility.none,
        onQueryRowHeight: (details) {
          return details.getIntrinsicRowHeight(details.rowIndex);
        },
        columns: <GridColumn>[
          GridColumn(
            columnName: 'id',
            label: Container(
              // padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: const Text(
                'ID',
              ),
            ),
            visible: false,
          ),
          GridColumn(
            columnName: 'info',
            label: Card(
              margin: EdgeInsets.zero,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(
                    10.0,
                  ),
                ),
              ),
              elevation: 0.0,
              child: Container(
                // padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.symmetric(
                  vertical: 0.0,
                  horizontal: 8.0,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: const Color(0xFF0C71C3).withOpacity(0.5),
                      width: 1.0,
                    ),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Patient’s Information",
                  style: TextStyle(
                    color: AppColorConstants.primaryColor,
                    fontFamily: AppFontConstants.nunitaSans,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Employee> getEmployeeData() {
    return [
      Employee(
          1,
          'Mellisa',
          'Dr Cynthia Rima NP Dr Cynthia Rima NP Dr Cynthia Rima NP Dr Cynthia Rima NP Dr Cynthia Rima NP Dr Cynthia Rima NP Dr Cynthia Rima NP Dr Cynthia Rima NP Dr Cynthia Rima NP Dr Cynthia Rima NP Dr Cynthia Rima NP Dr Cynthia Rima NP Dr Cynthia Rima NP Dr Cynthia Rima NP Dr Cynthia Rima NP Dr Cynthia Rima NP Dr Cynthia Rima NP Dr Cynthia Rima NP Dr Cynthia Rima NP Dr Cynthia Rima NP Dr Cynthia Rima NP Dr Cynthia Rima NP Dr Cynthia Rima NP Dr Cynthia Rima NP Dr Cynthia Rima NP Dr Cynthia Rima NP Dr Cynthia Rima NP Dr Cynthia Rima NP Dr Cynthia Rima NP Dr Cynthia Rima NP Dr Cynthia Rima NP Dr Cynthia Rima NP Dr Cynthia Rima NP Dr Cynthia Rima NP Dr Cynthia Rima NP Dr Cynthia Rima NP Dr Cynthia Rima NP Dr Cynthia Rima NP',
          'care',
          'coach',
          6.6,
          '-',
          'Active'),
      Employee(
          2, 'Abraham Desiree', 'CCCCCC', 'care', 'coach', 6.6, '-', 'Active'),
      Employee(3, 'Bain Amanda', 'CCCCCC', 'care', 'coach', 6.6, '-', 'Active'),
      Employee(4, 'Boyd Jodi', 'CCCCCC', 'care', 'coach', 6.6, '-', 'Active'),
      Employee(
          5, 'Crane Judith', 'CCCCCC', 'care', 'coach', 6.6, '-', 'Active'),
      Employee(
          6, 'Crane Terrance', 'CCCCCC', 'care', 'coach', 6.6, '-', 'Active'),
      Employee(
          7, 'Gaughran Cynthia', 'CCCCCC', 'care', 'coach', 6.6, '-', 'Active'),
    ];
  }

  // search field
  Widget _buildSearchTextField() {
    return SizedBox(
      height: 42.0,
      child: TextFormField(
        style: TextStyle(
          color: const Color(0xFF757677),
          fontFamily: AppFontConstants.nunitaSans,
          fontWeight: FontWeight.w400,
          fontSize: 16.0,
        ),
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        inputFormatters: [
          FilteringTextInputFormatter.deny(
            RegExp(r"\s"),
          ),
        ],
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColorConstants.primaryColor,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(25.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFFD8000C),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(25.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColorConstants.primaryColor,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(25.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFFD8000C),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(25.0),
          ),
          labelStyle:
              MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
            final Color color = states.contains(MaterialState.error)
                ? const Color(0xFFD8000C)
                : (states.contains(MaterialState.focused)
                    ? AppColorConstants.primaryColor
                    : const Color(0xFFA4A4A4));
            return TextStyle(color: color);
          }),
          hintText: "Search",
          hintStyle: TextStyle(
            color: const Color(0xFF757677),
            fontFamily: AppFontConstants.nunitaSans,
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
          ),
          isDense: true,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset('assets/svg-icons/search.svg'),
          ),
        ),
      ),
    );
  }

  // three button
  Widget _buildThreeRowButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // list button
        OutlinedButton.icon(
          onPressed: () {},
          icon: SvgPicture.asset("assets/svg-icons/list-icon.svg"),
          label: Text(
            "List",
            style: TextStyle(
              color: AppColorConstants.fontColor,
              fontFamily: AppFontConstants.nunitaSans,
              fontWeight: FontWeight.w400,
              fontSize: 14.0,
            ),
          ),
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(const Color(0Xffffffff)),
            elevation: MaterialStateProperty.all<double>(0),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            side: MaterialStateProperty.all<BorderSide>(
              BorderSide(color: AppColorConstants.primaryColor),
            ),
          ),
        ),
        // add button
        OutlinedButton.icon(
          onPressed: () {},
          icon: SvgPicture.asset("assets/svg-icons/add-icon.svg"),
          label: Text(
            "Add",
            style: TextStyle(
              color: AppColorConstants.fontColor,
              fontFamily: AppFontConstants.nunitaSans,
              fontWeight: FontWeight.w400,
              fontSize: 14.0,
            ),
          ),
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(const Color(0Xffffffff)),
            elevation: MaterialStateProperty.all<double>(0),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            side: MaterialStateProperty.all<BorderSide>(
              BorderSide(color: AppColorConstants.primaryColor),
            ),
          ),
        ),
        // active button
        OutlinedButton.icon(
          onPressed: () {},
          icon: SvgPicture.asset("assets/svg-icons/active-icon.svg"),
          label: Text(
            "Active",
            style: TextStyle(
              color: AppColorConstants.fontColor,
              fontFamily: AppFontConstants.nunitaSans,
              fontWeight: FontWeight.w400,
              fontSize: 14.0,
            ),
          ),
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(const Color(0Xffffffff)),
            elevation: MaterialStateProperty.all<double>(0),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            side: MaterialStateProperty.all<BorderSide>(
              BorderSide(color: AppColorConstants.primaryColor),
            ),
          ),
        ),
      ],
    );
  }
}

_buildBottomSheet(Employee emp) {
  _scaffoldKey.currentState!.showBottomSheet<void>((context) {
    return GestureDetector(
      onVerticalDragStart: (_) {},
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 16.0,
        ),
        decoration: BoxDecoration(
          color: AppColorConstants.primaryLightColor,
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            // Header with close icon
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Patient Details",
                    style: TextStyle(
                      color: AppColorConstants.primaryColor,
                      fontFamily: AppFontConstants.nunitaSans,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                ClipOval(
                  child: Material(
                    type: MaterialType.transparency,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Center(
                        child: SvgPicture.asset(
                          "assets/svg-icons/close.svg",
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              height: 5.0,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 12.0,
                    ),
                    // Patient Name
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            "Patient Name",
                            style: TextStyle(
                              color: AppColorConstants.fontColor,
                              fontFamily: AppFontConstants.nunitaSans,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            emp.patientName,
                            style: TextStyle(
                              color: AppColorConstants.fontColor,
                              fontFamily: AppFontConstants.nunitaSans,
                              fontWeight: FontWeight.w400,
                              fontSize: 14.0,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    // Provider
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            "Provider",
                            style: TextStyle(
                              color: AppColorConstants.fontColor,
                              fontFamily: AppFontConstants.nunitaSans,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            emp.providerName,
                            style: TextStyle(
                              color: AppColorConstants.fontColor,
                              fontFamily: AppFontConstants.nunitaSans,
                              fontWeight: FontWeight.w400,
                              fontSize: 14.0,
                            ),
                            textAlign: TextAlign.left,
                            // softWrap: true,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    // Care
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            "Care",
                            style: TextStyle(
                              color: AppColorConstants.fontColor,
                              fontFamily: AppFontConstants.nunitaSans,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            emp.care,
                            style: TextStyle(
                              color: AppColorConstants.fontColor,
                              fontFamily: AppFontConstants.nunitaSans,
                              fontWeight: FontWeight.w400,
                              fontSize: 14.0,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    // Coach
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            "Coach",
                            style: TextStyle(
                              color: AppColorConstants.fontColor,
                              fontFamily: AppFontConstants.nunitaSans,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            emp.coach,
                            style: TextStyle(
                              color: AppColorConstants.fontColor,
                              fontFamily: AppFontConstants.nunitaSans,
                              fontWeight: FontWeight.w400,
                              fontSize: 14.0,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    // Height
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            "Height",
                            style: TextStyle(
                              color: AppColorConstants.fontColor,
                              fontFamily: AppFontConstants.nunitaSans,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            emp.height.toString(),
                            style: TextStyle(
                              color: AppColorConstants.fontColor,
                              fontFamily: AppFontConstants.nunitaSans,
                              fontWeight: FontWeight.w400,
                              fontSize: 14.0,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    // Glucose
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            "Glucose",
                            style: TextStyle(
                              color: AppColorConstants.fontColor,
                              fontFamily: AppFontConstants.nunitaSans,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            emp.glucose,
                            style: TextStyle(
                              color: AppColorConstants.fontColor,
                              fontFamily: AppFontConstants.nunitaSans,
                              fontWeight: FontWeight.w400,
                              fontSize: 14.0,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    // Active Status
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            "Active Status",
                            style: TextStyle(
                              color: AppColorConstants.fontColor,
                              fontFamily: AppFontConstants.nunitaSans,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            emp.status,
                            style: TextStyle(
                              color: AppColorConstants.fontColor,
                              fontFamily: AppFontConstants.nunitaSans,
                              fontWeight: FontWeight.w400,
                              fontSize: 14.0,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // edit icon
                  Container(
                    height: 32,
                    width: 32,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFE8F4FF),
                    ),
                    padding: const EdgeInsets.all(4.0),
                    child: InkWell(
                      onTap: () {},
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/svg-icons/edit-icon.svg",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  // delete icon
                  Container(
                    height: 32,
                    width: 32,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFE8F4FF),
                    ),
                    padding: const EdgeInsets.all(4.0),
                    child: InkWell(
                      onTap: () {},
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/svg-icons/delete-icon.svg",
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
    );
  });
}

class Employee {
  /// Creates the employee class with required details.
  Employee(
    this.id,
    this.patientName,
    this.providerName,
    this.care,
    this.coach,
    this.height,
    this.glucose,
    this.status,
  );

  final int id;
  final String patientName;
  final String providerName;
  final String care;
  final String coach;
  final double height;
  final String glucose;
  final String status;
}

class EmployeeDataSource extends DataGridSource {
  int index = -1;

  /// Creates the employee data source class with required details.
  EmployeeDataSource({required List<Employee> employeeData}) {
    _employeeData = employeeData;
    _paginatedRows = employeeData;
    buildPaginatedDataGridRows();
  }

  List<DataGridRow> _employeeDataGridRows = [];
  List<Employee> _paginatedRows = [];
  List<Employee> _employeeData = [];

  @override
  List<DataGridRow> get rows => _employeeDataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    index++;
    int id = 0;
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      if (e.columnName == 'id') id = e.value;
      return _buildDataRow(id, e);
    }).toList());
  }

  Widget _buildDataRow(int id, DataGridCell<dynamic> e) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: (index == _employeeDataGridRows.length - 1)
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
        margin: const EdgeInsets.symmetric(
          vertical: 0.0,
          horizontal: 8.0,
        ),
        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 0.0),
        decoration: BoxDecoration(
          border: (index == _employeeDataGridRows.length - 1)
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
            _buildBottomSheet(
                _employeeData.where((element) => element.id == id).first);
          },
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    // Arrow Circle
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
                          "assets/svg-icons/right-arrow.svg",
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
                  e.value.toString(),
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
    );
  }

  @override
  Future<bool> handlePageChange(int oldPageIndex, int newPageIndex) {
    final int startIndex = newPageIndex * _rowsPerPage;
    int endIndex = startIndex + _rowsPerPage;
    if (endIndex > _employeeData.length) {
      endIndex = _employeeData.length;
    }

    /// Get particular range from the sorted collection.
    if (startIndex < _employeeData.length && endIndex <= _employeeData.length) {
      _paginatedRows = _employeeData.getRange(startIndex, endIndex).toList();
    } else {
      _paginatedRows = <Employee>[];
    }
    index = -1;
    buildPaginatedDataGridRows();
    notifyListeners();
    return Future<bool>.value(true);
  }

  void buildPaginatedDataGridRows() {
    _employeeDataGridRows = _paginatedRows.map<DataGridRow>((dataGridRow) {
      return DataGridRow(cells: [
        DataGridCell<int>(columnName: 'id', value: dataGridRow.id),
        DataGridCell<String>(
            columnName: 'info', value: dataGridRow.patientName),
      ]);
    }).toList();
  }

  void updateDataGriDataSource() {
    notifyListeners();
  }
}
