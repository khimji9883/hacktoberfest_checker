import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacktoberfest_checker/blocs/userdata/userdata_bloc.dart';
import 'package:hacktoberfest_checker/widgets/hf_progress_indicator.dart';
import 'package:hacktoberfest_checker/widgets/pr_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<UserdataBloc, UserDataState>(
        builder: (context, state) {
          if (state is UserDataLoading){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UserDataError){

          }

          UserDataLoaded st = state;
          return Container(
            padding: EdgeInsets.only(top: 10),
            height: double.infinity,
            child: Center(
              child: Column(
                children: [
                  Flexible(
                    flex: 4,
                    child: Image.asset("assets/Logo Sponsors Light.png")
                  ),
                  Flexible(
                    flex: 2,
                    child: HacktoberfestProgressIndicator(user: st.user, pull_requests: st.prs)
                  ),
                  Flexible(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "Pull Requests for user ${st.user.username}:",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),

                  Flexible(
                    flex: 3,
                    child:PRList(pullRequests: st.prs)
                  ),
                ],
              ),
            ),
          );
        },
      )
    );
  }
}
