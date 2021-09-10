# Desafio programação - para vaga desenvolvedor Mobile

## Configurações
Crie o seu projeto Firebase com o nome `com.desafio.desafio`
1. Adicione o `google-services.json`a pasta `android/app` 
2. Adicione o `GoogleService-Info.plist`  a pasta `ios/Runner`

1. Configurar o Firebase
    1. Verifique e caso necessário habilite o FirebaseAuth no projeto
    2. Verifique e caso necessário habilite o FirebaseAnalytics no projeto
    3. Verifique e caso necessário habilite o Crashlytics no projeto

Siga os seguintes passos para configurar o Crashlytics no iOS
1. From Xcode select Runner from the project navigation.
2. Select the Build Phases tab, then click + > New Run Script Phase.
3. Add ${PODS_ROOT}/FirebaseCrashlytics/run to the Type a script... text box.

