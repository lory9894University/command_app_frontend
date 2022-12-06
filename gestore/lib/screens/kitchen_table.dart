import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../res/preparation.dart';

const String jsonPreparations = """[
  {
    "dish": {
      "name": "il Petrone",
      "price": 5.50,
      "description": "panino con prosciutto e mozzarella",
      "imageUrl": "http://www.di.unito.it/~giovanna/gioNew1.jpg",
      "course": "Panino"
    },
    "tableDeliveryCode": "12",
    "state": "ready"
  },
  {
    "dish": {
      "name": "Risotto alla CMRO",
      "price": 5.22,
      "description": "Gvosso risotto per gvossi intenditori (Fakemuscles approves)",
      "imageUrl": "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.researchgate.net%2Fprofile%2FAndrea_Grosso%2F4&psig=AOvVaw3sNpMqQxN08jGPGKzd70v8&ust=1669741417373000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCNjr89Gt0fsCFQAAAAAdAAAAABAE",
      "course": "primo"
    },
    "tableDeliveryCode": "A46",
    "state": "underway"
  }
]
""";

class KitchenTable extends StatefulWidget {
  const KitchenTable({super.key});

  @override
  State<KitchenTable> createState() => _KitchenTableState();
}

class _KitchenTableState extends State<KitchenTable> {
  List<Preparation> preparationsList = List.empty(growable: true);

  @override
  void initState() {
    preparationsList += getSamplePreparations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO rendere le righe una reordable list
    return Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: DataTable(
                columnSpacing: 12,
                horizontalMargin: 12,
                columns: const <DataColumn>[
                  DataColumn(
                      label: Expanded(
                    child: Text(
                      'Preparazione',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  )),
                  DataColumn(
                      label: Expanded(
                    child: Text(
                      'Codice',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  )),
                  DataColumn(
                      label: Expanded(
                    child: Text(
                      'Stato',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  )),
                  DataColumn(
                      label: Expanded(
                    child: Text(
                      'Cambia Stato',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  )),
                ],
                rows: List<DataRow>.generate(
                    preparationsList.length,
                    (index) => DataRow(cells: [
                          DataCell(Text(preparationsList[index].dish.name)),
                          DataCell(
                              Text(preparationsList[index].tableDeliveryCode)),
                          DataCell(Text(preparationsList[index].state.str)),
                          DataCell(Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () => changeState(
                                      preparationsList[index],
                                      PreparationState.waiting),
                                  icon: const Icon(Icons.watch_later)),
                              IconButton(
                                  onPressed: () => changeState(
                                      preparationsList[index],
                                      PreparationState.underway),
                                  icon: const Icon(FontAwesomeIcons.briefcase)),
                              IconButton(
                                  onPressed: () => changeState(
                                      preparationsList[index],
                                      PreparationState.ready),
                                  icon: const Icon(Icons.done)),
                            ],
                          )),
                        ])))));
  }

  /// change state of 'prep' to 'state', renders to UI
  void changeState(Preparation prep, PreparationState state) {
    if (state == PreparationState.ready) {
      // preparation state set to ready, remove from preparation table
      prep.state = state;
      setState(() {
        preparationsList.remove(prep);
      });
    } else {
      // show new preparation state
      setState(() {
        prep.state = state;
      });
    }
  }
}