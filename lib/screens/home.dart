import 'package:aip_poc/config/app_color_constants.dart';
import 'package:aip_poc/config/app_font_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

const int _rowsPerPage = 5;

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
      backgroundColor: AppColorConstants.primaryLightColor,
      appBar: AppBar(
        backgroundColor: AppColorConstants.primaryColor,
        title: const Center(
          child: Image(
            width: 44.0,
            height: 24.0,
            image: AssetImage("assets/images/logo.png"),
          ),
        ),
        elevation: 0.0,
        bottomOpacity: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColorConstants.primaryColor,
        ),
      ),
      // drawer: MyDrawer(),
      body: SafeArea(child: LayoutBuilder(builder: (context, constraints) {
        return Container(
          padding: const EdgeInsets.symmetric(
            vertical: 0.0,
            horizontal: 16.0,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 4.0,
              ),
              // Center(
              //   child: Text(
              //     "Patient’s Information",
              //     textAlign: TextAlign.center,
              //     style: TextStyle(
              //       color: AppColorConstants.primaryColor,
              //       fontFamily: AppFontConstants.nunitaSans,
              //       fontWeight: FontWeight.w700,
              //       fontSize: 16.0,
              //     ),
              //   ),
              // ),
              SizedBox(
                height: constraints.maxHeight - datapagerHeight,
                width: constraints.maxWidth,
                child: SfDataGrid(
                  source: employeeDataSource,
                  columnWidthMode: ColumnWidthMode.fill,
                  gridLinesVisibility: GridLinesVisibility.none,
                  headerGridLinesVisibility: GridLinesVisibility.none,
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
              ),
              Expanded(
                child: SizedBox(
                  height: datapagerHeight,
                  child: SfDataPager(
                    delegate: employeeDataSource,
                    pageCount: (employees.length / _rowsPerPage).ceilToDouble(),
                    direction: Axis.horizontal,
                  ),
                ),
              ),
            ],
          ),
        );
      })),
    );
  }

  List<Employee> getEmployeeData() {
    return [
      Employee(1, 'Mellisa', 'CCCCCC', 'care', 'coach', 6.6, '-', 'Active'),
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
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
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
      );
    }).toList());
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
