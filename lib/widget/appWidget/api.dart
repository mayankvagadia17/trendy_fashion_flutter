import 'package:trendy_fashion/helper/Constant.dart';

// User Api
final Uri loginUri = Uri.parse("${baseUrl}user/login");
final Uri createProfileUri = Uri.parse("${baseUrl}user/createProfile");
final Uri verifyEmail = Uri.parse("${baseUrl}user/verifyEmail");
final Uri resendCode = Uri.parse("${baseUrl}user/resendCode");
final Uri forgotPassword = Uri.parse("${baseUrl}user/forgotPassword");
final Uri updatePassword = Uri.parse("${baseUrl}user/updatePassword");
final Uri editProfile = Uri.parse("${baseUrl}user/editProfile");

// Product Api
final Uri getAllProduct = Uri.parse("${baseUrl}api/product/getAllProduct");

// Category Api
final Uri getAllCategory = Uri.parse("${baseUrl}api/category/getAllCategory");

//  Wishlist Api
final Uri addToWishlist = Uri.parse("${baseUrl}api/wishlist/addwishlist");
final Uri getAllWishlistApi = Uri.parse("${baseUrl}api/wishlist/getAllwishlist");
