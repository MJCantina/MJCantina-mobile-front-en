import 'package:cantina_senai/common/widgets/appbar/appbararrow.dart';
import 'package:cantina_senai/common/widgets/module/moduleborder.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Polices extends StatefulWidget {
  const Polices({super.key});

  @override
  State<Polices> createState() => _PolicesState();
}

class _PolicesState extends State<Polices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarArrow(
        namePage: 'Termos de uso',
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Column(
          children: [
            Expanded(
              child: moduleBorder(
                child: SingleChildScrollView(
                  child: Text(
                    '''
1. INFORMAÇÕES LEGAIS

Este acordo de usuário de APP (este "Acordo") aplica-se a todos os indivíduos (individualmente “Usuário” e coletivamente "Usuários") que usam ou navegam no app ou qualquer outro site de propriedade de ou operada pela Cantina SENAI ou em seu nome (coletivamente os “Websites”). O APP é operado por ou em nome de Cantina SENAI, com sede na escola "Nadir Dias de Figueiredo". Endereço: Rua Ari Barroso, 305 - Presidente Altino - Osasco/SP. CEP: 06216-901. O acesso a e o uso do Website por você está condicionado à sua aceitação sem modificação deste Acordo. Seu uso do APP constitui sua aceitação deste Acordo. Os termos de nossa política geral de privacidade e política de privacidade infantil estão incorporadas como referência.

2. LEIS E REGULAMENTOS

O acesso a e uso deste app está sujeito a todas as leis e regulamentos internacionais, federais e locais aplicáveis. Acessando o app, os Usuários concordam em não usar o app para qualquer propósito que seja ilegal ou proibido por este Acordo. Os Usuários não podem:
(I) usar este app de maneira que possa danificar, desativar, sobrecarregar ou prejudicar;
(II) carregar, postar, usar correio eletrônico ou de outra maneira transmitir qualquer material que 
    (a) contenha vírus de software ou qualquer outro código de computador, arquivo ou programas projetados para interromper, destruir ou limitar a funcionalidade de qualquer software ou hardware do computador ou equipamentos de telecomunicações;
    (b) conter marca registrada de terceiros, marcas de serviço, direitos autorais ou outros direitos de propriedade sem o prévio consentimento e aprovação por escrito de terceiro(s); ou 
    (c) ser degradante, difamatório, obsceno, violento, sexual, discriminatório ou de outra maneira não profissional ou de mau gosto;
(III) interferir com os servidores ou redes conectados a ele; ou 
(IV) violar qualquer dos termos e condições, procedimentos, políticas ou regulamentos das redes conectadas. Qualquer tentativa de qualquer pessoa de minar a legitimidade de operação deste app poderá ser uma violação da lei civil e criminal, e, diante de qualquer tentativa desta espécie, a MJ Cantina SENAI reserva-se o direito de processar tal pessoa por danos, no maior âmbito permitido pela lei. O não cumprimento pela MJ Cantina SENAI destes termos e condições não deve constituir em renúncia destes, ou qualquer outra cláusula.

3. SEM GARANTIAS

A MJ Cantina SENAI utiliza esforços razoáveis para incluir informações precisas e atualizadas no app; entretanto, não fornecemos garantias ou representações quanto à exatidão destas informações. A MJ Cantina SENAI não assume obrigação ou responsabilidade por quaisquer erros ou omissões no teor do app, quaisquer falhas, atrasos ou interrupções na entrega de qualquer teor contido nele, ou quaisquer perdas ou danos procedentes do uso do teor fornecido pelo app.

4. RESTRIÇÃO DE RESPONSABILIDADE

A MJ Cantina SENAI não assume responsabilidade e não deve ser responsável por quaisquer danos ou vírus que possam infectar o dispositivo do Usuário ou outra propriedade, devido ao acesso, pesquisa ou uso do app pelo Usuário, ou se o Usuário fizer o download de quaisquer materiais, dados, textos, imagens, vídeos, ou áudio do app.

5. LIMITE DE USO PESSOAL E NÃO COMERCIAL

Exceto por especificação contrária, os serviços oferecidos no app são para uso pessoal e não comercial. Os Usuários não podem modificar, copiar, distribuir, transmitir, exibir, executar, reproduzir, publicar, licenciar, criar um trabalho derivado de transferir, vender ou pôr à venda quaisquer informações contidas no ou obtidas do app.

6. ENVIO DE INFORMAÇÃO

A  MJ Cantina SENAI tem a liberdade de usar quaisquer comentários, informações, ideias, conceitos, gráficos, fotografias, músicas, ilustrações, reproduções, sugestões, experiência, ou técnicas contidas em qualquer comunicado que o Usuário possa enviar à  MJ Cantina SENAI através deste app ou através de correio eletrônico (em conjunto com a "Sugestão"). Nós não trataremos nenhum envio de informação como confidencial ou patenteado e está livre para usá-la em todo o mundo, indefinidamente e sem compensação adicional, reconhecimento ou pagamento a tal Usuário e para qualquer objetivo, seja qual for, incluindo, entre outros, o desenvolvimento, fabricação e divulgação de produtos e criação, modificação ou aperfeiçoamento de nossos apps usando informações de tal Usuário.

7. INDENIZAÇÃO

Ao usar este app, cada Usuário aceita toda a responsabilidade, e com isto indeniza e inocenta a  MJ Cantina SENAI, cada uma de suas companhias relacionadas e os respectivos funcionários, diretores, empregados, acionistas, sucessores e cessionários de cada uma de tais companhias de e contra quaisquer reclamações que possam surgir de ações feitas por tal Usuário sobre ou em relação ao app, incluindo, mas não limitado a quaisquer Sugestões ou outros materiais atualizados por eles no app.

8. CONDIÇÕES DE PAGAMENTO

Os usuários devem efetuar o pagamento dos produtos e serviços adquiridos na cantina escolar através dos meios de pagamento disponibilizados no app. A Cantina SENAI reserva-se o direito de ajustar os métodos de pagamento a qualquer momento. Qualquer inadimplência pode resultar na suspensão temporária ou permanente do acesso aos serviços oferecidos.

9. LIMITAÇÃO DE COMPRAS

Cada Usuário pode estar sujeito a limites de quantidade ao adquirir produtos através do app, visando garantir o atendimento a todos os alunos. A Cantina SENAI se reserva o direito de limitar ou cancelar pedidos que, a seu exclusivo critério, excedam o limite estabelecido ou que pareçam ter sido feitos por revendedores.

10. CONTA DO USUÁRIO

Para utilizar determinados serviços, o Usuário deverá criar uma conta fornecendo informações verdadeiras, completas e atualizadas. O Usuário é responsável por manter a confidencialidade dos dados de login e é totalmente responsável por todas as atividades que ocorrerem sob sua conta. Em caso de uso não autorizado, o Usuário deverá notificar imediatamente a Cantina SENAI.

11.	HORÁRIO DE FUNCIONAMENTO

A Cantina SENAI opera em horários específicos, que podem variar conforme o calendário escolar. O uso do app para realizar pedidos deve ser feito dentro do horário de funcionamento, divulgado previamente aos usuários. A Cantina não se responsabiliza por pedidos feitos fora do horário de atendimento, que poderão ser automaticamente cancelados.

12.	RESPONSABILIDADE PELO USO DA CONTA

O Usuário é o único responsável por todas as atividades realizadas através de sua conta no app da cantina. A Cantina SENAI não se responsabiliza por acessos não autorizados decorrentes de negligência na proteção das informações de login. Caso ocorra qualquer atividade suspeita, o Usuário deve imediatamente alterar sua senha e notificar a administração da cantina.

13.	COMUNICAÇÕES ELETRÔNICAS

Ao utilizar o app da Cantina SENAI, o Usuário consente em receber comunicações eletrônicas relacionadas às transações realizadas, como confirmações de pedidos e atualizações.

14.	ACESSIBILIDADE

A Cantina SENAI compromete-se a tornar seu aplicativo acessível a todos os usuários, incluindo aqueles com deficiências. Caso algum Usuário tenha dificuldades de acesso, a Cantina deverá ser notificada para que as melhorias necessárias sejam implementadas de acordo com as leis de acessibilidade em vigor.
''',
                    style: GoogleFonts.courierPrime(fontSize: 16)
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
