enum RequestStatus {
  analisys('Em analise', 0xFFfcb900, 0xFFa17703),
  accepted('Aceito', 0xFF129166, 0xFF0a4531),
  rejected('Rejeitado', 0xFFEB5757, 0xFF7d2e2e),
  concluded('Concluído', 0xFF129166, 0xFF0a4531),
  notDefined('Não definido', 0xFF010101, 0xFFFFFFFF);

  final String label;
  final int color;
  final int foregroundColor;

  const RequestStatus(this.label, this.color, this.foregroundColor);

  static RequestStatus fromId(int id) {
    switch (id) {
      case 1:
        return RequestStatus.analisys;
      case 2:
        return RequestStatus.accepted;
      case 3:
        return RequestStatus.rejected;
      case 4:
        return RequestStatus.concluded;
      default:
        return RequestStatus.notDefined;
    }
  }
}