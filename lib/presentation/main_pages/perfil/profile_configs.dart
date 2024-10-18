import 'package:cantina_senai/common/widgets/appbar/appbararrow.dart';
import 'package:cantina_senai/common/widgets/profile_card/profile_card.dart';
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Wrap(
            runSpacing: 16,
            children: [
              ConfigChange(
                title: 'Nome Parcial',
                config: '$user',
                onTap: () => {},
              ),
              ConfigChange(
                title: 'Email',
                config: '$userEmail',
                onTap: () => {},
              ),
              ConfigChange(
                title: 'Senha',
                config: 'Toque para mudar senha',
                onTap: () => {},
              ),
              FutureBuilder<String?>(
                future: AuthService.to.getPhoneNumber(), // Função assíncrona
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return ConfigChange(
                      title: 'Telefone',
                      config: 'Carregando...',
                      onTap: ()=>{},
                    );
                  } else if (snapshot.hasError) {
                    return  ConfigChange(
                      title: 'Telefone',
                      config: 'Erro ao carregar telefone',
                      onTap: ()=>{},
                    );
                  } else if (!snapshot.hasData || snapshot.data == null) {
                    return  ConfigChange(
                      title: 'Telefone',
                      config: 'Telefone não disponível',
                      onTap: ()=>{},
                    );
                  } else {
                    return ConfigChange(
                      title: 'Telefone',
                      config: snapshot.data!,
                      onTap: ()=>{},
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}