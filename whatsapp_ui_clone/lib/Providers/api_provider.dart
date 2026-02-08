import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../Constants/apis.dart';
import '../Helpers/http_helper.dart';
import '../Models/api_data_model.dart';
import '../Utils/show_toaster_message.dart';

class ApiProvider extends ChangeNotifier {
  List<ApiDataModel> apiData = <ApiDataModel>[];
  bool isLoading = false;

  // User form entries
  final titleController = TextEditingController();
  bool isTaskCompleted = false;

  bool isGoogleSigningIn = false;

  Future<void> getApiData({required BuildContext context}) async {
    isLoading = true;
    apiData.clear();
    final NetworkHelper networkHelper = NetworkHelper(url: getApi);
    await networkHelper.getData().then((value) {
      if (value.statusCode == 200) {
        List response = json.decode(value.body);
        for (var i = 0; i < response.length; i++) {
          apiData.add(ApiDataModel.fromJson(json: response[i]));
        }
        // Future.delayed(Duration(seconds: 2), () {
        isLoading = false;
        //   notifyListeners();
        // });
      } else {
        // Show error message to the user
        showCustomToaster(context: context, message: "Something went wrong");
      }
    });
    notifyListeners();
  }

  void sendDataToServer({required BuildContext context}) {
    final NetworkHelper networkHelper = NetworkHelper(url: postApi);
    Map body = {"title": titleController.text, "completed": isTaskCompleted};
    networkHelper.postData(body: body).then((value) {
      if (value.statusCode == 200) {
        // sb kuch shi hai
        showCustomToaster(context: context, message: "Data saved successfully");
      } else {
        showCustomToaster(context: context, message: "Someting went wrong");
      }
    });
  }

  void updateDataOnServer({required BuildContext context}) {
    final NetworkHelper networkHelper = NetworkHelper(url: putApi);
    Map body = {"title": titleController.text, "completed": isTaskCompleted};
    networkHelper.putData(body: body).then((value) {
      if (value.statusCode == 201) {
        // sb kuch shi hai
        showCustomToaster(
          context: context,
          message: "Data updated successfully",
        );
      } else {
        showCustomToaster(context: context, message: "Someting went wrong");
      }
    });
  }

  void deleteDataOnServer({required BuildContext context, required String id}) {
    final NetworkHelper networkHelper = NetworkHelper(url: deleteApi + id);
    networkHelper.deleteData().then((value) {
      if (value.statusCode == 204) {
        // sb kuch shi hai
        showCustomToaster(
          context: context,
          message: "Data deleted successfully",
        );
      } else {
        showCustomToaster(context: context, message: "Someting went wrong");
      }
    });
  }

  Future<void> loginWithGoogle({required BuildContext context}) async {
    try {
      isGoogleSigningIn = true;

      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? account = await googleSignIn.signIn();
      if (account != null) {
        // Google login success do anything here on google success
        Map body = {
          "display_name": account.displayName ?? "",
          "email": account.email,
          "id": account.id,
          "photo_url": account.photoUrl ?? "",
        }; // Use this body if needed anywhere
      } else {
        debugPrint('Google sign-in cancelled');
      }
    } catch (e) {
      debugPrint('Google sign-in error: $e');
    } finally {
      isGoogleSigningIn = false;
    }
  }
}
