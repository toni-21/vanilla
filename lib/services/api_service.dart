import 'package:appwrite/appwrite.dart';
import 'package:vanilla/data/auth_repo.dart';
import 'package:vanilla/utilities/constants/urls.dart';

class ApiService {
  late AuthRepo auth;
  late Account account;

  ApiService() {
    Client client = Client();
    client
        .setEndpoint(appwriteHostUrl)
        .setProject(projectId)
        .addHeader('Content-Type', 'application/json')
        .addHeader('X-Appwrite-Response-Format', '1.4.0')
        .addHeader('X-Appwrite-Key', apiKey)
        .setSelfSigned(status: true);
    account = Account(client);
    auth = AuthRepo(client);
  }

  // Future<User?> login(String email, String password) async {
  //   try {
  //     await account.createEmailPasswordSession(
  //         email: email, password: password);
  //     final user = await account.get();
  //     return user;
  //   } catch (e) {
  //     _dialogService.showCustomDialog(
  //       variant: DialogType.infoAlert,
  //       title: 'An error occured',
  //       description: '$e',
  //     );
  //     return null;
  //   }
  // }

  // Future<User?> register(String email, String password, String name) async {
  //   try {
  //     await account.create(
  //         userId: ID.unique(), email: email, password: password, name: name);
  //     await account.createEmailPasswordSession(
  //         email: email, password: password);
  //     final user = await account.get();
  //     return user;
  //   } catch (e) {
  //     _dialogService.showCustomDialog(
  //       variant: DialogType.infoAlert,
  //       title: 'An error occured',
  //       description: '$e',
  //     );
  //     return null;
  //   }
  // }

  // Future<void> logout() async {
  //   await account.deleteSession(sessionId: 'current');
  // }
}
