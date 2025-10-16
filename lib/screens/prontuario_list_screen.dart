import 'package:flutter/material.dart';
import '../models/prontuario.dart';
import '../services/firestore_service.dart';
import 'formulario_prontuario_screen.dart';

class ProntuarioListScreen extends StatelessWidget {
  final FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prontuários Eletrônicos'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: StreamBuilder<List<Prontuario>>(
        stream: firestoreService.getProntuarios(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error, size: 64, color: Colors.red),
                  SizedBox(height: 16),
                  Text('Erro ao carregar prontuários: ${snapshot.error}'),
                ],
              ),
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.medical_services, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('Nenhum prontuário encontrado'),
                  SizedBox(height: 8),
                  Text('Toque no + para adicionar um novo prontuário'),
                ],
              ),
            );
          }

          final prontuarios = snapshot.data!;
          return ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: prontuarios.length,
            itemBuilder: (context, index) {
              final prontuario = prontuarios[index];
              return Card(
                margin: EdgeInsets.symmetric(vertical: 4),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: Text(
                    prontuario.paciente,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 4),
                      Text(prontuario.descricao),
                      SizedBox(height: 4),
                      Text(
                        'Data: ${_formatarData(prontuario.data)}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _confirmarExclusao(context, prontuario),
                  ),
                  isThreeLine: true,
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => FormularioProntuarioScreen()),
        ),
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _confirmarExclusao(BuildContext context, Prontuario prontuario) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmar Exclusão'),
          content: Text('Deseja realmente excluir o prontuário de ${prontuario.paciente}?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                firestoreService.deletarProntuario(prontuario.id!);
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Prontuário excluído com sucesso!')),
                );
              },
              child: Text('Excluir', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  String _formatarData(DateTime data) {
    return '${data.day.toString().padLeft(2, '0')}/${data.month.toString().padLeft(2, '0')}/${data.year}';
  }
}
