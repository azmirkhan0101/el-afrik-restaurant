import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final _googleSignIn = GoogleSignIn.instance;
  bool _isGoogleSignInInitialized = false;

  AuthService() {
    _initializeGoogleSignIn();
  }

  Future<void> _initializeGoogleSignIn() async {
    try {
      await _googleSignIn.initialize();
      _isGoogleSignInInitialized = true;
    } catch (e) {
      print('Failed to initialize Google Sign-In: $e');
    }
  }

  //Always check Google sign in initialization before use
  Future<void> _ensureGoogleSignInInitialized() async {
    if ( !_isGoogleSignInInitialized ) {
      await _initializeGoogleSignIn();
    }
  }

  Future<GoogleSignInAccount> signInWithGoogle() async{
    await _ensureGoogleSignInInitialized();
    try{
      GoogleSignInAccount signInAccount = await _googleSignIn.authenticate(scopeHint: ['email']);
      return signInAccount;
    }on GoogleSignInException catch(e){
      print("Google sign in failed: $e");
      rethrow;
    }catch(e){
      print("Unknown error occurred: $e");
      rethrow;
    }
  }

  GoogleSignInAuthentication getAuthTokens(GoogleSignInAccount account) {
    return account.authentication;
  }
}
