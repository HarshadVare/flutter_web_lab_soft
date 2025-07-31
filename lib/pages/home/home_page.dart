import 'package:flutter/material.dart';
import 'package:primecare_lab_soft/pages/home/widgets/header_widget.dart';
import 'package:primecare_lab_soft/responsive.dart';

class HomePage extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const HomePage({super.key, required this.scaffoldKey});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SizedBox height(BuildContext context) =>
        SizedBox(height: Responsive.isDesktop(context) ? 30 : 20);

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.isMobile(context) ? 15 : 18,
          ),
          child: Column(
            children: [
              SizedBox(height: Responsive.isMobile(context) ? 5 : 18),
              Header(scaffoldKey: widget.scaffoldKey),
              SizedBox(height: Responsive.isMobile(context) ? 5 : 18),
              Row(
                children: [
                  Expanded(child: EntryForm()),
                  Expanded(child: Container()),
                  Expanded(child: Container()),
                ],
              ),

              // height(context),
              // const ActivityDetailsCard(),
              // height(context),
              // LineChartCard(),
              // height(context),
              // BarGraphCard(),
              // height(context),
            ],
          ),
        ),
      ),
    );
  }
}

class EntryForm extends StatefulWidget {
  const EntryForm({super.key});

  @override
  State<EntryForm> createState() => _EntryFormState();
}

class _EntryFormState extends State<EntryForm> {
  DateTime? _selectedDate;
  final TextEditingController _dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (Responsive.isDesktop(context) || Responsive.isTablet(context))
          Column(
            children: [
              CommonDropDownField(
                items: ['ID1', 'ID2', 'ID3'],
                labelText: 'Lab Id',
              ),
              SizedBox(height: 8),
              CommonTextField(labelText: 'Patient Name'),
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
              Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: CommonDropDownField(
                      items: ['Dr', 'Self'],
                      labelText: 'Ref By',
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
              ),
              SizedBox(height: 8),
              CommonDropDownField(
                items: ['Main Lab', 'Other Lab'],
                labelText: 'Location',
              ),
              SizedBox(height: 8),
              CommonDropDownField(
                items: [
                  'Sample Collected At Lab',
                  'Sample Collected At Home',
                  'Sample Collected At Hospital/Clinic',
                ],
                labelText: 'Smaple Info',
              ),
            ],
          ),

        // Column(
        //   children: [
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         Expanded(
        //           child: DropDownField(
        //             items: ['ID1', 'ID2', 'ID3'],
        //             labelText: 'Lab Id',
        //           ),
        //         ),
        //         SizedBox(width: 8),
        //         Expanded(child: TextField(labelText: 'Patient Name')),
        //         SizedBox(width: 8),

        //         Expanded(
        //           child: TextField(
        //             controller: _dateController,
        //             isReadOnly: true,
        //             onTap: () async {
        //               FocusScope.of(
        //                 context,
        //               ).requestFocus(FocusNode()); // Remove keyboard
        //               DateTime? picked = await showDatePicker(
        //                 context: context,
        //                 initialDate: _selectedDate ?? DateTime.now(),
        //                 firstDate: DateTime(2000),
        //                 lastDate: DateTime(2100),
        //               );
        //               if (picked != null) {
        //                 setState(() {
        //                   _selectedDate = picked;
        //                   _dateController.text =
        //                       "${picked.day}/${picked.month}/${picked.year}";
        //                 });
        //               }
        //             },
        //             labelText: 'Reg. Date',
        //             // validator: (value) =>
        //             //     value == null || value.isEmpty ? 'Required' : null,
        //           ),
        //         ),
        //       ],
        //     ),
        //     SizedBox(height: Responsive.isMobile(context) ? 5 : 8),
        //     Row(
        //       children: [
        //         SizedBox(
        //           width: 100,
        //           child: DropDownField(
        //             items: ['Dr', 'Self'],
        //             labelText: 'Ref By',
        //           ),
        //         ),
        //         SizedBox(width: 8),
        //         Expanded(child: TextField(labelText: 'Refer Name')),
        //       ],
        //     ),
        //     SizedBox(height: Responsive.isMobile(context) ? 5 : 8),
        //     Row(
        //       children: [
        //         Expanded(child: TextField(labelText: 'Age')),
        //         SizedBox(width: 8),
        //         Expanded(
        //           child: DropDownField(
        //             items: ['Male', 'Female', 'Transgender', 'Other'],
        //             labelText: 'Sex',
        //           ),
        //         ),
        //       ],
        //     ),
        //     SizedBox(height: Responsive.isMobile(context) ? 5 : 8),
        //     Row(
        //       children: [Expanded(child: TextField(labelText: 'Contact No'))],
        //     ),
        //     SizedBox(height: Responsive.isMobile(context) ? 5 : 8),
        //     Row(
        //       children: [
        //         Expanded(
        //           child: DropDownField(
        //             items: ['Main Lab', 'Other Lab'],
        //             labelText: 'Location',
        //           ),
        //         ),
        //         SizedBox(width: 8),
        //         Expanded(
        //           child: DropDownField(
        //             items: [
        //               'Sample Collected At Lab',
        //               'Sample Collected At Home',
        //               'Sample Collected At Hospital/Clinic',
        //             ],
        //             labelText: 'Smaple Info',
        //           ),
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
        if (Responsive.isMobile(context))
          Column(
            children: [
              CommonDropDownField(
                items: ['ID1', 'ID2', 'ID3'],
                labelText: 'Lab Id',
              ),
            ],
          ),
      ],
    );
  }
}

class CommonDropDownField extends StatefulWidget {
  final String labelText;
  final List<String> items;
  final String? selectedValue;
  const CommonDropDownField({
    super.key,
    required this.items,
    required this.labelText,
    this.selectedValue,
  });

  @override
  State<CommonDropDownField> createState() => _DropDownFieldState();
}

class _DropDownFieldState extends State<CommonDropDownField> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          labelText: widget.labelText,
          border: OutlineInputBorder(),
        ),
        items: widget.items.map((item) {
          return DropdownMenuItem<String>(value: item, child: Text(item));
        }).toList(),
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value;
          });
        },
        // validator: (value) =>
        //     value == null ? 'Please select an option' : null,
      ),
    );
  }
}

class CommonTextField extends StatelessWidget {
  final VoidCallback? onTap;
  final String labelText;
  final bool? isReadOnly;
  final TextEditingController? controller;
  const CommonTextField({
    super.key,
    required this.labelText,
    this.onTap,
    this.isReadOnly = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        ),
        readOnly: isReadOnly ?? false,
        onSaved: (value) {},
        onTap: onTap,
        validator: (value) =>
            value == null || value.isEmpty ? 'Required' : null,
      ),
    );
  }
}
