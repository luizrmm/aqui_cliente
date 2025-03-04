import 'package:aqui_cliente/notifiers/prefeitura_notifier.dart';
import 'package:aqui_cliente/screens/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;
import 'package:provider/provider.dart';

class Prefeitura extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prefeitura'),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
                constraints:
                    BoxConstraints(minHeight: viewportConstraints.maxHeight),
                child: Consumer<PrefeituraNotifier>(
                  builder: (context, result, child) {
                    return SafeArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 20.0, bottom: 30.0),
                            child: Image.asset(
                              'assets/logo_barreiras.png',
                              height: 120,
                            ),
                          ),
                          result.loading
                              ? Center(child: Loading())
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Html(
                                      data: result.prefeitura != null
                                          ? result.prefeitura.descricao
                                          : result.errorMessage,
                                      customTextAlign: (dom.Node node) {
                                        if (node is dom.Element &&
                                            node.localName == "p") {
                                          return TextAlign.justify;
                                        }
                                        return TextAlign.left;
                                      }),
                                )
                        ],
                      ),
                    );
                  },
                )),
          );
        },
      ),
    );
  }
}
