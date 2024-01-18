import 'dart:io';

import 'package:expenses_manager/core/log.dart';
import 'package:expenses_manager/data/expenses_repository.dart';
import 'package:expenses_manager/domain/usecases/use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

@injectable
class ExportExpensesUseCase extends NoParamUseCase<bool> {
  ExportExpensesUseCase({
    required this.repository,
  });

  final ExpensesRepository repository;

  @override
  Future<bool> call() async {
    // Map<Permission, PermissionStatus> permission = await Permission.storage.request();
    final permission = await Permission.manageExternalStorage.request();

    AppLogger().logger.d('permission: $permission');

    if (permission != PermissionStatus.granted) {
      return false;
    }

    final csv = await repository.export();
// getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOADS)
    // String dir = await getExternalStoragePublicDirectory.getExternalStoragePublicDirectory(
    //     ExtStorage.DIRECTORY_DOWNLOADS);

    // String dir = await ExternalPath.getExternalStoragePublicDirectory(
    //     ExternalPath.DIRECTORY_DOWNLOADS);
    final dir = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getDownloadsDirectory();

    if (dir == null) {
      return false;
    }
    try {
      AppLogger().logger.d("dir ${dir.path}");
      File f = File("${dir.path}/expenses.csv");
      if (!f.existsSync()) {
        f = await File('${dir.path}/expenses.csv').create(recursive: true);
      }
      f.writeAsString(csv!);
      return true;
    } catch (e) {
      AppLogger().logger.e("error ${e.toString()}");
      rethrow;
    }
  }
}
