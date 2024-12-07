import 'package:cantina_senai/common/widgets/appbar/appbararrow.dart';
import 'package:cantina_senai/common/widgets/base_button/profilebutton.dart';
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
                onPressed: () => {},
              ),
              ConfigChange(
                title: 'Email',
                config: '$userEmail',
                onPressed: () => {},
              ),
              ConfigChange(
                title: 'Senha',
                config: 'Toque para mudar senha',
                onPressed: () => {},
              ),
              FutureBuilder<String?>(
                future: AuthService.to.getPhoneNumber(), // Função assíncrona
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return ConfigChange(
                      title: 'Telefone',
                      config: 'Carregando...',
                      onPressed: ()=>{},
                    );
                  } else if (snapshot.hasError) {
                    return  ConfigChange(
                      title: 'Telefone',
                      config: 'Erro ao carregar telefone',
                      onPressed: ()=>{},
                    );
                  } else if (!snapshot.hasData || snapshot.data == null) {
                    return  ConfigChange(
                      title: 'Telefone',
                      config: 'Telefone não disponível',
                      onPressed: ()=>{},
                    );
                  } else {
                    return ConfigChange(
                      title: 'Telefone',
                      config: snapshot.data!,
                      onPressed: ()=>{},
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