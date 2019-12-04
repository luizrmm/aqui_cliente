import 'package:aqui_cliente/screens/Agenda_obras/agenda_obras.dart';
import 'package:aqui_cliente/screens/Contatos/contatos.dart';
import 'package:aqui_cliente/screens/Enquete/enquete_list.dart';
import 'package:aqui_cliente/screens/Fale_conosco/fale_conosco.dart';
import 'package:aqui_cliente/screens/Noticias/noticias.dart';
import 'package:aqui_cliente/screens/Pesquisa_satisfacao/pesquisa.dart';
import 'package:aqui_cliente/screens/Prefeito/prefeito.dart';
import 'package:aqui_cliente/screens/Prefeitura/prefeirura.dart';
import 'package:aqui_cliente/screens/Telefones_uteis/telefones_uteis.dart';
import 'package:flutter/material.dart';
import 'widgets/menu_item.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 8.0, mainAxisSpacing: 8.0),
          shrinkWrap: true,
          children: <Widget>[
            MenuItem(
              route: NoticiasScreen(),
              icon: 'assets/newspaper.png',
              label: 'Notícias',
            ),
            MenuItem(
              route: EnqueteList(),
              icon: 'assets/enquete.png',
              label: 'Enquetes',
            ),
            MenuItem(
                route: AgendaObras(),
                icon: 'assets/obras.png',
                label: 'Agenda de Obras'),
            MenuItem(
              route: FaleConosco(),
              icon: 'assets/fale_conosco.png',
              label: 'Fale Conosco',
            ),
            MenuItem(
              route: TelefonesUteis(),
              icon: 'assets/telefones.png',
              label: 'Telefones Úteis',
            ),
            MenuItem(
              route: Contatos(),
              icon: 'assets/contatos.png',
              label: 'Contatos',
            ),
            MenuItem(
                route: Prefeitura(),
                icon: 'assets/prefeitura.png',
                label: 'Prefeitura'),
            MenuItem(
                route: Prefeito(),
                icon: 'assets/prefeito.png',
                label: 'Prefeito'),
            MenuItem(
                route: PesquisaSatisfacao(),
                icon: 'assets/pesquisa.png',
                label: 'Pesquisa de Satisfação'),
          ],
        ),
      )),
    );
  }
}
