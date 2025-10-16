# 🔥 Configuração do Firebase para Prontuário Eletrônico

Este guia te ajudará a configurar o Firebase no seu projeto Flutter de Prontuário Eletrônico.

## 📋 Pré-requisitos

- Flutter instalado e configurado
- Conta Google (para acessar o Firebase Console)
- Android Studio ou VS Code com extensão Flutter

## 🚀 Passo a Passo Completo

### 1. Criar Projeto no Firebase Console

1. Acesse [https://console.firebase.google.com](https://console.firebase.google.com)
2. Clique em **"Adicionar Projeto"**
3. Digite o nome: `prontuario-eletronico` (ou qualquer nome de sua escolha)
4. Clique em **"Continuar"**
5. Desative o Google Analytics (opcional) e clique em **"Criar Projeto"**

### 2. Registrar App Android

1. No console do Firebase, clique no ícone **Android**
2. Preencha os dados:
   - **Nome do pacote Android**: `com.example.prontuario_eletronico`
   - **Apelido do app**: `Prontuário Eletrônico` (opcional)
3. Clique em **"Registrar app"**
4. **BAIXE** o arquivo `google-services.json`
5. **MOVA** o arquivo para: `android/app/google-services.json`

### 3. Configurar Firestore Database

1. No console Firebase, vá para **"Firestore Database"**
2. Clique em **"Criar banco de dados"**
3. Escolha **"Começar no modo de teste"** (para desenvolvimento)
4. Selecione uma localização (ex: `us-central1`)
5. Clique em **"Ativar"**

### 4. Configurar Regras de Segurança (Importante!)

No Firestore, vá para **"Regras"** e substitua por:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if true; // ⚠️ APENAS PARA DESENVOLVIMENTO
    }
  }
}
```

**⚠️ ATENÇÃO**: Esta regra permite acesso total. Para produção, configure regras mais restritivas!

### 5. Instalar FlutterFire CLI (Opcional)

```bash
dart pub global activate flutterfire_cli
```

### 6. Executar o Projeto

```bash
flutter pub get
flutter run
```

## 📱 Funcionalidades do App

✅ **Lista de Prontuários**: Visualize todos os prontuários em tempo real
✅ **Adicionar Prontuário**: Formulário com validação para novos prontuários
✅ **Excluir Prontuário**: Confirmação antes da exclusão
✅ **Interface Moderna**: Design Material 3 com tema verde médico
✅ **Sincronização em Tempo Real**: Dados atualizados automaticamente

## 🏗️ Estrutura do Projeto

```
lib/
├── models/
│   └── prontuario.dart          # Modelo de dados
├── services/
│   └── firestore_service.dart   # Serviço de banco de dados
├── screens/
│   ├── prontuario_list_screen.dart      # Lista de prontuários
│   └── formulario_prontuario_screen.dart # Formulário de cadastro
├── main.dart                     # Inicialização do app
└── firebase_options.dart        # Configurações do Firebase
```

## 🔧 Solução de Problemas

### Erro: "No Firebase App '[DEFAULT]' has been created"
- Verifique se o arquivo `google-services.json` está em `android/app/`
- Execute `flutter clean` e `flutter pub get`

### Erro: "Firebase not initialized"
- Verifique se o `firebase_options.dart` está correto
- Confirme se as dependências estão instaladas

### Erro de permissão no Firestore
- Verifique as regras de segurança no console Firebase
- Confirme se o modo de teste está ativado

## 🎯 Próximos Passos

1. **Autenticação**: Adicionar login com Firebase Auth
2. **Edição**: Permitir editar prontuários existentes
3. **Filtros**: Buscar por paciente ou data
4. **Fotos**: Upload de imagens com Firebase Storage
5. **Notificações**: Push notifications

## 📞 Suporte

Se encontrar problemas:
1. Verifique se seguiu todos os passos
2. Confirme se o arquivo `google-services.json` está correto
3. Execute `flutter doctor` para verificar a instalação
4. Consulte a [documentação oficial do Firebase](https://firebase.google.com/docs/flutter/setup)

---

**🎉 Parabéns!** Seu app de Prontuário Eletrônico está pronto para uso!
