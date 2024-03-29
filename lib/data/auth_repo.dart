import 'package:appwrite/appwrite.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vanilla/app/app.dialogs.dart';
import 'package:vanilla/app/app.locator.dart';
import 'package:vanilla/models/response/user.dart';
import 'package:vanilla/services/auth_service.dart';
import 'package:vanilla/utilities/constants/urls.dart';
import 'package:vanilla/utilities/function_helpers/printf.dart';
import 'package:vanilla/utilities/function_helpers/random_gen.dart';

class AuthRepo {
  final _authService = locator<AuthService>();
  late Databases database;

  AuthRepo(client) {
    database = Databases(client);
  }

  Future<UserModel?> createUser({required String email}) async {
    final otp = generateOTP();
    try {
      final result = await database.createDocument(
        databaseId: databaseId,
        collectionId: userCollectionId,
        documentId: generateDocId(),
        data: {'email': email, 'authOtp': otp},
      );
      _authService.setOtp(otp);
      printf(result.toMap());
      final user = UserModel.fromJson(result.data, documentId: result.$id);
      return user;
    } on AppwriteException catch (e) {
      handleError(e.toString(), isAppwrite: true);
      return null;
    } catch (e) {
      handleError(e.toString());
      return null;
    }
  }

  Future<UserModel?> getUser({required String documentId}) async {
    try {
      final result = await database.getDocument(
        databaseId: databaseId,
        collectionId: userCollectionId,
        documentId: documentId,
      );
      printf(result.toMap().toString());
      final user = UserModel.fromJson(result.data, documentId: result.$id);
      return user;
    } on AppwriteException catch (e) {
      handleError(e.toString(), isAppwrite: true);
      return null;
    } catch (e) {
      handleError(e.toString());
      return null;
    }
  }

  Future<UserModel?> updateUser(
      {required UserModel model, bool? otpEnabled = true}) async {
    final otp = generateOTP();
    var data = model.toJson();
    if (otpEnabled == true) {
      data.addAll({'authOtp': otp});
    }
    printf('as3s');
    try {
      final result = await database.updateDocument(
          databaseId: databaseId,
          collectionId: userCollectionId,
          documentId: model.documentId!,
          data: data);
      _authService.setOtp(otp);
      printf(result.toMap().toString());
      final user = UserModel.fromJson(result.data, documentId: result.$id);
      return user;
    } on AppwriteException catch (e) {
      handleError(e.toString(), isAppwrite: true);
      return null;
    } catch (e) {
      handleError(e.toString());
      return null;
    }
  }

  Future checkIfUserExists({required String email}) async {
    try {
      final result = await database.listDocuments(
          databaseId: databaseId,
          collectionId: userCollectionId,
          queries: [
            Query.equal('email', [email])
          ]);
      printf(result.toMap().toString());
      if (result.total > 0) {
        return result.documents.first.$id;
      } else {
        return false;
      }
    } on AppwriteException catch (e) {
      handleError(e.toString(), isAppwrite: true);
      return null;
    } catch (e) {
      handleError(e.toString());
      return null;
    }
  }
}

void handleError(String? error, {bool? isAppwrite}) {
  final dialogService = locator<DialogService>();
  String pre = isAppwrite == true ? 'Appwrite: ' : '';
  printf('${pre}ERROR: $error');
  dialogService.showCustomDialog(
    variant: DialogType.infoAlert,
    title: '${pre}An error occured',
    description: '$error',
  );
}
