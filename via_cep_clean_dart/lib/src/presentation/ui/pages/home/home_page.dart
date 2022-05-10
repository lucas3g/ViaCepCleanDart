import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:via_cep_clean_dart/src/blocs/events/via_cep_events.dart';
import 'package:via_cep_clean_dart/src/blocs/states/via_cep_states.dart';
import 'package:via_cep_clean_dart/src/blocs/via_cep_bloc/via_cep_bloc.dart';
import 'package:via_cep_clean_dart/src/theme/app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bloc = GetIt.I.get<ViaCepBloc>();
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                label: Text('CEP'),
                hintText: 'Digite o cep',
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      bloc.add(GetCepEvent(cep: _controller.text));
                    },
                    icon: const Icon(Icons.get_app),
                    label: const Text('Buscar CEP'),
                  ),
                ),
              ],
            ),
            Expanded(
              child: BlocBuilder<ViaCepBloc, ViaCepStates>(
                  bloc: bloc,
                  builder: (context, state) {
                    return state is ViaCepLoadingState
                        ? const Center(child: CircularProgressIndicator())
                        : state is ViaCepSucessState
                            ? Center(
                                child: Card(
                                  color: AppTheme.colors.primary,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Text(
                                      '${state.viaCepEntity.localidade} - ${state.viaCepEntity.uf}',
                                      style: AppTheme.textStyles.button,
                                    ),
                                  ),
                                ),
                              )
                            : const Center(
                                child: Text('Nenhum CEP encontrado!'),
                              );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
