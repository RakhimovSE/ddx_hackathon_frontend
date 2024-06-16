import 'package:flutter/cupertino.dart';

class ChatScreen extends StatelessWidget {
  final String trainerName;

  const ChatScreen({super.key, required this.trainerName});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(trainerName),
        previousPageTitle: 'Чаты',
      ),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  _buildReceivedMessage('Привет, как твои тренировки?'),
                  _buildSentMessage('Привет! Все идет отлично, спасибо!'),
                  _buildReceivedMessage('Успела купить коврик для йоги?'),
                  _buildSentMessage('Да, уже купила. Очень удобный!'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: CupertinoTextField(
                      placeholder: 'Напишите сообщение',
                    ),
                  ),
                  const SizedBox(width: 8),
                  CupertinoButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: () {
                      // Добавьте действие для отправки сообщения
                    },
                    child: const Icon(CupertinoIcons.paperplane_fill),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReceivedMessage(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: CupertinoColors.systemGrey5,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Text(text),
      ),
    );
  }

  Widget _buildSentMessage(String text) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: CupertinoColors.activeBlue,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Text(
          text,
          style: const TextStyle(color: CupertinoColors.white),
        ),
      ),
    );
  }
}
