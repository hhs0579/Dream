// /*

// https://pub.dev/packages/in_app_purchase

// 1. 안드로이드 https://developer.android.com/google/play/billing/integrate
// 주의할 점: build.gradle 에 결제 라이브러리 종속 항목 추가하면 안됨. 추가하면 플러터 라이브러리와 충돌 때문에 동작 안함

// 2. 아이폰 https://help.apple.com/app-store-connect/#/devb57be10e7
// xcode에서 인앱결제 추가하기 (링크참조)

// 3. 안드로이드는 build.gradle 만 수정한 상태에서 스토어에 '내부테스트'로 업로드 하기
// -> 이렇게 하고나면 구글플레이콘솔에서 인앱결제 상품 생성이 가능함

// 4. 애플, 안드로이드 각각 개발자계정에서 필요한 상품을 생성
// 상품 ID를 가지고 코드에서 구매요청을 하기 때문에, 하나의 상품에 대해 구글/애플 양쪽에 같은 상품 ID를 지정해놔야 코드가 안지저분해진다.
// (코드 그대로 쓸려고 일부러 상품 이름을 product1, product2, ...로 통일해서 쓰는 중)

// 5. handlePurchaseConsumable 등 함수를 호출한다.

//  */

// import 'dart:async';
// import 'dart:developer';
// import 'dart:io';

// import 'package:in_app_purchase/in_app_purchase.dart';
// import 'package:flutter/foundation.dart';

// InAppPurchaseController inAppPurchaseController = InAppPurchaseController();

// class InAppPurchaseController {
//   StreamSubscription<List<PurchaseDetails>>? _subscription;
//   bool _isWaitingPurchase = false;
//   String? _callBackMessage;
//   InAppPurchase? _instance;

//   Future<String?> handlePurchaseConsumable(String productId) async {
//     // 1. 초기화
//     log('[IAP] 1/5');
//     // inAppPurchaseController.initializingThePlugin(); --> runApp(App()) 이전에 추가할 것

//     // 2. 인앱결제 가능여부 체크
//     log('[IAP] 2/5');
//     if (await _instance!.isAvailable()) {
//       print('IAP available');
//     } else {
//       print('IAP not available');
//       return '현재 인앱결제를 이용할 수 없습니다.';
//     }

//     // 3. 존재하는 상품 ID인지 체크
//     log('[IAP] 3/5');
//     ProductDetailsResponse? response;
//     print('purchasing id $productId ..');
//     Set<String> ids = {productId}.toSet();
//     try {
//       response = await _instance!.queryProductDetails(ids);
//     } catch (e) {
//       print(e.toString());
//     }
//     if (response?.notFoundIDs.isNotEmpty ?? false) {
//       print(response?.notFoundIDs);
//       return '스토어에 없는 상품입니다.';
//     }
//     List<ProductDetails> products = response?.productDetails ?? [];

//     // 4. 구매 요청
//     log('[IAP] 4/5');
//     try {
//       final PurchaseParam purchaseParam =
//           PurchaseParam(productDetails: products.first);
//       _instance!.buyConsumable(purchaseParam: purchaseParam);
//     } catch (e) {
//       return e.toString();
//     }

//     // 5. 결제 콜백 대기
//     log('[IAP] 5/5');
//     _isWaitingPurchase = true;
//     while (true) {
//       await Future.delayed(Duration(seconds: 1));
//       if (!_isWaitingPurchase) break;
//     }
//     return _callBackMessage;
//   }

//   Future<String?> initializingThePlugin() async {
//     if (defaultTargetPlatform == TargetPlatform.android) {
//       InAppPurchaseAndroidPlatformAddition.enablePendingPurchases();
//     }

//     if (Platform.isIOS) {
//       var iosPlatformAddition = InAppPurchase.instance
//           .getPlatformAddition<InAppPurchaseIosPlatformAddition>();
//       await iosPlatformAddition.setDelegate(ExamplePaymentQueueDelegate());
//     }

//     _instance = InAppPurchase.instance;

//     // _available = await InAppPurchase.instance.isAvailable();
//     // if (!_available) {
//     //   print('인앱결제를 사용할 수 없습니다.');
//     // }

