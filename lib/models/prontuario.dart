import 'package:cloud_firestore/cloud_firestore.dart';

class Prontuario {
  String? id;
  final String paciente;
  final String descricao;
  final DateTime data;

  Prontuario({
    this.id,
    required this.paciente,
    required this.descricao,
    required this.data,
  });

  Map<String, dynamic> toMap() {
    return {
      'paciente': paciente,
      'descricao': descricao,
      'data': Timestamp.fromDate(data),
    };
  }

  factory Prontuario.fromMap(String id, Map<String, dynamic> map) {
    DateTime dataDateTime;
    
    // Verifica se é um Timestamp do Firestore
    if (map['data'] is Timestamp) {
      dataDateTime = (map['data'] as Timestamp).toDate();
    } 
    // Se for uma String, converte para DateTime
    else if (map['data'] is String) {
      dataDateTime = DateTime.parse(map['data']);
    } 
    // Se for um DateTime, usa diretamente
    else if (map['data'] is DateTime) {
      dataDateTime = map['data'] as DateTime;
    }
    // Fallback para data atual
    else {
      dataDateTime = DateTime.now();
    }

    return Prontuario(
      id: id,
      paciente: map['paciente'] ?? '',
      descricao: map['descricao'] ?? '',
      data: dataDateTime,
    );
  }
}
