import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vanilla/app/app.dialogs.dart';
import 'package:vanilla/app/app.locator.dart';
import 'package:vanilla/utilities/constants/urls.dart';

class ApiService {
  final _dialogService = locator<DialogService>();
  late Account account;

  ApiService() {
    Client client = Client();
    client
        .setEndpoint(appwriteHostUrl)
        .setProject(projectId)
        .setSelfSigned(status: true);
    account = Account(client);
  }

  Future<User?> login(String email, String password) async {
    try {
      await account.createEmailPasswordSession(
          email: email, password: password);
      final user = await account.get();
      return user;
    } catch (e) {
      _dialogService.showCustomDialog(
        variant: DialogType.infoAlert,
        title: 'An error occured',
        description: '$e',
      );
      return null;
    }
  }

  Future<User?> register(String email, String password, String name) async {
    try {
      await account.create(
          userId: ID.unique(), email: email, password: password, name: name);
      await account.createEmailPasswordSession(
          email: email, password: password);
      final user = await account.get();
      return user;
    } catch (e) {
      _dialogService.showCustomDialog(
        variant: DialogType.infoAlert,
        title: 'An error occured',
        description: '$e',
      );
      return null;
    }
  }

  Future<void> logout() async {
    await account.deleteSession(sessionId: 'current');
  }
}
