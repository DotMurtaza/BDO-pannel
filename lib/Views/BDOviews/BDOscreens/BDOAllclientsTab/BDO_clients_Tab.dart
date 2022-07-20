import 'package:bdo_pannel/SizeConfig/size_config.dart';
import 'package:bdo_pannel/controllers/clientController.dart';
import 'package:bdo_pannel/models/BDO_clients_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'components/BDO_client_info_tile.dart';

class BDOclientsTab extends StatelessWidget {
  const BDOclientsTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          GetX<ClientController>(
              init: Get.put(ClientController()),
              builder: (ClientController clientController) {
                if (clientController != null &&
                    clientController.client != null) {
                  return Container(
                    height: SizeConfig.heightMultiplier * 73,
                    width: SizeConfig.screenWidth,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: ListView.builder(
                          itemCount: clientController.client.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            print(
                                "Client name is ${clientController.client[index].clientName}");

                            return BDOclientInfoTiles(
                              clientModel: clientController.client[index],
                            );
                          }),
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })
        ],
      ),
    );
  }
}
