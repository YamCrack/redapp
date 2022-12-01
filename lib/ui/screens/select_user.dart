import 'package:flutter/material.dart';

class SelectUserScreen extends StatefulWidget {
  const SelectUserScreen({super.key});

  @override
  State<SelectUserScreen> createState() => _SelectUserScreenState();
}

class _SelectUserScreenState extends State<SelectUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade900,
        title: Container(
          height: 38,
          child: TextField(
            onChanged: (value) {
              print('Buscandooooo $value');
            },
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[850],
                contentPadding: EdgeInsets.all(0),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade500,
                ),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(50), borderSide: BorderSide.none),
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey.shade500),
                hintText: 'Buscar un usuario'),
          ),
        ),
      ),
      body: Container(
        color: Colors.grey.shade900,
        child:
            // false
            //     ? ListView.builder(
            //         itemCount: _foundedUsers.length,
            //         itemBuilder: (context, index) {
            //           return userComponent(user: _foundedUsers[index]);
            //         })
            const Center(
                child: Text(
          'No se encontraron usuarios',
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
