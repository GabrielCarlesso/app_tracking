import 'package:flutter/material.dart';

import 'package:track_app/model/property.dart';
import 'package:track_app/shared/app_colors.dart';
import 'package:track_app/shared/app_settings.dart';
import 'package:track_app/views/screens/heat_map.dart';
import 'package:track_app/views/screens/set_virtual_fence.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tracking App"),
      ),
      body: Container(
        padding: const EdgeInsets.all(24.0),
        width: AppSettings.screenWidth,
        height: AppSettings.screenHeight,
        color: AppColors.white,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    menuProp(
                      context: context,
                      property: Property("Fazenda 1"),
                    ),
                    menuProp(
                      context: context,
                      property: Property("Fazenda 2"),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 2,
                  child: buttonsMenu(
                      text: "Nova propriedade",
                      icon: const Icon(Icons.add_box_sharp, size: 18),
                      bottomFunction: go2newProperty),
                ),
                Flexible(
                  flex: 2,
                  child: buttonsMenu(
                    text: "Relatório",
                    icon: const Icon(Icons.map_outlined, size: 18),
                    bottomFunction: go2heatMap,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget menuProp({required Property property, required context}) {
    return Card(
      color: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: SizedBox(
        width: 300,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          ListTile(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            ),
            leading: const Icon(Icons.gite_sharp),
            title: Text(property.name),
            tileColor: AppColors.greenLight,
            trailing: const Icon(Icons.arrow_circle_right_outlined),
          ),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: const Text("Cow 1"),
                  subtitle: const Text("Status: ok"),
                  trailing: cowIcon(),
                ),
                ListTile(
                  title: const Text("Cow 2"),
                  subtitle: const Text("Status: ok"),
                  trailing: cowIcon(),
                ),
              ],
            ),
          ),
          const ListTile(
            trailing: Text("Total = {number}"),
          )
        ]),
      ),
    );
  }

  Widget cowIcon() {
    return const Image(
        image: AssetImage("assets/images/cow.png"), width: 24, height: 24);
  }

  Widget buttonsMenu({
    required String text,
    required Widget icon,
    required void Function() bottomFunction,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
      child: ElevatedButton.icon(
          onPressed: bottomFunction,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: AppColors.greenLight, // foreground
            padding: const EdgeInsets.all(15),
            elevation: 2,
            textStyle: const TextStyle(fontSize: 20),
          ),
          icon: icon,
          label: Text(
            text,
            maxLines: 2,
          )),
    );
  }

  void go2newProperty() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const VirtualFencePage()));
  }

  void go2heatMap() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HeatMapPage()));
  }
}
