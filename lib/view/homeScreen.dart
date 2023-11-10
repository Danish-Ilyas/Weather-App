import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../comp/repo.dart';
import '../model/wheather_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controller = TextEditingController();
  WeatherModel? weatherModel;

  late Size mq = MediaQuery.of(context).size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Weather App',style: TextStyle(color: Colors.black),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //input field
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: 'Enter city name',
                ),
              ),
            ),
            //search button
            ElevatedButton(
                onPressed: ()async{
              weatherModel = await Repo().getWeather(controller.text);
              print(weatherModel?.main?.temp ?? "error");
              if (controller.text.isEmpty){
                Get.snackbar('Alert', 'Enter city name');
              }
              else if(weatherModel?.main?.temp == null){
                Get.snackbar('Error', 'Enter city name correctly');
              }
              else{

              }
              setState(() {});
              },
                child: Text('Search City')),
            SizedBox(height: mq.height * 0.03,),
            //Weather description
            if(controller.text.isEmpty)
              Center(child: Text("No city found to tell you about it's weather")),
            if(controller.text.isNotEmpty)
              if(weatherModel?.main?.temp != null)
            Column(
              children: [

                Row(
                  children: [
                    //temperature
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        height: mq.height * 0.3,
                        width: mq.width * 0.45,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                            child: Column(
                              children: [
                                Icon(Icons.waves_outlined,size: 50,),
                                SizedBox(height: mq.height * 0.05,),
                                Text('Temperature',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                                SizedBox(height: mq.height * 0.02,),
                                Text("${weatherModel?.main?.temp ?? '0.0'}"),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        height: mq.height * 0.3,
                        width: mq.width * 0.45,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                            child: Column(
                              children: [
                                Icon(Icons.scatter_plot_outlined,size: 50,),
                                SizedBox(height: mq.height * 0.05,),
                                Text('Humidity',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                                SizedBox(height: mq.height * 0.02,),
                                Text("${weatherModel?.main?.humidity ?? '0.0'}"),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],),
                SizedBox(height: mq.height * 0.03,),
                Row(
                  children: [
                    //temperature
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        height: mq.height * 0.3,
                        width: mq.width * 0.45,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                            child: Column(
                              children: [
                                Icon(Icons.wind_power,size: 50,),
                                SizedBox(height: mq.height * 0.05,),
                                Text('Wind',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                                SizedBox(height: mq.height * 0.02,),
                                Text("${weatherModel?.wind?.speed ?? '0.0'}"),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        height: mq.height * 0.3,
                        width: mq.width * 0.45,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                            child: Column(
                              children: [
                                Icon(Icons.wifi_protected_setup_sharp,size: 50,),
                                SizedBox(height: mq.height * 0.05,),
                                Text('Pressure',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                                SizedBox(height: mq.height * 0.02,),
                                Text("${weatherModel?.main?.pressure ?? '0.0'}"),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],),
                SizedBox(height: mq.height * 0.03,),
                Row(
                  children: [
                    //temperature
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        height: mq.height * 0.3,
                        width: mq.width * 0.45,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                            child: Column(
                              children: [
                                Icon(Icons.cloud,size: 50,),
                                SizedBox(height: mq.height * 0.05,),
                                Text('Clouds',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                                SizedBox(height: mq.height * 0.02,),
                                Text("${weatherModel?.clouds?.all ?? '0.0'}"),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        height: mq.height * 0.3,
                        width: mq.width * 0.45,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                            child: Column(
                              children: [
                                Icon(Icons.timelapse_outlined,size: 50,),
                                SizedBox(height: mq.height * 0.05,),
                                Text('Time zone',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                                SizedBox(height: mq.height * 0.02,),
                                Text("${weatherModel?.timezone ?? '0.0'}"),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],),
                SizedBox(height: mq.height * 0.03,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
