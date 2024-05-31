import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/models/user_model.dart';
import '../../widgets/appbars/homebar.dart';
import '../../controllers/profile_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.put(ProfileController());

  String getFirstUserName(String name) {
    if (name.contains('')) {
      final splitted = name.split(' ');
      return splitted[0].toString();
    } else {
      return name;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeBar(titleText: 'SIGN TALK'),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                FutureBuilder(
                    future: controller.getUserData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        // if data is completely fetched
                        if (snapshot.hasData) {
                          // if snapshot has data
                          UserModel userData = snapshot.data as UserModel;
                          return Container(
                            width: 350,
                            height: 50,
                            alignment: Alignment.centerLeft,
                            child: Text(
                                'Hello, ${getFirstUserName(userData.name)}',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w100)),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        } else {
                          return const Center(
                            child: Text('Something went wrong'),
                          );
                        }
                      } else {
                        return Container(
                          width: 350,
                          height: 50,
                          alignment: Alignment.centerLeft,
                          child: const Text('Hello, there',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w100)),
                        );
                      }
                    }),
                Container(
                  height: 220,
                  width: 350,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                        image: AssetImage('assets/images/main_image.png'),
                        fit: BoxFit.cover),
                    // color: Colors.grey[400],
                  ),
                ),
                const SizedBox(height: 5),
                const SizedBox(
                    width: 300,
                    height: 250,
                    child: Center(
                      child: Text(
                        'What do you want to do today?',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 45, color: Colors.black),
                      ),
                    )),
                const SizedBox(height: 5),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/translator');
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      minimumSize: const Size(300, 50)),
                  child: const Text(
                    "Translate",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
                OutlinedButton(
                  onPressed: () {
                    
                  },
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Colors.black, width: 1),
                      minimumSize: const Size(300, 50)),
                  child: const Text(
                    "Learn",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
