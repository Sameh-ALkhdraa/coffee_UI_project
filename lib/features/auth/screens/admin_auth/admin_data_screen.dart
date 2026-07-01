import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/resources/colors_and_styles.dart';
import 'package:mini_ui_project/features/auth/screens/admin_auth/classes/class_person.dart';

class AdminDataScreen extends StatelessWidget {
  final String username;
  AdminDataScreen({
    super.key,
    required this.username,
    });

final List<PersonCoffee> people = [
  const PersonCoffee(
    image: "assets/images/person.jpg",
    name: "Emma",
    beansCount: 128,
  ),
  const PersonCoffee(
    image: "assets/images/person.jpg",
    name: "Liam",
    beansCount: 245,
  ),
  const PersonCoffee(
    image: "assets/images/person.jpg",
    name: "Olivia",
    beansCount: 87,
  ),
  const PersonCoffee(
    image: "assets/images/person.jpg",
    name: "Noah",
    beansCount: 356,
  ),
  const PersonCoffee(
    image: "assets/images/person.jpg",
    name: "Sophia",
    beansCount: 194,
  ),
  const PersonCoffee(
    image: "assets/images/person.jpg",
    name: "James",
    beansCount: 421,
  ),
  const PersonCoffee(
    image: "assets/images/person.jpg",
    name: "Mia",
    beansCount: 163,
  ),
  const PersonCoffee(
    image: "assets/images/person.jpg",
    name: "Lucas",
    beansCount: 279,
  ),
];
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          ListView.builder(
            itemCount: people.length,
            itemBuilder: (context, index) {
              return personData(
                personImage: people[index].image,
                personName: people[index].name,
                personBeans: people[index].beansCount,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget personData({required String personImage, required String personName, required personBeans}){
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: greenLemonColor,
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 20,),
              Container(
                width: 40,
                height: 40,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(120)
                ),
                child: Image.asset(personImage),
              ),
              SizedBox(width: 20,),
              Text(personName, style: TextStyle(color: Color(0xFFEEE3CE), fontSize: 15),)
            ],
          ),
      
          Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal:  20),
                child: Text("My Total Beans", style: TextStyle(color: Colors.white, fontSize: 15, fontStyle: FontStyle.normal),)
              ),
              SizedBox(width: 15,),
              Text("$personBeans", style: TextStyle(color: Color(0xFFE1CEA8), fontSize: 22.5),),
              Image.asset("assets/images/game-icons_coffee-beans.png", color: Color(0xFFE1CEA8),),
            ],
          )
        ],
      ),
    );
  }
}