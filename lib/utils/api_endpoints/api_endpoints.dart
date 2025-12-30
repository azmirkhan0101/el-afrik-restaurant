class ApiEndpoints {

  //=======================BASE====================================
  //BASE URL
  static const baseUrl = "http://13.55.115.124:5000/api/v1";

  //=======================AUTH====================================
  //LOGIN/SIGNIN
  static const login = "/auth/signin";
  //SIGNUP
  static const signup = "/auth/business-signup";
  //VERIFY SIGNUP OTP
  static const otpSignup = "/auth/verify-signup-otp";
  //RESEND SIGNUP OTP
  static const otpResendSignup = "/auth/send-signup-otp-again";
  //SEND FORGOT PASSWORD OTP
  static const otpForgotPassword = "/auth/forgot-password";
  //RESEND FORGOT PASSWORD OTP
  static const otpResendForgotPassword = "/auth/send-forgot-password-otp-again";
  //VERIFY FORGOT PASSWORD OTP
  static const otpVerifyForgotPassword = "/auth/verify-forgot-password-otp";
  //RESET PASSWORD - NEW PASSWORD
  static const resetPassword = "/auth/reset-password";


  //=======================PROFILE====================================
  //GET PROFILE
  static const getProfile = "/auth/profile";
  //CHANGE PASSWORD - UPDATE PASSWORD
  static const changePassword = "/auth/change-password";
  //DELETE ACCOUNT
  static const deleteAccount = "/auth/delete-account";
  //UPDATE PROFILE
  static const updateProfile = "/business/update-profile";


  //=========================HOME==============================
static const businessOverview = "/business/overview";//HOME SCREEN STATS
static const recentActivity = "/business/recent-activity";//HOME SCREEN RECENT ACTIVITY


//=======================ANALYTICS====================================
  //GET ANALYTICS
  static businessAnalytics({required String timeFilter}){
    return "/business/analytics?timeFilter=$timeFilter";
  }
  //REWARD ANALYTICS BY ID
  static String rewardAnalytics({required String rewardId}){
    return "/business/analytics/$rewardId";
  }

//FCM
static const String updateFcmToken = "/auth/update-fcm";

//TERMS AND CONDITIONS
static const String termsAndConditions = "/content";
}
