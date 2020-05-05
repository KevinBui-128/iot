import 'package:du_an_iot/blocs/home_bloc/home_bloc.dart';
import 'package:du_an_iot/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BathroomPage extends StatefulWidget {
  @override
  _BathroomPageState createState() => _BathroomPageState();
}

class _BathroomPageState extends State<BathroomPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 15, 0, 5),
                      child: Text(
                        Utils.titlePhongTam,
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Divider(),
                    Container(
                      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
                      height: 150,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: InkWell(
                          onTap: () {
                            BlocProvider.of<HomeBloc>(context)
                                .add(PressBtnLampBathEvent());
                          },
                          splashColor: Colors.red,
                          child: Center(
                              child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                child: Image.asset(
                                    Utils.denTam
                                        ? Utils.batDenTam
                                        : Utils.tatDenTam,
                                    width: 50),
                              ),
                              Text(
                                Utils.denTam
                                    ? Utils.denTamBat
                                    : Utils.denTamTat,
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          )),
                        ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.fromLTRB(13, 10, 13, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 100,
                        color: Colors.white12,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(Utils.titleNhietDo,
                                    style: TextStyle(
                                      fontSize: 15,
                                    )),
                                Text(Utils.nhietDo,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.redAccent))
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(Utils.titleDoAm,
                                    style: TextStyle(fontSize: 15)),
                                Text(Utils.doAm,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueAccent))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
