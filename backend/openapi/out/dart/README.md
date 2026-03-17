# openapi
デジタル一番くじのバックエンドAPI仕様。
- 認証: Cognito JWTを想定（Bearer）
- 位置検証: 100m以内（Haversine）
- 冪等制御: idempotencyKeyで重複抽選を防止
- レート制限: 1ユーザーあたり 10 req/sec（API Gateway設定）


このDartパッケージは、[OpenAPI Generator](https://openapi-generator.tech)プロジェクトによって自動的に生成されました：

- APIバージョン: 1.0.0
- ジェネレーターのバージョン: 7.21.0-SNAPSHOT
- ビルドパッケージ: org.openapitools.codegen.languages.DartClientCodegen

## 要件

Dart 2.12以上

## インストールと使用方法

### Github
このDartパッケージがGithubに公開されている場合、`pubspec.yaml`に以下の依存関係を追加してください。
```
dependencies:
  openapi:
    git: https://github.com/GIT_USER_ID/GIT_REPO_ID.git
```

### ローカル
ローカルドライブにあるパッケージを使用するには、`pubspec.yaml`に以下の依存関係を追加してください。
```
dependencies:
  openapi:
    path: /path/to/openapi
```

## テスト

TODO

## はじめに

[インストールと使用方法](#インストールと使用方法)の手順に従った後、以下のコードを実行してください：

```dart
import 'package:openapi/api.dart';

// TODO HTTP Bearer認証の設定: bearerAuth
// ケース 1. 文字列トークンを使用する場合
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// ケース 2. トークンを生成する関数を使用する場合
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AuthApi();

try {
    final result = api_instance.getMe();
    print(result);
} catch (e) {
    print('AuthApi->getMeの呼び出しで例外が発生しました: $e\n');
}

```

## APIエンドポイントのドキュメント

すべてのURIは *https://api.example.com/v1* からの相対パスです。

クラス | メソッド | HTTPリクエスト | 説明
------------ | ------------- | ------------- | -------------
*AuthApi* | [**getMe**](doc//AuthApi.md#getme) | **GET** /auth/me | 自分の情報取得
*AuthApi* | [**login**](doc//AuthApi.md#login) | **POST** /auth/login | ログイン
*AuthApi* | [**signup**](doc//AuthApi.md#signup) | **POST** /auth/signup | ユーザー登録
*LotteryApi* | [**drawLottery**](doc//LotteryApi.md#drawlottery) | **POST** /lottery/draw | くじを引く
*LotteryApi* | [**getLotteryResultById**](doc//LotteryApi.md#getlotteryresultbyid) | **GET** /lottery/results/{resultId} | 当選結果詳細
*LotteryApi* | [**listLotteryResults**](doc//LotteryApi.md#listlotteryresults) | **GET** /lottery/results | 自分の当選履歴
*PaymentsApi* | [**createPayment**](doc//PaymentsApi.md#createpayment) | **POST** /payments/create | 決済開始（モック）
*PaymentsApi* | [**getPaymentById**](doc//PaymentsApi.md#getpaymentbyid) | **GET** /payments/{paymentId} | 決済状態確認（モック）
*StoresApi* | [**getStoreById**](doc//StoresApi.md#getstorebyid) | **GET** /stores/{storeId} | 店舗詳細
*StoresApi* | [**listStoreInventories**](doc//StoresApi.md#liststoreinventories) | **GET** /stores/{storeId}/inventories | 店舗の景品在庫一覧
*StoresApi* | [**listStores**](doc//StoresApi.md#liststores) | **GET** /stores | 実施店舗一覧


## モデルのドキュメント

 - [AuthResponse](doc//AuthResponse.md)
 - [CreatePaymentRequest](doc//CreatePaymentRequest.md)
 - [ErrorResponse](doc//ErrorResponse.md)
 - [Inventory](doc//Inventory.md)
 - [ListLotteryResults200Response](doc//ListLotteryResults200Response.md)
 - [ListStoreInventories200Response](doc//ListStoreInventories200Response.md)
 - [ListStores200Response](doc//ListStores200Response.md)
 - [LoginRequest](doc//LoginRequest.md)
 - [LotteryDrawRequest](doc//LotteryDrawRequest.md)
 - [LotteryDrawResponse](doc//LotteryDrawResponse.md)
 - [LotteryResult](doc//LotteryResult.md)
 - [LotteryResultDetail](doc//LotteryResultDetail.md)
 - [LotteryStatus](doc//LotteryStatus.md)
 - [Payment](doc//Payment.md)
 - [PrizeGrade](doc//PrizeGrade.md)
 - [SignUpRequest](doc//SignUpRequest.md)
 - [Store](doc//Store.md)
 - [User](doc//User.md)


## 認証のドキュメント


APIで定義されている認証スキーム:
### bearerAuth

- **タイプ**: HTTP Bearer 認証


## 作成者




