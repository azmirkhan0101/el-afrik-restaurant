class ApiEndpoints {

  //=======================BASE====================================
  //BASE URL
  static const baseUrl = "http://10.10.20.34:5000/api/v1";

  //=======================AUTH====================================
  //LOGIN/SIGNIN
  static const login = "/auth/login";
  //SIGNUP
  static const signup = "/auth/register";
  //SEND FORGOT PASSWORD OTP
  static const otpForgotPassword = "/auth/forgotPass";
  //RESEND OTP
  static const otpResend = "/auth/resendOtp";
  //VERIFY SIGNUP OTP
  static const verifySignupOtp = "/auth/regOtpVerify";
  //VERIFY FORGOT PASSWORD OTP
  static const otpVerifyForgotPassword = "/auth/verifyOtp";
  //RESET PASSWORD - NEW PASSWORD
  static const resetPassword = "/auth/resetPass";

  //=======================PROFILE====================================
  //GET PROFILE
  static const getProfile = "/user/my-profile";
  //CHANGE PASSWORD - UPDATE PASSWORD
  static const changePassword = "/auth/changePassword";
  //DELETE ACCOUNT
  static const deleteAccount = "/user/delete-profile";
  //UPDATE PROFILE
  static const updateProfile = "/user/edit-profile";

  //=========================PRODUCTS==============================
  static const getAllProducts = "/product/allProduct";
static String getProductDetails({required String productId}) {
  return "/product/single-product/$productId}";
}
static const topFlavourProduct = "/product/allProduct/?isFeatured=true";

//=========================CART========================================
  static const getCartItems = "/cart/all-item";
  static const addItemToCart = "/cart/add-item";
  static String updateCartItems({required String productId}) {
    return "/cart/update-item/$productId";
  }
  static String removeItemFromCart({required String id}){
    return "/cart/remove-item/$id";
  }
  static const clearCart = "/cart/clear-cart";


//=========================CATEGORY==================================
  static const getAllCategory = "/category/allCategory";
  static String getCategoryProducts({required String categoryId}){
    return "/product/allProduct?category=$categoryId";
  }

//=========================WISHLIST==================================
  static const getWishList = "/wishlist/mine";
  static String addItemToWishList({required String id}){
    return "/wishlist/add/$id";
  }
  static String removeItemFromWishlist({required String id}){
    return "/wishlist/remove/$id";
  }

//=========================CHECKOUT==================================
  static const checkout = "/order/checkout";

//=========================FAQ========================================
  static const String faq = "/faq/allFaq";
  //=========================PRIVACY POLICY===========================
  static const String privacyPolicy = "/privacy/retrive";
//=========================TERMS AND CONDITIONS=======================
  static const String termsAndConditions = "/terms/retrive";
}
