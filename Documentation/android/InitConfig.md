# Configuração Inicial no Android

Para iniciar a configuracão inicial no Android precisamos instalar o SDK do Liveness3D da Oititec, seguindo os seguintes passos:

## Passo 1: Repositório Maven do SDK

No arquivo `build.gradle` na raiz da pasta android em `allprojects`, adicione o endereço do repositório de artefatos:

- [Acessar arquivo de exemplo](../../android/build.gradle).

```gradle
allprojects {
    repositories {
        google()
        mavenCentral()
        maven { url "https://raw.githubusercontent.com/oititec/android-oiti-versions-beta/master" }
    }
}
```

## Passo 2: Dependências

No arquivo `build.gradle` na pasta android/app, adicione a dependência:

- [Acessar arquivo de exemplo](../../android/app/build.gradle).

```gradle
dependencies {
    implementation 'br.com.oiti:liveness3d-sdk:7.1.2'
}
```
