# App Ajuda Enchentes RS

Este aplicativo é uma iniciativa para auxiliar as vítimas das enchentes no Rio Grande do Sul, facilitando a conexão entre voluntários, doadores e as famílias afetadas.

## Personagens

- **Voluntários Adopters**: Indivíduos ou famílias que desejam "adotar" famílias afetadas, fornecendo apoio contínuo.
- **Voluntários de Campo**: Voluntários que trabalham diretamente no terreno para auxiliar os afetados pelas enchentes.

## Funcionalidades

- **Coleta de Informações sobre Doações**: Uma interface para registrar e gerenciar as informações sobre as doações recebidas.
- **Transparência na Destinação de Recursos**: Relatórios e atualizações sobre como os recursos estão sendo usados, garantindo transparência.
- **Recebimento de Donativos**: Sistema para conectar doadores com as necessidades específicas das vítimas.
- **Arrecadação de Fundos**: Ferramenta para facilitar a arrecadação de fundos para apoiar os afetados.
- **QR Code para Doações**: Facilitar doações por meio de um QR code que direciona para uma conta dedicada.

## Liberação de Recursos

As liberações de recursos são feitas parcialmente, acompanhadas de comprovantes e transações financeiras claras para garantir transparência e confiança.

## Contato

- **Coordenadora do Projeto**: Rosane (contato ainda será adicionado)

## Metodologia de Desenvolvimento

- **Dia 1 (Segunda)**: Brainstorm de ideias e requisitos.
- **Dia 2 (Terça)**: Refinamento das ideias e planejamento.
- **Dia 3 (Quarta)**: Produção e desenvolvimento.
- **Dia 4 (Quinta)**: Testes de funcionalidades.
- **Dia 5 (Sexta)**: Revisão final e entrega.

## Tecnologias e Pacotes Utilizados

- [Auto Injector](https://pub.dev/packages/auto_injector): Para injeção de dependências.
- [RouteFly](https://pub.dev/packages/routefly): Gerenciamento de rotas no app.
- [ValueNotifier](https://api.flutter.dev/flutter/foundation/ValueNotifier-class.html): Utilizado para gerenciar estados dentro do app.

## Como Contribuir

Contribuições são bem-vindas! Siga os passos descritos na seção "Como Contribuir" acima para saber como você pode ajudar.

Não esqueça de dar um Sync Fork para pegar as atualizações já que estamos fazendo fork do projeto.

![Como fazer o Sync Fork](doc/sync_fork.png)

## Tutoriais e Recursos

Para ajudar os desenvolvedores a se familiarizarem com as tecnologias e pacotes utilizados neste projeto, compilamos uma lista de vídeos e tutoriais úteis:

- **Flutter com RouteFly**:
  [Assista ao tutorial](https://www.youtube.com/watch?v=DmbIABioAME)
  Este vídeo explica como utilizar o pacote RouteFly para gerenciamento de rotas no Flutter.

- **Flutter ValueNotifier**:
  [Assista à série de vídeos](https://www.youtube.com/watch?v=zV1X9vwYcdI&list=PLlBnICoI-g-eG0eVkHu2IaO48TljxPjPq)
  Esta série de vídeos oferece uma visão detalhada sobre como usar `ValueNotifier` para gerenciar estados no Flutter.

- **Auto Injector no Flutter**:
  [Assista ao tutorial](https://www.youtube.com/watch?v=BwrbAWlKWsQ)
  Aprenda a implementar injeção de dependência no seu projeto Flutter usando o pacote Auto Injector.

Estes recursos são recomendados para todos os membros da equipe, especialmente aqueles novos nas bibliotecas e frameworks utilizados.

## Code review

[!WARNING]
Atenção: Somente será feito o merge de MRs revisados por múltiplas pessoas. Esse controle será feito através da verificação do número de reações ao MR que deverá ter ao menos dois.

Todo código deverá passar por Code Review através da feature "Merge Request (MR)" do Gitlab durante o processo de merge da branch de "feature" para a branch alvo.
É recomendado que durante o desenvolvimento da feature seja criado um Merge Request de WIP (trabalho em progresso) para permitir coletar feedbacks ao longo do processo. Isso ocorre quando o título da MR é prefixado de WIP:.

## Nomenclatura

### Padrão para classes de interface

```dart
//good
abstract interface class IUser {}

//bad
abstract interface class InterfaceUser {}
```

### Padrão para classes de implementação de interface

```dart
//good
class UserImpl implements IUser {}

//bad
class UserImplements implements IUser {}
```

### Padrão para classes de models

#### definição: modelo vai replicar o que a api do backend espera

```dart
//good
class UserModel{
    final String name;
}

//bad
class User{
    final String n;
}
```

### Padrão para classes de entity

#### definição: entity vai replicar o que a tela precisa

```dart
//good
class UserEntity {}

//bad
class User {}
```

## State Pattern

- **Flutter State Pattern**:
  [Aprenda State Pattern](https://blog.flutterando.com.br/entendendo-state-pattern-flutter-b0318bab77c3)

```dart
sealed class DefaultState {}

class InitialState implements DefaultState {}

class LoadingState implements DefaultState {}

class SuccessState<R> implements DefaultState {
  const SuccessState({
    required this.data,
  });

  final R data;
}

class ErrorState<T> implements DefaultState {
  const ErrorState({
    required this.exception,
  });

  final T exception;
}
```

## Como criar uma nova feature

As features devem ficar no diretorio app/features usando a arquitetura minicore

- **Arquitetura Minicore**:
  [Minicore Doc](https://github.com/Flutterando/minicore)

A features será dividida em 3 camadas, UI, Interactor, Data.

UI - toda parta visual da feature se trata da tela em si.

Interactor - aqui ficarão as entidades, o Interactor que tem a regra de négocios e a gerenciamento de estados e também as interfaces que a camada data deve implementar.

Data - Implementação dos contratos, e os Adapters que seriam as serialização dos dados.

- **App todo minicore**:
  [App usando Minicore de exemplo](https://github.com/EdsonMello-code/todoapp)

## Como adicionar um package

Os packages devem ficar dentro de core/shared/services/

Criar um diretorio com o nome do package e deve conter um contrato que deve ser usada pelo projeto e sua implementação feita com determinado package, o contrato e a implementação devem ficar no mesmo arquivo.

## Nomenclatura geral

Diretórios e Arquivos: snake_case
Classes: PascalCase
Variaveis, funcões e métodos: camelCase
Interfaces: comece com um I, por ex. IRepository
Implementação: termina com Impl, por ex. RepositoryImpl

Toda pagina deve ter seunome mais o sufixo '_page.dart' para a geração de rotas do routefly.

Snake Case:
Use o estilo snake_case para nomes de arquivos.
Todas as letras devem ser minúsculas.
Palavras separadas por sublinhado.
Descrição Concisa:
Mantenha o nome do arquivo descritivo e conciso, refletindo seu conteúdo ou funcionalidade.

## Convenção de Commits

Commits:
feat, fix, doc, etc.

[Conventianal Commits](https://www.conventionalcommits.org/en/v1.0.0)

## Convenção de nomenclatura para branches

prefixos utilizados:

feat: adição de código novo
fix: correção de pré-existente
refact: mudança de um código pré-existente
release: alterações no pubspac
doc: alteração na documentação

exemplo: feat/#10-nova-tela-de-usuario

## Licença

Este projeto é distribuído sob a Licença MIT, o que permite o uso, cópia, modificação, fusão, publicação, distribuição, sublicenciação, e/ou venda de cópias do software, desde que as cópias do software sejam acompanhadas pelo aviso de direitos autorais e este aviso de permissão.
