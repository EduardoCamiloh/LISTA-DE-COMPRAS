import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'itens_controller.dart';

class MyWidget extends StatelessWidget {
  MyWidget({super.key});

  final listController = Get.put(ListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Lista de itens'),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          bottom: 15,
          right: 10,
          left: 10,
          top: 15,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: GetBuilder<ListController>(
                init: ListController(),
                builder: (_) {
                  return TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Pesquisar itens',
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: (query) {
                      listController.searchItems(query);
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Expanded(
              child: GetBuilder<ListController>(
                init: ListController(),
                builder: (_) {
                  listController.filteredItems.sort((a, b) =>
                      b.checked.toString().compareTo(a.checked.toString()));
                  return ListView.builder(
                    itemCount: listController.filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = listController.filteredItems[index];
                      return Card(
                        color: Colors.green,
                        child: CheckboxListTile(
                          title: Text(
                            item.name,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          value: item.checked,
                          onChanged: (value) {
                            item.checked = value!;
                            listController.saveList();
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
