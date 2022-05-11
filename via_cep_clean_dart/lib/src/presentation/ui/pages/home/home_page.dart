import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:via_cep_clean_dart/src/presentation/blocs/events/via_cep_events.dart';
import 'package:via_cep_clean_dart/src/presentation/blocs/states/via_cep_states.dart';
import 'package:via_cep_clean_dart/src/presentation/blocs/via_cep_bloc/via_cep_bloc.dart';
import 'package:via_cep_clean_dart/src/presentation/widgets/card_result_via_cep_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bloc = GetIt.I.get<ViaCepBloc>();
  final TextEditingController _controller = TextEditingController();
  late StreamSubscription sub;
  late bool carregando = false;

  @override
  void initState() {
    super.initState();

    sub = bloc.stream.listen((state) {
      if (state is ViaCepLoadingState) {
        carregando = true;
      } else if (state is ViaCepSucessState) {
        carregando = false;
      } else {
        carregando = false;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              controller: _controller,
              decoration: const InputDecoration(
                label: Text('CEP'),
                hintText: 'Digite o cep',
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: !carregando
                        ? () {
                            bloc.add(GetCepEvent(cep: _controller.text));
                          }
                        : null,
                    icon: const Icon(Icons.get_app),
                    label: const Text('Buscar CEP'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            BlocBuilder<ViaCepBloc, ViaCepStates>(
              bloc: bloc,
              builder: (context, state) {
                if (state is ViaCepLoadingState) {
                  return const Center(child: LinearProgressIndicator());
                }
                if (state is ViaCepSucessState) {
                  return AnimatedOpacity(
                    duration: const Duration(seconds: 2),
                    opacity: 1,
                    child: CardResultViaCepWidget(
                      localidade: state.viaCepEntity.localidade,
                      uf: state.viaCepEntity.uf,
                    ),
                  );
                }
                if (state is ViaCepErrorState) {
                  return Center(child: Text(state.message));
                }
                return const Center(
                  child: Text('Nenhum CEP encontrado!'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
