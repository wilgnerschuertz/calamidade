enum RequestStatusEntity {
  analisys('Em análise', 0xFFfcb900, 0xFFEB575),
  accepted('Aprovado', 0xFF129166, 0xFF0a4531),
  rejected('Recusado', 0xFFEB5757, 0xE94949),
  concluded('Concluído', 0xFF129166, 0xFF0a4531),
  notDefined('Não definido', 0xFF010101, 0xFFFFFFFF);

  final String label;
  final int color;
  final int foregroundColor;

  const RequestStatusEntity(this.label, this.color, this.foregroundColor);

  static RequestStatusEntity fromId(int id) {
    switch (id) {
      case 1:
        return RequestStatusEntity.analisys;
      case 2:
        return RequestStatusEntity.accepted;
      case 3:
        return RequestStatusEntity.rejected;
      case 4:
        return RequestStatusEntity.concluded;
      default:
        return RequestStatusEntity.notDefined;
    }
  }
}