//     setupStream();
//   }

//   void setupStream() {
//     final Stream<List<PurchaseDetails>> purchaseUpdated =
//         _instance!.purchaseStream;
//     _subscription = purchaseUpdated.listen((purchaseDetailsList) {
//       _listenToPurchaseUpdated(purchaseDetailsList);
//     }, onDone: () {
//       _subscription!.cancel();
//     }, onError: (error) {
//       print(error.toString());
//       // handle error here.
//     });
//   }

//   void _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
//     purchaseDetailsList.forEach((PurchaseDetails purchaseDetails) async {
//       if (purchaseDetails.status == PurchaseStatus.pending) {
//         // _showPendingUI();
//       } else {
//         if (purchaseDetails.status == PurchaseStatus.error) {
//           print('_handleError(purchaseDetails.error!)');
//           print(purchaseDetails.error?.message);
//           print(purchaseDetails.productID);
//           print(purchaseDetails.purchaseID);
//           _callBackMessage = '인앱결제를 실패했습니다. 다시 시도해주세요.';
//           _isWaitingPurchase = false;
//         } else if (purchaseDetails.status == PurchaseStatus.purchased ||
//             purchaseDetails.status == PurchaseStatus.restored) {
//           bool valid = false;
//           try {
//             await _instance!.completePurchase(purchaseDetails);
//             valid = true;
//           } catch (e) {}
//           if (valid) {
//             print('_deliverProduct(purchaseDetails)');
//             _isWaitingPurchase = false;
//           } else {
//             print('_handleInvalidPurchase(purchaseDetails)');
//             _callBackMessage = '인앱결제를 실패했습니다. 다시 시도해주세요.';
//             _isWaitingPurchase = false;
//           }
//         }
//         // if (purchaseDetails.pendingCompletePurchase) {
//         //   await _instance!.completePurchase(purchaseDetails);
//         // }
//       }
//     });
//   }

// //   Future<String?> loadingProductsForSale(Set<String> kIds) async {
// //     final ProductDetailsResponse response =
// //         await _instance!.queryProductDetails(kIds);
// //     if (response.notFoundIDs.isNotEmpty) {
// //       return '인앱결제 상품 ID를 다시 확인해주세요.';
// //     }
// //     List<ProductDetails> products = response.productDetails;
// //   }
// //
// //   Future<void> restoringPreviousPurchases() async {
// //     await _instance!.restorePurchases();
// //   }
// //
// //   Future<void> makingPurchase(ProductDetails productDetails) async {
// //     final PurchaseParam purchaseParam =
// //         PurchaseParam(productDetails: productDetails);
// //     if (_isConsumable(productDetails)) {
// //       _instance!.buyConsumable(purchaseParam: purchaseParam);
// //     } else {
// //       _instance!.buyNonConsumable(purchaseParam: purchaseParam);
// //     }
// // // From here the purchase flow will be handled by the underlying store.
// // // Updates will be delivered to the `InAppPurchase.instance.purchaseStream`.
// //   }
// //
// //   bool _isConsumable(ProductDetails productDetails) {
// //     return false;
// //   }
// //
// //   void completePurchase(PurchaseDetails purchase) {
// //     _instance!.completePurchase(purchase);
// //   }
// //
// //   void updateExistingInAppSubscription(PurchaseDetails oldPurchaseDetails) {
// //     // PurchaseParam purchaseParam = GooglePlayPurchaseParam(
// //     //     productDetails: productDetails,
// //     //     changeSubscriptionParam: ChangeSubscriptionParam(
// //     //         oldPurchaseDetails: oldPurchaseDetails,
// //     //         prorationMode: ProrationMode.immediateWithTimeProration));
// //     // _instance!.buyNonConsumable(purchaseParam: purchaseParam);
// //   }
// }

// class ExamplePaymentQueueDelegate implements SKPaymentQueueDelegateWrapper {
//   @override
//   bool shouldContinueTransaction(
//       SKPaymentTransactionWrapper transaction, SKStorefrontWrapper storefront) {
//     return true;
//   }

//   @override
//   bool shouldShowPriceConsent() {
//     return false;
//   }
// }
