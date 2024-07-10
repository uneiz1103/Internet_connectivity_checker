import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_mgmt/blocs/internet_bloc/internet_bloc.dart';
import 'package:state_mgmt/blocs/internet_bloc/internet_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: BlocConsumer<InternetBloc, InternetState>(
        builder: (context, state) {
          if (state is InternetGainedState) {
            return const Text("Connected");
          } else if (State is InternetLostState) {
            return const Text('Not Connected');
          } else {
            return const Text('Loading');
          }
        },
        listener: (context, state) {
          if (state is InternetGainedState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Internet Connected'),
                backgroundColor: Colors.green,
              ),
            );
          } else if (state is InternetLostState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Check your Internet'),
                backgroundColor: Colors.redAccent,
              ),
            );
          }
        },
      ),
    ));
  }
}
