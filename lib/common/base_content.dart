import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/constants.dart';
import 'package:responsive_admin_dashboard/constants/responsive.dart';
import 'package:responsive_admin_dashboard/screens/components/analytic_cards.dart';
import 'package:responsive_admin_dashboard/screens/components/custom_appbar.dart';
import 'package:responsive_admin_dashboard/screens/components/top_referals.dart';
import 'package:responsive_admin_dashboard/screens/components/users.dart';
import 'package:responsive_admin_dashboard/screens/components/users_by_device.dart';
import 'package:responsive_admin_dashboard/screens/components/viewers.dart';

import '../screens/components/discussions.dart';
import '../screens/components/table.dart';

import 'package:file_picker/file_picker.dart';

class BaseContent extends StatelessWidget {
  BaseContent(this.menu);

  DataTableSource _data = MyTable();

  String menu;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(appPadding),
        child: Column(
          children: [
            CustomAppbar(),
            SizedBox(
              height: appPadding,
            ),
            if (this.menu == "dashboard")
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Column(
                          children: [
                            AnalyticCards(),
                            SizedBox(
                              height: appPadding,
                            ),
                            Users(),
                            if (Responsive.isMobile(context))
                              SizedBox(
                                height: appPadding,
                              ),
                            if (Responsive.isMobile(context)) Discussions(),
                          ],
                        ),
                      ),
                      if (!Responsive.isMobile(context))
                        SizedBox(
                          width: appPadding,
                        ),
                      if (!Responsive.isMobile(context))
                        Expanded(
                          flex: 2,
                          child: Discussions(),
                        ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Column(
                          children: [
                            SizedBox(
                              height: appPadding,
                            ),
                            Row(
                              children: [
                                if (!Responsive.isMobile(context))
                                  Expanded(
                                    child: TopReferals(),
                                    flex: 2,
                                  ),
                                if (!Responsive.isMobile(context))
                                  SizedBox(
                                    width: appPadding,
                                  ),
                                Expanded(
                                  flex: 3,
                                  child: Viewers(),
                                ),
                              ],
                              crossAxisAlignment: CrossAxisAlignment.start,
                            ),
                            SizedBox(
                              height: appPadding,
                            ),
                            if (Responsive.isMobile(context))
                              SizedBox(
                                height: appPadding,
                              ),
                            if (Responsive.isMobile(context)) TopReferals(),
                            if (Responsive.isMobile(context))
                              SizedBox(
                                height: appPadding,
                              ),
                            if (Responsive.isMobile(context)) UsersByDevice(),
                          ],
                        ),
                      ),
                      if (!Responsive.isMobile(context))
                        SizedBox(
                          width: appPadding,
                        ),
                      if (!Responsive.isMobile(context))
                        Expanded(
                          flex: 2,
                          child: UsersByDevice(),
                        ),
                    ],
                  ),
                ],
              ),
            if (this.menu == "ocr_system")
              PaginatedDataTable(
                  source: _data,
                  header: Row (
                    children: [
                      Row(children: [
                        Icon(
                          Icons.newspaper,
                          size: 20,
                        ),
                        Text("OCR System"),

                      ],),
                      Spacer(),
                      ElevatedButton.icon(
                        icon: Icon(Icons.add, size: 18),
                        label: Text('Upload', style: TextStyle(fontSize: 20.0),),
                        onPressed: () {},)
                    ],
                  ),
                  columns: [
                    DataColumn(label: Container(
                        width: width * .3,
                        child: Text("Name")
                    )),
                    DataColumn(label: Container(
                        width: width * .1,
                        child: Text("Status")
                    )),
                    DataColumn(label: Container(
                        width: width * .1,
                        child: Text("Data reviewed")
                    )),
                    DataColumn(label: Container(
                        width: width * .1,
                        child: Text("Created at")
                    )),
                    DataColumn(label: Container(
                        width: width * .1,
                        child: Text("Detail")
                    )),
                  ],
                ),
          ],
        ),
      ),
    );
  }

}