import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/common/widgets/loading_shimmer.dart';
import 'package:tasky/core/loading/empty_page.dart';
import 'package:tasky/core/service/shared_pref/pref_keys.dart';
import 'package:tasky/core/service/shared_pref/shared_pref.dart';
import 'package:tasky/features/home/presentation/bloc/get_all_tasks/get_all_tasks_bloc.dart';
import 'package:tasky/features/home/presentation/widgets/build_task_item.dart';

class CompletedTasksBody extends StatelessWidget {
  const CompletedTasksBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
     children: [
       Expanded(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: BlocBuilder<GetAllTasksBloc, GetAllTasksState>(
                  builder: (context, state) {
                    return state.when( 
                      loading: () {
                        return LoadingShimmer(
                          height: 110.h,
                          borderRadius: 15,
                        );
                      },
                      success: (response) {
                        return ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            if (response.todos[index].completed == true) {
                              return BuildTaskItem(
                                text: response.todos[index].todo,
                                id: response.todos[index].id,
                                userId: SharedPref().getInt(PrefKeys.userId)!,
                              );
                            } 
                            return const SizedBox();
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(),
                          itemCount: response.todos.length,
                        );
                      },
                      empty:  EmptyPage.new,
              error: Text.new
                    );
                  },
                ),
              )
            ],
          ),
        )
     ]
    );
  }
}