import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/common/widgets/loading_shimmer.dart';
import 'package:tasky/core/loading/empty_page.dart';
import 'package:tasky/core/service/shared_pref/pref_keys.dart';
import 'package:tasky/core/service/shared_pref/shared_pref.dart';
import 'package:tasky/features/home/presentation/bloc/get_tasks_with_pagination/get_tasks_with_pagination_bloc.dart';
import 'package:tasky/features/home/presentation/widgets/build_task_item.dart';

class AllTasksBody extends StatelessWidget {
  const AllTasksBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
     children: [
       Expanded(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: BlocBuilder<GetTasksWithPaginationBloc, GetTasksWithPaginationState>(
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
                              return BuildTaskItem(
                                text: response.todos[index].todo,
                                id: response.todos[index].id,
                                userId: SharedPref().getInt(PrefKeys.userId)!,
                              );
                           
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(),
                          itemCount: 10,
                          
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