import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:primecare_lab_soft/const.dart';
import 'package:primecare_lab_soft/pages/home/home_page.dart';
import 'package:primecare_lab_soft/responsive.dart';
import 'package:primecare_lab_soft/widgets/menu.dart';
import 'package:primecare_lab_soft/widgets/profile/profile.dart';

class DashBoard extends StatelessWidget {
  DashBoard({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: !Responsive.isDesktop(context)
          ? SizedBox(width: 250, child: Menu(scaffoldKey: _scaffoldKey))
          : SizedBox(width: 300, child: Menu(scaffoldKey: _scaffoldKey)),
      endDrawer: Responsive.isMobile(context)
          ? SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: const Profile(),
            )
          : SizedBox(width: 300, child: const Profile()),
      body: SafeArea(
        child: Column(
          children: [
            // if (Responsive.isDesktop(context))
            //   Expanded(
            //     flex: 2,
            //     child: SizedBox(
            //       height: MediaQuery.of(context).size.height,
            //       child: Menu(scaffoldKey: _scaffoldKey),
            //     ),
            //   ),
            // Expanded(flex: 9, child: HomePage(scaffoldKey: _scaffoldKey)),
            // if (!Responsive.isMobile(context))
            //   const Expanded(flex: 4, child: Profile()),
            CustomeHeader(scaffoldKey: _scaffoldKey),

            if (Responsive.isDesktop(context) || Responsive.isTablet(context))
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    PatientInfo(),
                    SizedBox(width: 8),
                    TestEntry(),
                    SizedBox(width: 8),
                    BillingActions(),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class BillingActions extends StatelessWidget {
  const BillingActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        height: 600,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            SizedBox(height: 12),
            Text(
              'Sample/Order & Test Entry',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            CommonTextField(labelText: 'Inv Fees'),
            SizedBox(height: 8),
            CommonTextField(labelText: 'Visiting Charges'),
            SizedBox(height: 8),
            CommonTextField(labelText: 'Other Charges'),
            SizedBox(height: 8),
            CommonTextField(labelText: 'Discount'),
            SizedBox(height: 8),
            CommonTextField(labelText: 'Net Total'),
            SizedBox(height: 8),
            CommonTextField(labelText: 'Paid'),
            SizedBox(height: 8),
            CommonTextField(labelText: 'Balance'),
            SizedBox(height: 8),
            CommonDropDownField(
              items: ['Cash', 'Card'],
              labelText: 'Payment Type',
              onChanged: (value) {
                // Handle your logic here
                print("Selected: $value");
                // setState(() => yourSelectedValue = value);
              },
            ),
            SizedBox(height: 8),
            CommonDropDownField(
              items: ['Non Cashless'],
              labelText: 'Patient Type',
              onChanged: (value) {
                // Handle your logic here
                print("Selected: $value");
                // setState(() => yourSelectedValue = value);
              },
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class TestEntry extends StatelessWidget {
  const TestEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        height: 600,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12),
            Text(
              'Sample/Order & Test Entry',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            CommonDropDownField(
              items: ['Main Lab', 'Other Lab'],
              labelText: 'Location',
              onChanged: (value) {},
            ),
            SizedBox(height: 8),
            CommonDropDownField(
              items: [
                'Sample Collected At Lab',
                'Sample Collected At Home',
                'Sample Collected At Hospital/Clinic',
              ],
              labelText: 'Smaple Info',
              onChanged: (value) {},
            ),
            SizedBox(height: 8),
            EditableTestTable(),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () async {},
                  child: Container(
                    margin: EdgeInsets.only(left: 16, bottom: 10),
                    height: 35,
                    width: 90,
                    decoration: BoxDecoration(
                      color: Color(0xFF2563EB),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text(
                        'Save',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ),
                ),
                // SizedBox(width: 10),
                InkWell(
                  onTap: () async {},
                  child: Container(
                    margin: EdgeInsets.only(left: 16, bottom: 10),
                    height: 35,
                    width: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text(
                        'Print',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PatientInfo extends StatefulWidget {
  const PatientInfo({super.key});

  @override
  State<PatientInfo> createState() => _PatientInfoState();
}

class _PatientInfoState extends State<PatientInfo> {
  DateTime? _selectedDate;
  final TextEditingController _dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        height: 600,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12),
            Text(
              'Patient Info',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            CommonDropDownField(
              items: ['ID1', 'ID2', 'ID3'],
              labelText: 'Lab Id',
              onChanged: (value) {
                // Handle your logic here
                print("Selected: $value");
                // setState(() => yourSelectedValue = value);
              },
            ),
            SizedBox(height: 8),
            CommonTextField(labelText: 'Patient Name'),
            SizedBox(height: 8),
            CommonTextField(labelText: 'Contact Number'),
            SizedBox(height: 8),
            Row(
              children: [
                SizedBox(
                  width: 100,
                  child: CommonDropDownField(
                    items: ['Dr', 'Self'],
                    labelText: 'Ref By',
                    onChanged: (value) {
                      // Handle your logic here
                      print("Selected: $value");
                      // setState(() => yourSelectedValue = value);
                    },
                  ),
                ),
                SizedBox(width: 8),
                Expanded(child: CommonTextField(labelText: 'Refer Name')),
              ],
            ),
            SizedBox(height: 8),
            CommonTextField(labelText: 'Age'),
            SizedBox(height: 8),
            CommonDropDownField(
              items: ['Male', 'Female', 'Transgender', 'Other'],
              labelText: 'Sex',
              onChanged: (value) {
                // Handle your logic here
                print("Selected: $value");
                // setState(() => yourSelectedValue = value);
              },
            ),
            SizedBox(height: 8),
            CommonTextField(labelText: 'PRN'),
            SizedBox(height: 8),
            CommonTextField(
              controller: _dateController,
              isReadOnly: true,
              onTap: () async {
                FocusScope.of(
                  context,
                ).requestFocus(FocusNode()); // Remove keyboard
                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: _selectedDate ?? DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (picked != null) {
                  setState(() {
                    _selectedDate = picked;
                    _dateController.text =
                        "${picked.day}/${picked.month}/${picked.year}";
                  });
                }
              },
              labelText: 'Reg. Date',
              // validator: (value) =>
              //     value == null || value.isEmpty ? 'Required' : null,
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class CustomeHeader extends StatelessWidget {
  const CustomeHeader({
    super.key,
    required GlobalKey<ScaffoldState> scaffoldKey,
  }) : _scaffoldKey = scaffoldKey;

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: InkWell(
                  onTap: () => _scaffoldKey.currentState!.openDrawer(),
                  child: const Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Icon(Icons.menu, color: Colors.grey, size: 25),
                  ),
                ),
              ),

              Text(
                Responsive.isDesktop(context) || Responsive.isTablet(context)
                    ? 'Pathology Lab Software'
                    : 'PLABSOFT',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 300,
                height: 30,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey,
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 5),
                    hintText: 'Search Patient By Id/Name',
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 21,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
              InkWell(
                onTap: () => _scaffoldKey.currentState!.openEndDrawer(),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: SvgPicture.asset("assets/svg/Profile.svg", width: 22),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class EditableTestTable extends StatefulWidget {
  const EditableTestTable({super.key});

  @override
  EditableTestTableState createState() => EditableTestTableState();
}

class EditableTestTableState extends State<EditableTestTable> {
  ///
  final ScrollController _scrollController = ScrollController();

  List<TestEntry1> testEntries = [
    TestEntry1(code: "CBC", description: "Complete Blood Count", fee: 300),
    TestEntry1(code: "LFT", description: "Liver Function Test", fee: 600),
  ];

  void _addEmptyRow() {
    setState(() {
      testEntries.add(TestEntry1(code: '', description: '', fee: 0));
    });
  }

  void _removeRow(int index) {
    setState(() {
      testEntries.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              // Table header
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),

                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                child: Row(
                  children: [
                    _headerCell("Code"),
                    _headerCell("Test Description"),
                    _headerCell("Fee"),
                    SizedBox(width: 40), // For delete icon
                  ],
                ),
              ),
              Divider(height: 0),

              // Table rows
              SizedBox(
                height: 250,
                child: Scrollbar(
                  thumbVisibility: true,
                  controller: _scrollController,
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: testEntries.length,
                    itemBuilder: (ctx, i) {
                      final test = testEntries[i];
                      return Row(
                        children: [
                          SizedBox(width: 8),
                          _editableCell(
                            isRead: true,
                            initialValue: test.code,
                            onChanged: (val) => setState(
                              () => testEntries[i] = test.copyWith(code: val),
                            ),
                          ),
                          _editableCell(
                            initialValue: test.description,
                            onChanged: (val) => testEntries[i] = test.copyWith(
                              description: val,
                            ),
                            flex: 2,
                          ),
                          _editableCell(
                            initialValue: test.fee.toString(),
                            onChanged: (val) => testEntries[i] = test.copyWith(
                              fee: double.tryParse(val) ?? 0,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete_outline, color: Colors.red),
                            onPressed: () => _removeRow(i),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              Divider(color: Colors.grey.shade300),
              Row(
                children: [
                  InkWell(
                    onTap: () async {
                      final code = await showDialog<String>(
                        context: context,
                        builder: (context) => _AddCodeDialog(),
                      );

                      if (code != null && code.isNotEmpty) {
                        setState(() {
                          testEntries.add(
                            TestEntry1(code: code, description: '', fee: 0),
                          );
                        });
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 16, bottom: 10),
                      height: 35,
                      width: 90,
                      decoration: BoxDecoration(
                        color: Color(0xFF2563EB),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Text(
                          '+ Add Test',

                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _headerCell(String text, {int flex = 1}) {
    return Expanded(
      flex: flex,
      child: Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Widget _editableCell({
    bool isRead = false,
    required String initialValue,
    required ValueChanged<String> onChanged,
    int flex = 1,
  }) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          readOnly: isRead,
          initialValue: initialValue,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            isDense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}

class TestEntry1 {
  final String code;
  final String description;
  final double fee;

  TestEntry1({
    required this.code,
    required this.description,
    required this.fee,
  });

  TestEntry1 copyWith({String? code, String? description, double? fee}) {
    return TestEntry1(
      code: code ?? this.code,
      description: description ?? this.description,
      fee: fee ?? this.fee,
    );
  }
}

class _AddCodeDialog extends StatefulWidget {
  const _AddCodeDialog();
  @override
  State<_AddCodeDialog> createState() => _AddCodeDialogState();
}

class _AddCodeDialogState extends State<_AddCodeDialog> {
  String? selectedValue;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: AlertDialog(
        title: Text('Enter Test Code'),
        content: CommonDropDownField(
          items: ['CBC', 'LFT'],
          labelText: 'Code',
          onChanged: (value) {
            setState(() => selectedValue = value);
          },
        ),
        actions: [
          TextButton(
            child: Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            child: Text('Add'),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.pop(context, selectedValue);
              }
            },
          ),
        ],
      ),
    );
  }
}
