import 'package:cbl/cbl.dart';

import '../exceptions.dart';

extension DatabaseUtilsExtension on Database {
  Future<Document> getDocumentOrThrow(String id) async {
    final doc = await getDocument(id);

    if (doc == null) {
      throw DocumentNotFoundException(id: id);
    }

    return doc;
  }
}
