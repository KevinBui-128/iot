import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:du_an_iot/configs/configs.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text_plugins/speech_to_text_plugins.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  SpeechToTextPlugins speechToTextPlugins = SpeechToTextPlugins();
  DatabaseReference firebase = FirebaseDatabase.instance.reference();
  @override
  HomeState get initialState => HomeInitial();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    try {
      // Yard - Gara
      if (event is PressBtnLampYardEvent) {
        Utils.denSan = !Utils.denSan;
        if (Utils.denSan == true) {
          // firebase.update({'CUA_NHA': '1'});
        } else {
          // firebase.update({'CUA_NHA': '0'});
        }
        yield LampYardState();
      }
      if (event is PressBtnDoorYardEvent) {
        Utils.cuaNha = !Utils.cuaNha;
        if (Utils.cuaNha == true) {
          firebase.update({'CUA_NHA': '1'});
        } else {
          firebase.update({'CUA_NHA': '0'});
        }
        yield DoorYardState();
      }
      if (event is PressBtnClothesYardEvent) {
        Utils.quanAo = !Utils.quanAo;
        if (Utils.quanAo == true) {
          firebase.update({'PHOI_QUAN_AO': '1'});
        } else {
          firebase.update({'PHOI_QUAN_AO': '0'});
        }
        yield ClothesYardState();
      }
      // Living room
      if (event is PressBtnLampLivingEvent) {
        Utils.denKhach = !Utils.denKhach;
        if (Utils.denKhach == true) {
          firebase.update({'DEN_PHONG_KHACH': '1'});
        } else {
          firebase.update({'DEN_PHONG_KHACH': '0'});
        }
        yield LampLivingState();
      }
      if (event is PressBtnFanLivingEvent) {
        Utils.quatKhach = !Utils.quatKhach;
        if (Utils.quatKhach == true) {
          firebase.update({'DEN_PHONG_NGU_2': '1'});
        } else {
          firebase.update({'DEN_PHONG_NGU_2': '0'});
        }
        yield FanLivingState();
      }
      // Bedroom
      if (event is PressBtnLampBedEvent) {
        Utils.denNgu = !Utils.denNgu;
        if (Utils.denNgu == true) {
          firebase.update({'DEN_PHONG_NGU': '1'});
        } else {
          firebase.update({'DEN_PHONG_NGU': '0'});
        }
        yield LampBedState();
      }
      if (event is PressBtnFanBedEvent) {
        Utils.quatNgu = !Utils.quatNgu;
        if (Utils.quatNgu == true) {
          firebase.update({'QUAT_PHONG_NGU': '1'});
        } else {
          firebase.update({'QUAT_PHONG_NGU': '0'});
        }
        yield FanBedState();
      }
      // Kitchen
      if (event is PressBtnLampKitchenEvent) {
        Utils.denBep = !Utils.denBep;
        if (Utils.denBep == true) {
          firebase.update({'DEN_PHONG_BEP': '1'});
        } else {
          firebase.update({'DEN_PHONG_BEP': '0'});
        }
        yield LampKitchenState();
      }
      if (event is PressBtnFanKitchenEvent) {
        Utils.quatBep = !Utils.quatBep;
        if (Utils.quatBep == true) {
          firebase.update({'QUAT_PHONG_BEP': '1'});
        } else {
          firebase.update({'QUAT_PHONG_BEP': '0'});
        }
        yield FanKitchenState();
      }
      // Bathroom
      if (event is PressBtnLampBathEvent) {
        Utils.denTam = !Utils.denTam;
        if (Utils.denTam == true) {
          firebase.update({'DEN_PHONG_TAM': '1'});
        } else {
          firebase.update({'DEN_PHONG_TAM': '0'});
        }
        yield LampBathState();
      }
      if (event is PressBtnFanBathEvent) {
        yield FanBathState();
      }
      // Voice
      if (event is PressBtnCheckVoiceEvent) {
        speechToTextPlugins.listen().then((onValue) {
          Utils.voiceListen = true;
          Utils.resultText = onValue[0];
          checkText(Utils.resultText, event.context);
          print(Utils.resultText);
        });
        yield CheckVoiceState();
      }
      if (event is PressBtnUncheckVoiceEvent) {
        speechToTextPlugins.cancel().then((onValue) {
          Utils.voiceListen = false;
          Utils.resultText = "";
          print(onValue);
        });
        yield UncheckVoiceState();
      }
    } catch (e) {
      print(e.toString());
      yield ErrorState(
          errorTitle: "Error Message", errorMessage: "Error ${e.toString()}");
    }
  }

  void checkText(String resultText, BuildContext context) {
    switch (resultText) {
      // Living
      case "turn on the living room lamp":
        {
          Utils.denKhach = true;
          firebase.update({'DEN_PHONG_KHACH': '1'});
          print("den khach batttttttttttt");
        }
        break;
      case "turn off the living room lamp":
        {
          Utils.denKhach = false;
          firebase.update({'DEN_PHONG_KHACH': '0'});
          print("Den khach tatttttttttttttttt");
        }
        break;
      case "turn on the living room fan":
        {
          Utils.quatKhach = true;
          firebase.update({'QUAT_PHONG_KHACH': '1'});
          print("Bật quạt khách");
        }
        break;
      case "turn off the living room fan":
        {
          Utils.quatKhach = false;
          firebase.update({'QUAT_PHONG_KHACH': '0'});
          print("Tắt quạt khách");
        }
        break;
      //
      case "Turn on the living room lamp":
        {
          Utils.denKhach = true;
          firebase.update({'DEN_PHONG_KHACH': '1'});
          print("den khach batttttttttttt");
        }
        break;
      case "Turn off the living room lamp":
        {
          Utils.denKhach = false;
          firebase.update({'DEN_PHONG_KHACH': '0'});
          print("Den khach tatttttttttttttttt");
        }
        break;
      case "Turn on the living room fan":
        {
          Utils.quatKhach = true;
          firebase.update({'QUAT_PHONG_KHACH': '1'});
          print("Bật quạt khách");
        }
        break;
      case "Turn off the living room fan":
        {
          Utils.quatKhach = false;
          firebase.update({'QUAT_PHONG_KHACH': '0'});
          print("Tắt quạt khách");
        }
        break;
      // Bedroom
      case "turn on the bedroom lamp":
        {
          Utils.denNgu = true;
          firebase.update({'DEN_PHONG_NGU': '1'});
          print("bật quạt ngủ");
        }
        break;
      case "turn off the bedroom lamp":
        {
          Utils.denNgu = false;
          firebase.update({'DEN_PHONG_NGU': '0'});
          print("bật quạt ngủ");
        }
        break;
      case "turn on the bedroom fan":
        {
          Utils.quatNgu = true;
          firebase.update({'QUAT_PHONG_NGU': '1'});
        }
        break;
      case "turn off the bedroom fan":
        {
          Utils.quatNgu = false;
          firebase.update({'QUAT_PHONG_NGU': '0'});
        }
        break;
      //
      case "Turn on the bedroom lamp":
        {
          Utils.denNgu = true;
          firebase.update({'DEN_PHONG_NGU': '1'});
          print("bật quạt ngủ");
        }
        break;
      case "Turn off the bedroom lamp":
        {
          Utils.denNgu = false;
          firebase.update({'DEN_PHONG_NGU': '0'});
          print("bật quạt ngủ");
        }
        break;
      case "Turn on the bedroom fan":
        {
          Utils.quatNgu = true;
          firebase.update({'QUAT_PHONG_NGU': '1'});
        }
        break;
      case "Turn off the bedroom fan":
        {
          Utils.quatNgu = false;
          firebase.update({'QUAT_PHONG_NGU': '0'});
        }
        break;
      // Kitchen
      case "turn on the kitchen lamp":
        {
          Utils.denBep = true;
          firebase.update({'DEN_PHONG_BEP': '1'});
          print("bật quạt ngủ");
        }
        break;
      case "turn off the kitchen lamp":
        {
          Utils.denBep = false;
          firebase.update({'DEN_PHONG_BEP': '0'});
          print("bật quạt ngủ");
        }
        break;
      case "turn on the kitchen fan":
        {
          Utils.quatBep = true;
          firebase.update({'QUAT_PHONG_BEP': '1'});
        }
        break;
      case "turn off the kitchen fan":
        {
          Utils.quatBep = false;
          firebase.update({'QUAT_PHONG_BEP': '0'});
        }
        break;
      //
      case "Turn on the kitchen lamp":
        {
          Utils.denBep = true;
          firebase.update({'DEN_PHONG_BEP': '1'});
          print("bật quạt ngủ");
        }
        break;
      case "Turn off the kitchen lamp":
        {
          Utils.denBep = false;
          firebase.update({'DEN_PHONG_BEP': '0'});
          print("bật quạt ngủ");
        }
        break;
      case "Turn on the kitchen fan":
        {
          Utils.quatBep = true;
          firebase.update({'QUAT_PHONG_BEP': '1'});
        }
        break;
      case "Turn off the kitchen fan":
        {
          Utils.quatBep = false;
          firebase.update({'QUAT_PHONG_BEP': '0'});
        }
        break;
      // Bathroom
      case "turn on the bathroom lamp":
        {
          Utils.denTam = true;
          firebase.update({'DEN_PHONG_TAM': '1'});
          print("bật quạt ngủ");
        }
        break;
      case "turn off the bathroom lamp":
        {
          Utils.denTam = false;
          firebase.update({'DEN_PHONG_TAM': '0'});
          print("bật quạt ngủ");
        }
        break;
      case "turn on the bathroom fan":
        {
          Utils.quatTam = true;
          firebase.update({'QUAT_PHONG_TAM': '1'});
        }
        break;
      case "turn off the bathroom fan":
        {
          Utils.quatTam = false;
          firebase.update({'QUAT_PHONG_TAM': '0'});
        }
        break;
      //
      case "Turn on the bathroom lamp":
        {
          Utils.denTam = true;
          firebase.update({'DEN_PHONG_TAM': '1'});
          print("bật quạt ngủ");
        }
        break;
      case "Turn off the bathroom lamp":
        {
          Utils.denTam = false;
          firebase.update({'DEN_PHONG_TAM': '0'});
          print("bật quạt ngủ");
        }
        break;
      case "Turn on the bathroom fan":
        {
          Utils.quatTam = true;
          firebase.update({'QUAT_PHONG_TAM': '1'});
        }
        break;
      case "Turn off the bathroom fan":
        {
          Utils.quatTam = false;
          firebase.update({'QUAT_PHONG_TAM': '0'});
        }
        break;
      default:
        {
          _showDialog(context, "Warning!!!", "The statement does not exist");
        }
    }
  }

  _showDialog(BuildContext mainContext, String title, String message) async {
    await showDialog(
      context: mainContext,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text("Ok"),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
