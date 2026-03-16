//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:openapi/api.dart';
import 'package:test/test.dart';


/// tests for LotteryApi
void main() {
  // final instance = LotteryApi();

  group('tests for LotteryApi', () {
    // くじを引く
    //
    // 抽選実行API。 1) idempotencyKey重複確認 2) GPS範囲検証（100m以内） 3) Mock Location検知 4) 決済状態確認 5) 在庫条件付き更新（remainingCount > 0 AND version一致） 
    //
    //Future<LotteryDrawResponse> drawLottery(LotteryDrawRequest lotteryDrawRequest) async
    test('test drawLottery', () async {
      // TODO
    });

    // 当選結果詳細
    //
    //Future<LotteryResultDetail> getLotteryResultById(String resultId) async
    test('test getLotteryResultById', () async {
      // TODO
    });

    // 自分の当選履歴
    //
    //Future<ListLotteryResults200Response> listLotteryResults({ int limit, String nextToken }) async
    test('test listLotteryResults', () async {
      // TODO
    });

  });
}
