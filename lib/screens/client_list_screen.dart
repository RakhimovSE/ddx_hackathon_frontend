import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repositories/api_repository.dart';
import 'chat_list_screen.dart';
import '../bloc/trainer_clients/trainer_clients_bloc.dart';
import '../bloc/trainer_clients/trainer_clients_event.dart';
import '../bloc/trainer_clients/trainer_clients_state.dart';

class ClientListScreen extends StatelessWidget {
  const ClientListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Клиенты'),
        trailing: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => const ChatListScreen()),
            );
          },
          child: Stack(
            children: [
              const Icon(CupertinoIcons.chat_bubble_2_fill),
              Positioned(
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemPurple,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 12,
                    minHeight: 12,
                  ),
                  child: const Text(
                    '1',
                    style: TextStyle(
                      color: CupertinoColors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: CupertinoSearchTextField(
                placeholder: 'Поиск',
              ),
            ),
            Expanded(
              child: BlocProvider(
                create: (context) => TrainerClientsBloc(
                  apiRepository: context.read<ApiRepository>(),
                )..add(FetchTrainerClients()),
                child: BlocBuilder<TrainerClientsBloc, TrainerClientsState>(
                  builder: (context, state) {
                    if (state is TrainerClientsLoading) {
                      return const Center(child: CupertinoActivityIndicator());
                    } else if (state is TrainerClientsLoaded) {
                      return ListView.builder(
                        itemCount: state.clients.length,
                        itemBuilder: (context, index) {
                          final client = state.clients[index];
                          return _buildClientTile(
                            context,
                            client.name,
                            client.avatarUrl ??
                                'https://via.placeholder.com/50',
                          );
                        },
                      );
                    } else if (state is TrainerClientsError) {
                      return Center(child: Text(state.message));
                    } else {
                      return const Center(child: Text('Нет данных'));
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildClientTile(BuildContext context, String name, String imageUrl) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.systemGrey.withOpacity(0.5),
            blurRadius: 5.0,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              imageUrl,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return const Icon(CupertinoIcons.person);
              },
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Icon(CupertinoIcons.chevron_forward),
        ],
      ),
    );
  }
}
