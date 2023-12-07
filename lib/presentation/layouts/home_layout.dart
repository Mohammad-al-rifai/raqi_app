import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raqi_test_app/presentation/cubit/layout_cubit/layout_cubit.dart';

import '../../app/resources/colors_manager.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        LayoutCubit cubit = LayoutCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(cubit.titles[cubit.currentIndex]),
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: ColorManager.primary,
            selectedItemColor: ColorManager.darkPrimary,
            unselectedItemColor: ColorManager.lightPrimary,
            showUnselectedLabels: true,
            currentIndex: cubit.currentIndex,
            onTap: (index) => cubit.changeBottomNavBarIndex(index: index),
            items: cubit.bottomItems,
          ),
        );
      },
    );
  }
}
