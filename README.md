# 📋 Prontuário Eletrônico

Um aplicativo Flutter para gerenciamento de prontuários médicos eletrônicos, desenvolvido com Firebase Firestore para armazenamento em nuvem.

## 🚀 Características

- **Interface Intuitiva**: Design moderno e responsivo usando Material Design 3
- **Armazenamento em Nuvem**: Integração com Firebase Firestore para sincronização automática
- **CRUD Completo**: Criar, visualizar e excluir prontuários médicos
- **Validação de Dados**: Validação robusta de formulários
- **Multiplataforma**: Funciona em Android, iOS, Web e Desktop

## 📱 Funcionalidades

### ✅ Gerenciamento de Prontuários
- Adicionar novos prontuários médicos
- Visualizar lista de todos os prontuários
- Excluir prontuários com confirmação
- Busca em tempo real via Firestore

### 📝 Formulário de Prontuário
- Nome do paciente (obrigatório, mínimo 3 caracteres)
- Descrição detalhada do atendimento (obrigatório, mínimo 10 caracteres)
- Data automática de criação
- Validação em tempo real

### 🎨 Interface do Usuário
- Tema verde (cor médica)
- Cards organizados para melhor visualização
- Ícones intuitivos
- Feedback visual para ações do usuário
- Estados de carregamento e erro

## 🛠️ Tecnologias Utilizadas

- **Flutter**: Framework de desenvolvimento multiplataforma
- **Dart**: Linguagem de programação
- **Firebase**: Backend como serviço
  - **Firebase Core**: Configuração base do Firebase
  - **Cloud Firestore**: Banco de dados NoSQL em tempo real
- **Material Design 3**: Sistema de design do Google

## 📋 Pré-requisitos

Antes de começar, certifique-se de ter instalado:

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (versão 3.9.2 ou superior)
- [Dart SDK](https://dart.dev/get-dart)
- [Android Studio](https://developer.android.com/studio) (para desenvolvimento Android)
- [Xcode](https://developer.apple.com/xcode/) (para desenvolvimento iOS - apenas macOS)
- Conta no [Firebase](https://firebase.google.com/)

## 🔧 Instalação e Configuração

### 1. Clone o repositório
```bash
git clone <url-do-repositorio>
cd prontuario_eletronico
```

### 2. Instale as dependências
```bash
flutter pub get
```

### 3. Configuração do Firebase

#### 3.1 Crie um projeto no Firebase Console
1. Acesse [Firebase Console](https://console.firebase.google.com/)
2. Clique em "Criar um projeto"
3. Siga as instruções para criar o projeto

#### 3.2 Configure o Firestore
1. No console do Firebase, vá para "Firestore Database"
2. Clique em "Criar banco de dados"
3. Escolha "Começar no modo de teste" (para desenvolvimento)
4. Selecione uma localização para o banco de dados

#### 3.3 Configure a autenticação (se necessário)
1. Vá para "Authentication" no console
2. Clique em "Começar"
3. Configure os métodos de autenticação desejados

#### 3.4 Baixe os arquivos de configuração
1. No console do Firebase, clique no ícone de configurações do projeto
2. Selecione "Configurações do projeto"
3. Baixe os arquivos de configuração:
   - `google-services.json` para Android (coloque em `android/app/`)
   - `GoogleService-Info.plist` para iOS (coloque em `ios/Runner/`)

### 4. Configure as regras do Firestore

No console do Firebase, vá para Firestore Database > Regras e configure:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /prontuarios/{document} {
      allow read, write: if true; // Para desenvolvimento - ajuste conforme necessário
    }
  }
}
```

### 5. Execute o aplicativo
```bash
flutter run
```

## 📁 Estrutura do Projeto

```
lib/
├── main.dart                          # Ponto de entrada da aplicação
├── firebase_options.dart              # Configurações do Firebase
├── models/
│   └── prontuario.dart               # Modelo de dados do prontuário
├── screens/
│   ├── prontuario_list_screen.dart   # Tela de listagem de prontuários
│   └── formulario_prontuario_screen.dart # Tela de formulário
└── services/
    └── firestore_service.dart        # Serviço de comunicação com Firestore
```

## 🔧 Desenvolvimento

### Executar em modo debug
```bash
flutter run --debug
```

### Executar testes
```bash
flutter test
```

### Análise estática do código
```bash
flutter analyze
```

### Formatação do código
```bash
flutter format .
```

## 📱 Plataformas Suportadas

- ✅ Android (API 21+)
- ✅ iOS (iOS 11.0+)
- ✅ Web
- ✅ Windows
- ✅ macOS
- ✅ Linux

## 🚀 Build para Produção

### Android (APK)
```bash
flutter build apk --release
```

### Android (App Bundle)
```bash
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```

### Web
```bash
flutter build web --release
```

### Windows
```bash
flutter build windows --release
```

## 📊 Funcionalidades Futuras

- [ ] Autenticação de usuários
- [ ] Edição de prontuários existentes
- [ ] Busca e filtros avançados
- [ ] Anexos e imagens
- [ ] Relatórios em PDF
- [ ] Notificações push
- [ ] Modo offline
- [ ] Backup automático

## 🤝 Contribuição

1. Faça um fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## 👥 Autores

- **Desenvolvedor** - *Desenvolvimento inicial* - [Seu Nome](https://github.com/seuusuario)

## 📞 Suporte

Se você encontrar algum problema ou tiver dúvidas, por favor:

1. Verifique se existe uma [issue](https://github.com/seuusuario/prontuario_eletronico/issues) similar
2. Crie uma nova issue com detalhes do problema
3. Entre em contato através do email: seu.email@exemplo.com

## 🙏 Agradecimentos

- Equipe do Flutter por criar um framework incrível
- Firebase por fornecer uma plataforma robusta de backend
- Comunidade Flutter por todo o suporte e recursos disponíveis

---

⭐ Se este projeto foi útil para você, considere dar uma estrela no repositório!
