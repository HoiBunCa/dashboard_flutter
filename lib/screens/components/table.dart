import 'dart:math';

import 'package:flutter/material.dart';

class MyTable extends DataTableSource {

  final List<Map<String, dynamic>> _data = List.generate(100, (index) => {
    "name": "file $index",
    "status": "success",
    "dataReviewed": true,
    "createdAt": DateTime.now().toString()
  });

  @override
  DataRow? getRow(int index) {
    // TODO: implement getRow
    try {
      return DataRow(cells: [
        DataCell(Text(_data[index]['name'].toString())),
        DataCell(Text(_data[index]['status'].toString())),
        DataCell(Text(_data[index]['dataReviewed'].toString())),
        DataCell(Text(_data[index]['createdAt'].toString())),
        DataCell(
          IconButton(
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: const Icon(Icons.details),
            onPressed: () => onRowSelect(index),
          ),
        ),
      ]);
    } on Exception catch (_) {
      throw UnimplementedError();
    }
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => this._data.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;

  onRowSelect(int index) {}
  
}