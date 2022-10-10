import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:thanghoang/business/models/hero_id_model.dart';
import 'package:thanghoang/business/models/task_model.dart';
import 'package:thanghoang/business/models/todo_list_model.dart';
import 'package:thanghoang/business/utils/color_utils.dart';
import 'package:thanghoang/business/utils/datetime_utils.dart';
import 'package:thanghoang/resources/pages/add_task_screen.dart';
import 'package:thanghoang/resources/pages/detail_screen.dart';
import 'package:thanghoang/resources/routes/scale_route.dart';
import 'package:thanghoang/resources/themes/gradient_background.dart';
import 'package:thanghoang/resources/themes/task_progress_indicator.dart';
import 'package:thanghoang/resources/widgets/todo_badge.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  HeroId _generateHeroIds(Task task) {
    return HeroId(
      codePointId: 'code_point_id_${task.id}',
      progressId: 'progress_id_${task.id}',
      titleId: 'title_id_${task.id}',
      remainingTaskId: 'remaining_task_id_${task.id}',
    );
  }

  String currentDay(BuildContext context) {
    return DateTimeUtils.currentDay;
  }

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin  {
  late AnimationController _controller;
  late Animation<double> _animation;
  final GlobalKey _backdropKey = GlobalKey(debugLabel: 'Backdrop');
  late PageController _pageController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<TodoListModel>(
        builder: (BuildContext context, Widget? child, TodoListModel model) {
          var _isLoading = model.isLoading;
          var _tasks = model.tasks;
          var _todos = model.todos;
          var backgroundColor = _tasks.isEmpty || _tasks.length == _currentPageIndex
              ? Colors.lightBlueAccent
              : ColorUtils.getColorFrom(id: _tasks[_currentPageIndex].color);
          if (!_isLoading) {
            // move the animation value towards upperbound only when loading is complete
            _controller.forward();
          }
          return GradientBackground(
            color: backgroundColor,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                title: Text(widget.title),
                centerTitle: true,
                elevation: 0.0,
                backgroundColor: Colors.transparent,
              ),
              body: _isLoading
                  ? const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 1.0,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
                ),
              )
                  : FadeTransition(
                opacity: _animation,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 0.0, left: 56.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.currentDay(context),
                            style: Theme.of(context)
                                .textTheme
                                .headline1
                                ?.copyWith(color: Colors.white),
                          ),
                          Text(
                            '${DateTimeUtils.currentDate} - ${DateTimeUtils.currentMonth} - ${DateTimeUtils.currentYear}',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                ?.copyWith(color: Colors.white.withOpacity(0.7)),
                          ),
                          Container(height: 16.0),
                          Text(
                            'You have ${_todos.where((todo) => todo.isCompleted == 0).length} tasks to complete',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(color: Colors.white.withOpacity(0.7)),
                          ),
                          Container(height: 16.0)
                        ],
                      ),
                    ),
                    Expanded(
                      key: _backdropKey,
                      flex: 1,
                      child: NotificationListener<ScrollNotification>(
                        onNotification: (notification) {
                          if (notification is ScrollEndNotification) {
                            print("ScrollNotification = ${_pageController.page}");

                            var currentPage = _pageController.page?.round().toInt() ?? 0;

                            if (_currentPageIndex != currentPage) {
                              setState(() => _currentPageIndex = currentPage);
                            }
                          }
                          return true;
                        },
                        child: PageView.builder(
                          controller: _pageController,
                          itemBuilder: (BuildContext context, int index) {
                            if (index == _tasks.length) {
                              return const AddPageCard(color: Colors.blueGrey);
                            } else {
                              return TaskCard(
                                backdropKey: _backdropKey,
                                color: ColorUtils.getColorFrom(id: _tasks[index].color),
                                getHeroIds: widget._generateHeroIds,
                                getTaskCompletionPercent:
                                model.getTaskCompletionPercent,
                                getTotalTodos: model.getTotalTodosFrom,
                                task: _tasks[index],
                              );
                            }
                          },
                          itemCount: _tasks.length + 1,
                        ),
                      ),
                    ),
                    Container(margin: const EdgeInsets.only(bottom: 32.0)),
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class AddPageCard extends StatelessWidget {
  final Color color;

  const AddPageCard({Key? key, this.color = Colors.black}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      child: Material(
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.white,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddTaskScreen()),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  size: 65.0,
                  color: color,
                ),
                Container(
                  height: 16.0,
                ),
                Text(
                  'Add Category',
                  style: TextStyle(color: color),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

typedef TaskGetter<T, V> = V Function(T value);

class TaskCard extends StatelessWidget {
  final GlobalKey backdropKey;
  final Task task;
  final Color color;

  final TaskGetter<Task, int> getTotalTodos;
  final TaskGetter<Task, HeroId> getHeroIds;
  final TaskGetter<Task, int> getTaskCompletionPercent;

  TaskCard({
    required this.backdropKey,
    required this.color,
    required this.task,
    required this.getTotalTodos,
    required this.getHeroIds,
    required this.getTaskCompletionPercent,
  });

  @override
  Widget build(BuildContext context) {
    var heroIds = getHeroIds(task);
    return GestureDetector(
      onTap: () {
        final RenderBox? renderBox = backdropKey.currentContext?.findRenderObject() as RenderBox;
        var backDropHeight = renderBox?.size.height ?? 0;
        var bottomOffset = 60.0;
        var horizontalOffset = 52.0;
        var topOffset = MediaQuery.of(context).size.height - backDropHeight;

        var rect = RelativeRect.fromLTRB(
            horizontalOffset, topOffset, horizontalOffset, bottomOffset);
        Navigator.push(
          context,
          ScaleRoute(
            rect: rect,
            widget: DetailScreen(
              taskId: task.id,
              heroIds: heroIds,
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 4.0,
        margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TodoBadge(
                id: heroIds.codePointId,
                codePoint: task.codePoint,
                color: ColorUtils.getColorFrom(
                  id: task.color,
                ),
              ),
              const Spacer(flex: 8,),
              Container(
                margin: const EdgeInsets.only(bottom: 4.0),
                child: Hero(
                  tag: heroIds.remainingTaskId,
                  child: Text(
                    "${getTotalTodos(task)} Task",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: Colors.grey[500]),
                  ),
                ),
              ),
              Container(
                child: Hero(
                  tag: heroIds.titleId,
                  child: Text(task.name,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.copyWith(color: Colors.black54)),
                ),
              ),
              const Spacer(),
              Hero(
                tag: heroIds.progressId,
                child: TaskProgressIndicator(
                  color: color,
                  progress: getTaskCompletionPercent(task),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}