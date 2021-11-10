import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trabalho_final_dadm/components/capi.dart';
import 'package:trabalho_final_dadm/components/common.dart';
import 'package:trabalho_final_dadm/pages/steps_to_recycle_page.dart';
import 'package:trabalho_final_dadm/themes/app_colors.dart';

class CollectView extends StatefulWidget {
  State createState() => new _CollectViewState();
}

class _CollectViewState extends State<CollectView> {
  static final LatLng _kMapCenter =
  LatLng(-25.49929446887696, -54.558638968154305);

  static final CameraPosition _kInitialPosition =
  CameraPosition(target: _kMapCenter, zoom: 10.0, tilt: 0, bearing: 0);

  GoogleMapController _controller;

  Future<void> onMapCreated(GoogleMapController controller) async {
    _controller = controller;
  }

  Set<Marker> _createMarker() {
    return {
      //Marker(
      //markerId: MarkerId("marker_1"),
      // position: _kMapCenter,
      //infoWindow: InfoWindow(title: 'Local de coleta 1')),
      Marker(
          markerId: MarkerId("marker_4"),
          position: LatLng(-25.504341075397775, -54.59064289566422),
          infoWindow: InfoWindow(title: 'Reciclafoz Reciclagem')),
      Marker(
          markerId: MarkerId("marker_5"),
          position: LatLng(-25.49563805936276, -54.52464466682039),
          infoWindow: InfoWindow(title: 'Recicladora Nª Srª Aparecida')),
      Marker(
          markerId: MarkerId("marker_6"),
          position: LatLng(-25.542770868982565, -54.590700334118345),
          infoWindow: InfoWindow(title: 'RS Reciclagem')),
      Marker(
          markerId: MarkerId("marker_7"),
          position: LatLng(-25.500338142086147, -54.53142820234391),
          infoWindow: InfoWindow(title: 'Recicladora Foz do Iguaçu')),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(
        children: [
          buildTopPageTitle(
              title: "Locais de coleta em Foz do Iguaçu"),
          Container(
            height: 400,
            child: GoogleMap(
              initialCameraPosition: _kInitialPosition,
              onMapCreated: onMapCreated,
              myLocationEnabled: true,
              markers: _createMarker(),
            ),
          ),
          Padding(
              padding: EdgeInsets.all(10),
              child: capi(text: "Depois de separar o lixo, devemos descartá-lo adequadamente. "
                  "Veja alguns pontos de coleta aqui no mapa. Ah antes de "
                  "descartar, já viu como preparar o lixo?"
                  "E no site da prefeitura é possível consultar dia da coleta seletiva no seu bairro")
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return StepsToRecyclePage();
                  }),
                );
              },
              child: Text("Passo-a-passo para reciclar"),
            ),
          ),
        ],
      ),
    );
  }
}
