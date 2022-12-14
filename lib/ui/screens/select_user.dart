import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/user_search_cubit.dart';
import '../../data/models/user_model.dart';
import '../widgets/user_card.dart';
import '../widgets/user_list_card.dart';

class SelectUserScreen extends StatefulWidget {
  const SelectUserScreen({super.key});

  @override
  State<SelectUserScreen> createState() => _SelectUserScreenState();
}

class _SelectUserScreenState extends State<SelectUserScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserSearchCubit()..search(''),
      child: BlocBuilder<UserSearchCubit, UserSearchState>(
        builder: (context, state) {
          return _buildScreen(context, state);
        },
      ),
    );
  }

  Widget _buildScreen(BuildContext context, UserSearchState state) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // backgroundColor: Colors.grey.shade900,
        title: Container(
          height: 38,
          child: TextField(
            onChanged: (value) {
              BlocProvider.of<UserSearchCubit>(context).search(value);
            },
            style: const TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            decoration: InputDecoration(
                filled: true,
                // fillColor: Colors.grey[850],
                contentPadding: EdgeInsets.zero,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                focusColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(50), borderSide: BorderSide.none),
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey.shade500),
                hintText: 'Buscar un usuario'),
          ),
        ),
      ),
      body: Container(
        // color: Colors.grey.shade900,
        child: _buildUsersList(context, state),
      ),
    );
  }

  Widget _buildUsersList(BuildContext context, UserSearchState state) {
    if (state is UserSearchLoading || state is UserSearchInitial) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state is UserSearchError) {
      return Center(child: Text('Error: ${state.message}'));
    }

    if (state is! UserSearchFetched) {
      return const Center(child: Text('Unknown state: '));
    }
    final users = state.response.users!;

    return users.isNotEmpty
        ? ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return UserListCard(
                user: users[index],
                onTap: () => _selectUser(users[index]),
              );
            })
        : const Center(
            child: Text(
            'No se encontraron usuarios',
            style: TextStyle(color: Colors.white),
          ));
  }

  void _selectUser(UserModel user) {
    Navigator.pop(context, user);
  }
}
