import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rentcar/data/car_http_service.dart';
import 'package:rentcar/model/car_model.dart';
import 'package:rentcar/model/logo_model.dart';
import 'package:rentcar/utils/const_app.dart';
import 'package:rentcar/widgets/container_border.dart';

class CarsPage extends StatefulWidget {
  const CarsPage({Key? key}) : super(key: key);

  @override
  State<CarsPage> createState() => _CarsPageState();
}

class _CarsPageState extends State<CarsPage> {
  var carHttpService = CarHttpService();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xffF5F8FC),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: SingleChildScrollView(
                  child: Column(
                    children:  [
                      const CustomTabBar(),
                      const SizedBox(
                        width: 0,
                      ),
                      const CustomSearch(),
                      const SizedBox(
                        width: 0,
                        height: 10,
                      ),
                      ListBrand(
                        brand: dataLogo,
                      ),
                      const SizedBox(
                        width: 0,
                        height: 10,
                      ),
                      FutureBuilder<List<CarsModel>>(
                          future: carHttpService.getCars() ,
                          builder: (context, snapshot) {
                            if(snapshot.hasError){
                              return const Center(
                                child: Text(messageErrorCarsApi),
                              );
                            }

                            if(snapshot.connectionState == ConnectionState.done){
                              return ListCars(
                                cars: snapshot.data!,
                              );
                            }else{
                              return const CircularProgressIndicator();
                            }
                          }
                      ),
                    ],
                  ),
                ),
              ),
              const Positioned(
                bottom: 0,
                left: 0,
                child: BottomActionBar()
              )
            ],
          ),
        ),
      ),
    );
  }
}



class CustomTabBar extends StatelessWidget {
  const CustomTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
             ContainerBorder(
              height: 40,
              width: 40,
              borderColor: Colors.black26,
              borderRadius: 8,
              backgroundColor: Color(0xffF5F8FC),
              child: Center(
                  child: FaIcon(FontAwesomeIcons.grip)
              ),
            ),

            ContainerBorder(
              height: 40,
              width: 40,
              borderColor: Colors.black26,
              borderRadius: 8,
              backgroundColor: Color(0xffF5F8FC),
              child: Center(
                  child: FaIcon(FontAwesomeIcons.bell)
              ),

            ),

          ],
        ),
      ),
    );
  }
}

class CustomSearch extends StatelessWidget {
  const CustomSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        border:  Border(
          bottom: BorderSide(width: 1.0, color: Colors.black26)
        )
      ),
      height: 56,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const[
          Text("Search",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 17
            ),
          ),
          Icon(Icons.search)
        ],
      ),
    );
  }
}


class ListBrand extends StatelessWidget {
  final List<LogoModel> brand;

  const ListBrand({Key? key,
    required this.brand
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80 ,
      width: double.infinity,
      child: ListView.builder(
        itemCount: brand.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, item){
          return ContainerBorder(
              height: 60,
              width: 60,
              isCircle: true,
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(15),
              backgroundColor: item ==0 ? Colors.blueAccent:Colors.white,
              child: item ==0 ?
              const Center(
                  child: Text("All",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  )
              ): Center(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image.asset(brand[item].pathLogo,
                  color: Colors.grey,
                  ),
                ),
              )
          );
        },
      ),
    );
  }
}

class ListCars extends StatelessWidget {
  final List<CarsModel> cars;

  const ListCars({Key? key,
    required this.cars
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 56,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const[
              Text("All Cars",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold
                ),
              ),
              Icon(Icons.filter_list_alt)
            ],
          ),
        ),
        const SizedBox(
          height: 10,
          width: 0,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: cars.length,
          itemBuilder: (context, item){
            return ContainerCar(
              car: cars[item],
            );
          },
        )

      ],
    );

  }
}


class ContainerCar extends StatelessWidget {
  final CarsModel car;

  const ContainerCar({Key? key,
    required this.car
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerBorder(
      height: 120,
      width: double.infinity,
      backgroundColor: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Image.asset("assets/images/car1/1.png")
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(car.type,
                   style: const TextStyle(
                       fontSize: 20,
                       color: Colors.black,
                       fontWeight: FontWeight.bold
                   ),
                 ),
                 Text(car.type,
                   style: const TextStyle(
                     fontSize: 15,
                     color: Colors.grey,),
                 ),
                const SizedBox(
                  width: 0,
                  height: 10,
                ),
                Text("${car.year} \$ / day",
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.blueAccent,)
                ),


              ],
            ),
          )
        ],
      ) ,
    );
  }
}

class BottomActionBar extends StatelessWidget {
  const BottomActionBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 56,
      width: size.width,
      decoration: const BoxDecoration(
        color: Color(0xff272F65),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const[
          FaIcon(
            FontAwesomeIcons.house,
            color: Colors.white,
            size: 15,
          ),
          FaIcon(
            FontAwesomeIcons.chartPie,
            color: Colors.white,
            size: 15,

          ),
          FaIcon(
            FontAwesomeIcons.calendar,
            color: Colors.white,
            size: 15,

          ),
          FaIcon(
            FontAwesomeIcons.user,
            color: Colors.white,
            size: 15,
          )
        ],
      )


    );
  }
}



