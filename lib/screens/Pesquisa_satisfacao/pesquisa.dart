import 'package:aqui_cliente/notifiers/pesquisa_notifier.dart';
import 'package:aqui_cliente/screens/widgets/button.dart';
import 'package:aqui_cliente/screens/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:provider/provider.dart';

class PesquisaSatisfacao extends StatefulWidget {
  @override
  _PesquisaSatisfacaoState createState() => _PesquisaSatisfacaoState();
}

class _PesquisaSatisfacaoState extends State<PesquisaSatisfacao> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<PesquisaNotifier>(context).getOptions());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pesquisa de Satisfação'),
          centerTitle: true,
        ),
        body: Consumer<PesquisaNotifier>(
          builder: (context, result, child) {
            if (result.loading) {
              return Center(
                child: Center(
                  child: Loading(),
                ),
              );
            } else if (result.options == null) {
              return Center(
                child: Text('Nenhum dado encontrado'),
              );
            } else {
              return SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      top: 20.0, left: 20.0, right: 20.0, bottom: 0.0),
                  child: Column(
                    children: <Widget>[
                      ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: result.options.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Text(
                                  result.options[index].titulo,
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                RadioButtonGroup(labels: [
                                  'Insatisfeito',
                                  'Pouco Satisfeito',
                                  'Satisfeito'
                                ], onSelected: (String selected) {})
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider();
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25.0),
                        child: DefaultButton(
                          isbusy: false,
                          function: () {},
                          text: 'Confirmar',
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
          },
        ));
  }
}
