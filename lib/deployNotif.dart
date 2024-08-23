import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';

FirebaseFunctions functions = FirebaseFunctions.instance;

final HttpsCallable callable =  functions.httpsCallable(
 'notifyUserTest'
);

Future<void> notifyUserTest({
  required String token,
  required String title,
  required String body,
  required String url,
}) async {
  try {
    final HttpsCallableResult result = await callable.call(<String, dynamic>{
      'title': 'On a un petit cadeau pour toi 👀🤎',
      'body': 'Réponds à notre petit questionnaire pour tenter de remporter un bon d’achat Aroma Zone',
      'url': 'https://form.dragnsurvey.com/survey/r/c6a44f40',
      'token': 'egFeHfB_QuK_YeX3t7Uazk:APA91bH2VL3x69jf_Y5ltKubUSaF0Drv2TJsOWYNFlg89m_WX4Tsi9tQKXJwPHNZxchaB4nBsTxHVBSsuTBkRk68FOQ2SlfM8fhKAao0DLQ9rxX9KUKNA_QPVRtJ4xtuOkHEJphCqtjy',
    });
    print(result.data);
  } on FirebaseFunctionsException catch (e) {
    print('caught firebase functions exception');
    print(e.message);
    print(e.details);
  } catch (e) {
    print('caught generic exception');
    print(e);
  }
}

class TestWidget extends StatefulWidget {
  TestWidget({Key? key}) : super(key: key);

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await notifyUserTest(
              token:
                  'fMcYQ9mvrkINgO2u22lrgv:APA91bE_n_PlyZ_Ls0Gch5IEb8mUD7l88Ukjgj2PDcc34k6BPaT0esXlPLcQjdv1SnZkLfu9avmTt8AkgyTYzJ_hK4kWuCbl_6WbXzX8BTxKEgQbzaHa8zKVem4VBz8B9qGRXXealL2I',
              title: 'On a un petit cadeau pour toi 👀🤎',
              body:
                  'Réponds à notre petit questionnaire pour tenter de remporter un bon d’achat Aroma Zone',
              url: 'https://form.dragnsurvey.com/survey/r/c6a44f40');
        },
        child: Icon(Icons.send, color: Colors.white),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
