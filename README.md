# Sobre este Repositório

Este repositório é responsável pela conexão do **Platform Channels do Flutter**, com ele é possível instalar e usar a SDK do Liveness3D da Oititec.

## O que é Bridge?

A "bridge" no contexto do Flutter refere-se à infraestrutura subjacente que permite a comunicação entre o código Dart e o código nativo da plataforma, possibilitando a criação de aplicativos que podem acessar recursos e funcionalidades específicas da plataforma, além das capacidades oferecidas pelo próprio framework Flutter.

### Platform Channels:

Para realizar a comunicação entre o código Dart e o código nativo da plataforma, o Flutter usa o conceito de "platform channels" (canais de plataforma). Esses canais permitem que você envie mensagens de um lado para o outro da "ponte" entre o código Dart e o código nativo. Isso é útil quando você precisa acessar recursos ou funcionalidades específicas da plataforma que não estão diretamente disponíveis no Flutter.

### MethodChannel:

O Flutter fornece duas classes principais para facilitar a comunicação através dos canais de plataforma: MethodChannel e EventChannel. Nesse projeto utilizamos apenas do MethodChannel que permite que você invoque métodos do código nativo a partir do Dart e obtenha callback`s.

<p align="center">
 <img src="https://miro.medium.com/v2/0*33bydz0LNvKaJ4kY.png"/>
</p>

## Instruções de Uso e Integração

As instruções de uso, integração, implementação e customização do **Liveness 3D** podem ser acessadas através do sumário abaixo:

**Flutter:**

- [Configuração do Platform Channels]().
- [Configuração dos Responses]().

**Android**

- [Configuração Inicial no Android]();
- [Configuração do Flutter Engine](Documentation/moduleandPackageKOTLIN.md);
- [Como configurar o Liveness3DUser()?](Documentation/xmlCUSTOMIZATION.md);
- [Como fazer a estilização dos Liveness3DTextsKey()?](Documentation/liveness3DTextCUSTOMIZATIONKOTLIN.md);
- [Como fazer a estilização do Liveness3DTheme()?](Documentation/xmlCUSTOMIZATION.md);
- [Guia de customização do Liveness3DTheme](Documentation/liveness3DThemeAndroidCUSTOMIZATION.md);
- [Guia de Implementação de View Customizada](Documentation/customViewANDROID.md);
- [Como Tratar os Responses/Callback?](Documentation/customViewANDROID.md);

**iOS:**

- [Configuração Inicial no iOS](Documentation/iosCONFIGURATION.md);
- [Configuração do Flutter Engine](Documentation/moduleandPackageKOTLIN.md);
- [Como configurar o Liveness3DUser()?](Documentation/xmlCUSTOMIZATION.md);
- [Como fazer a estilização dos Liveness3DTextsKey()?](Documentation/liveness3DTextCUSTOMIZATIONKOTLIN.md);
- [Como fazer a estilização do Liveness3DTheme()?](Documentation/xmlCUSTOMIZATION.md);
- [Guia de customização do Liveness3DTheme](Documentation/liveness3DThemeAndroidCUSTOMIZATION.md);
- [Guia de Implementação de View Customizada](Documentation/customViewANDROID.md);
- [Como Tratar os Responses/Callback?](Documentation/customViewANDROID.md);

### Como executar o clone do Repositório?

Execute o clone do repositório abaixo para baixar o código:

```sh
git clone https://github.com/oititec/flutter-liveness3d-bridge
```

### Como rodar o Script?

Para rodar o script desse repositório você deve instalar as dependências do projeto executando o seguinte comando no terminal;

#### Dependências

```sh
flutter pub get
```

### Como executar o projeto?

> Executar sempre em dispositivos físicos e não no simulador do iOS e Android pois nossa SDK tem emulator detection.

```sh
flutter run
```

Em seguida deve seguir escolher o dispositivo android ou iOS de debug listado no terminal.
