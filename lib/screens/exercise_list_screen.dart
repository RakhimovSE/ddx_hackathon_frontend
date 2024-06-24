import 'package:flutter/cupertino.dart';
import '../data/models/exercise.dart';
import '../data/repositories/api_repository.dart';
import '../widgets/exercise/exercise_list_item.dart';

class ExerciseListScreen extends StatefulWidget {
  const ExerciseListScreen({super.key});

  @override
  _ExerciseListScreenState createState() => _ExerciseListScreenState();
}

class _ExerciseListScreenState extends State<ExerciseListScreen> {
  late Future<List<Exercise>> futureExercises;
  List<Exercise> exercises = [];
  final ScrollController _scrollController = ScrollController();
  bool isLoading = false;
  int offset = 0;
  final int limit = 20;

  @override
  void initState() {
    super.initState();
    _fetchMoreExercises();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _fetchMoreExercises();
      }
    });
  }

  Future<void> _fetchMoreExercises() async {
    if (isLoading) return;
    setState(() {
      isLoading = true;
    });

    try {
      List<Exercise> newExercises =
          await ApiRepository().fetchExercises(offset: offset, limit: limit);
      setState(() {
        offset += limit;
        exercises.addAll(newExercises);
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Failed to load exercises: $e');
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        controller: _scrollController,
        slivers: [
          const CupertinoSliverNavigationBar(
            largeTitle: Text('Упражнения'),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: CupertinoSearchTextField(
                placeholder: 'Название упражнения...',
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildFilterButton('Ноги'),
                    _buildFilterButton('Грудь'),
                    _buildFilterButton('Плечи'),
                    _buildFilterButton('Спина'),
                    _buildFilterButton('Бицепс'),
                    _buildFilterButton('Шея'),
                    _buildFilterButton('Пресс'),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (index == exercises.length) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: CupertinoActivityIndicator(),
                    ),
                  );
                }
                return ExerciseListItem(exercise: exercises[index]);
              },
              childCount: exercises.length + (isLoading ? 1 : 0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: CupertinoButton(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        color: CupertinoColors.systemGrey4,
        borderRadius: BorderRadius.circular(16.0),
        onPressed: () {
          // Handle filter logic
        },
        child: Text(title),
      ),
    );
  }
}
