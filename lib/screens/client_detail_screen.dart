import 'package:flutter/cupertino.dart';
import '../data/models/user.dart';

class ClientDetailScreen extends StatelessWidget {
  final User client;

  const ClientDetailScreen({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(client.name),
        previousPageTitle: 'Назад',
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image.network(
                      client.avatarUrl ?? 'https://via.placeholder.com/100',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return const Icon(CupertinoIcons.person, size: 100);
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          client.name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Возраст: 19 лет\nРост: 165 см\nОпыт: 2 года',
                          style: TextStyle(
                            fontSize: 16,
                            color: CupertinoColors.systemGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: const Icon(CupertinoIcons.chat_bubble_2_fill,
                        color: CupertinoColors.systemPurple),
                    onPressed: () {
                      // Логика для открытия чата с клиентом
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Заметки: Есть травма живота, любит кушать, хочет похудеть и пробежать марафон желаний',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Тренировок проведено/куплено: 4/8',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: CupertinoColors.systemGrey6,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Row(
                  children: [
                    Image.network(
                      'https://via.placeholder.com/80',
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return const Icon(CupertinoIcons.photo);
                      },
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'ПОХУДЕНИЕ СТАРТ\n24 тренировки\nАлина Колебанова',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            height: 6,
                            decoration: BoxDecoration(
                              color: CupertinoColors.systemPurple,
                              borderRadius: BorderRadius.circular(3.0),
                            ),
                            child: FractionallySizedBox(
                              widthFactor: 0.45,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: CupertinoColors.systemBlue,
                                  borderRadius: BorderRadius.circular(3.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      '45%',
                      style: TextStyle(
                        fontSize: 16,
                        color: CupertinoColors.systemPurple,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              _buildSectionTitle('InBody'),
              _buildGraph('Вес, кг', 65),
              _buildGraph('Процент жира, %', 12),
              _buildGraph('ИМТ, кг/м2', 20),
              _buildGraph('Масса скелетной мускулатуры, кг', 20),
              _buildGraph('Уровень висцерального жира', 20),
              _buildSectionTitle('Измерения'),
              _buildGraph('Обхват груди, см', 20),
              _buildGraph('Обхват бицепса, см', 20),
              _buildGraph('Обхват шеи, см', 20),
              _buildSectionTitle('До/После'),
              Row(
                children: [
                  Expanded(
                    child: Image.network(
                      'https://via.placeholder.com/100',
                      fit: BoxFit.cover,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return const Icon(CupertinoIcons.photo);
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Image.network(
                      'https://via.placeholder.com/100',
                      fit: BoxFit.cover,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return const Icon(CupertinoIcons.photo);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildGraph(String title, int value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          Text(
            '$value',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
