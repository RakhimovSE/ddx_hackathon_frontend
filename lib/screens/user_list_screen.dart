import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/user_bloc.dart';
import '../repositories/api_repository.dart';

class UserListScreen extends StatelessWidget {
  final ApiRepository apiRepository = ApiRepository();

  UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserBloc(apiRepository: apiRepository)..add(FetchUsers()),
      child: CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Users'),
        ),
        child: SafeArea(
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserLoading) {
                return const Center(child: CupertinoActivityIndicator());
              } else if (state is UserLoaded) {
                return CustomScrollView(
                  slivers: [
                    CupertinoSliverRefreshControl(
                      onRefresh: () async {
                        BlocProvider.of<UserBloc>(context).add(FetchUsers());
                      },
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return CupertinoListTile(
                            title: Text(state.users[index].name),
                            subtitle: Text(state.users[index].email),
                          );
                        },
                        childCount: state.users.length,
                      ),
                    ),
                  ],
                );
              } else if (state is UserError) {
                return const Center(child: Text('Failed to fetch users'));
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}

class CupertinoListTile extends StatelessWidget {
  final Widget title;
  final Widget subtitle;

  const CupertinoListTile({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(child: title),
              Expanded(child: subtitle),
            ],
          ),
        ),
        const Divider(height: 1, color: CupertinoColors.separator),
      ],
    );
  }
}
