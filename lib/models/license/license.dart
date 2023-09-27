class LicensePackage {
  final String? packageName;
  int? packageOccorrences;
  List<List<String?>?>? paragraphs;

  LicensePackage({
    required this.packageName,
    this.packageOccorrences = 1,
    List<List<String?>?>? paragraphs,
  }) {
    if (paragraphs == null) {
      this.paragraphs = <List<String?>?>[];
    } else {
      this.paragraphs = paragraphs;
    }
  }

  Future<void>? addPackageOccorrence() async {
    packageOccorrences = packageOccorrences! + 1;
  }

  Future<void>? addParagraph({
    List<String?>? paragraphToAdd,
  }) async {
    paragraphs!.add(
      paragraphToAdd,
    );
  }
}
