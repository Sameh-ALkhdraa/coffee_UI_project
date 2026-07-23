import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mini_ui_project/core/languages/app_localization_extension.dart';
import 'package:mini_ui_project/core/models/profile_model/profile_information.dart';
import 'package:mini_ui_project/core/system_users/users.dart';
import 'package:mini_ui_project/core/resources/colors_and_styles.dart';
import 'package:mini_ui_project/core/widget/custom_button.dart';
import 'package:mini_ui_project/core/widget/search_textbox_design.dart';
import 'package:mini_ui_project/core/widget/beans_info.dart';

class AdminDataScreen extends StatefulWidget {
  final String username;
  const AdminDataScreen({
    super.key,
    required this.username,
    });

  @override
  State<AdminDataScreen> createState() => _AdminDataScreenState();
}

class _AdminDataScreenState extends State<AdminDataScreen> {

List<PersonProfile> searchPeople(
    List<PersonProfile> people,
    String query,
  ) {
    if (query.isEmpty) {
      return people;
    }

    return people.where((person) {
      return person.name
          .toLowerCase()
          .contains(query.toLowerCase());
    }).toList();
  }

final TextEditingController searchController = TextEditingController();
final TextEditingController addBeansController = TextEditingController();


List<PersonProfile> people = systemUsers;
List<PersonProfile> filteredPeople = [];

  @override
  void initState() {
    filteredPeople = people;
    super.initState();
  }
    
  void search(String value) {
    setState(() {
      filteredPeople = searchPeople(
        people,
        value,
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Material(
      color: lightYellow,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${context.t.hello} ${widget.username} !", style: TextStyle(color: adminColor, fontSize: 20),),
                Row(
                  children: [
                    Icon(Icons.person, color: adminColor,),
                    SizedBox(width: 10,),
                    Text(people.length.toString())
                  ],
                )
              ],
            ),
          ),
          searchField(
            controller: searchController,
            hintText: context.t.search,
            leadingIcon: Icons.search,
            trailingIcon: Icons.tune,
            onChanged: search, color: Color(0x6F7F6A4D),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredPeople.length,
              itemBuilder: (context, index) {
                return personData(
                  person: filteredPeople[index], context: context,
                );
              },
            )
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: standardButtonDesign(
              buttonName: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.qr_code_scanner_rounded, color: lightYellow,),
                  SizedBox(width: 10,),
                  Text(context.t.scanUserQR, style: TextStyle(fontSize: 20, color: lightYellow),)
                ],
              ),
              buttonColor: darkGreen,
              width: 327,
              height: 50
            ),
          )
        ],
      ),
    );
  }

  Widget personNameAndImage({required String name, String? image}) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            width: 40,
            height: 40,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100)
            ),
            child: Image.asset(image ?? "assets/images/person.jpg"),
          ),
          SizedBox(width: 20,),
          Text(name, style: TextStyle(color: Color(0xFF293928), fontSize: 15),)
        ],
      ),
    );

  }

  Widget totalBeans({required int beansCount, required BuildContext context}) {
    return Container(
      color: Colors.transparent,
      margin: EdgeInsets.only(left: 20),
      child: BeansInfo(beans: beansCount)
    );
  }
  
  Widget personData({required PersonProfile person, required BuildContext context}) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return Center(
              child: addBeansDialog(
                person: person,
              ),
            );
          },
        );
      },
      child: Container(
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: greenLemonColor,
        ),
        child: Column(
          children: [
            personNameAndImage(name: person.name, image: person.image),
            totalBeans(beansCount: person.numberOfBeans, context: context),
          ],
        ),
      ),
    );
  }

  Widget addBeansDialog({
  required PersonProfile person,
}) {
  return Material(
    child: Container(
      padding: EdgeInsets.all(20),
      width: 330,
      height: 322,
      color: lightYellow,
      child: Column(
        children: [
          personNameAndImage(name: person.name, image: person.image!),
          Divider(height: 2,),
          SizedBox(height: 20,),
          totalBeans(beansCount: person.numberOfBeans, context: context),
          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Text(context.t.addPoints, style: TextStyle(color: Colors.black, fontSize: 14)),
                SizedBox(width: 20,),
                SizedBox(
                  width: 110,
                  child: TextFormField(
                    controller: addBeansController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      hintText: "0",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return context.t.required;
                      }
                      if (int.parse(value) < 0) {
                        return context.t.negativeNumbersAreNotAllowed;
                      }
                      return null;
                    },
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20,),
          InkWell(
            onTap: () {
              Navigator.pop(context);
              setState(() {
                person.numberOfBeans += int.parse(addBeansController.text);
                addBeansController.value = TextEditingValue.empty;
              });
            },
            child: standardButtonDesign(
              buttonName: Text(context.t.submit, style: homeTextStyle.copyWith(fontSize: 15),),
              buttonColor: darkGreen,
              width: 280, 
              height: 45
            ),
          )
        ],
      )
    ),
  );
}
}

