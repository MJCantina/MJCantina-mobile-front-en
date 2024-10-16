import 'package:cantina_senai/common/widgets/appbar/basicappbar.dart';
import 'package:cantina_senai/common/widgets/profile_change/profile_card.dart';
import 'package:cantina_senai/data/models/services/auth_services.dart';
import 'package:flutter/material.dart';


class ProfileConfigs extends StatefulWidget {
  const ProfileConfigs({super.key});

  @override
  State<ProfileConfigs> createState() => _ProfileConfigsState();
}

class _ProfileConfigsState extends State<ProfileConfigs> {
  var user = AuthService.to.user?.displayName;
  var userEmail = AuthService.to.user?.email;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarArrow(namePage: 'Perfil'),
        body: Column(
          children: [
            ConfigChange(title: 'Nome Parcial', config: '$user'),
            ConfigChange(title: 'Email', config: '$userEmail'),
            ConfigChange(title: 'Senha', config: 'Toque para mudar'),
            FutureBuilder<String?>(
              future: AuthService.to.getPhoneNumber(), // Função assíncrona
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const ConfigChange(
                    title: 'Telefone',
                    config: 'Carregando...',
                  );
                } else if (snapshot.hasError) {
                  return const ConfigChange(
                    title: 'Telefone',
                    config: 'Erro ao carregar telefone',
                  );
                } else if (!snapshot.hasData || snapshot.data == null) {
                  return const ConfigChange(
                    title: 'Telefone',
                    config: 'Telefone não disponível',
                  );
                } else {
                  return ConfigChange(
                    title: 'Telefone',
                    config: snapshot.data!,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
