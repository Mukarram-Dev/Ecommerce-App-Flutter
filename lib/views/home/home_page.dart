import 'package:ecommerce_app/config/theme/colors.dart';
import 'package:ecommerce_app/config/theme/text_theme_style.dart';
import 'package:ecommerce_app/views/home/widgets/floating_action_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final tabIndex = useState(0);
    final tabController = useTabController(initialLength: 4);

    useEffect(() {
      tabController.addListener(() {
        tabIndex.value = tabController.index;
      });
      return null;
    }, [tabController]);

    return Scaffold(
      floatingActionButton: const FloatingActionMenu(),
      appBar: AppBar(
        toolbarHeight: 120,
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        title: Text(
          'Messages',
          style: AppTextStyles.textTitle(
            color: AppColors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search_sharp,
              color: AppColors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.add,
              color: AppColors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          TabBar(
            controller: tabController,
            dividerHeight: 0,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.black,
            indicatorPadding: const EdgeInsets.symmetric(vertical: 5),
            labelStyle: AppTextStyles.textTitle(
                fontWeight: FontWeight.w700, fontSize: 20),
            indicator: UnderlineTabIndicator(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
                  width: 5.0,
                )),
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            unselectedLabelColor: AppColors.grey1,
            unselectedLabelStyle: AppTextStyles.textTitle(
              fontWeight: FontWeight.w400,
              fontSize: 20,
              color: AppColors.grey1,
            ),
            tabs: const [
              Tab(text: 'Events'),
              Tab(text: 'Teams'),
              Tab(text: 'Tasks'),
              Tab(text: 'Equipment'),
            ],
          ),
          Expanded(
            child: IndexedStack(
              index: tabIndex.value,
              children: const [
                // TeamsPage(),
                // TasksPage(),
                // EquipmentsPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TeamsPage extends StatelessWidget {
  const TeamsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Teams Page'),
    );
  }
}

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Tasks Page'),
    );
  }
}

class EquipmentsPage extends StatelessWidget {
  const EquipmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Equipments Page'),
    );
  }
}
