# Progate-2026

Digital Ichiban Kuji（デジタル一番くじ）を題材にした、Flutter/Dart フロントエンドと Go バックエンドで構成されるアプリケーションです。
フロントエンドは[こちら](https://github.com/Yuji-ctrl/lotteryAppMobile)  
Progateハッカソン powered by AWS（2026/03/10-21）で制作
https://progate.connpass.com/event/379252/

## 概要

このリポジトリは、デジタルくじサービスのアプリケーション実装を管理します。
バックエンド API は OpenAPI で仕様管理されており、認証・抽選・店舗・決済などの機能を扱う構成です。

## 主な機能

- ユーザー登録・ログイン　（フロント未実装）
- 認証済みユーザー情報の取得　（フロント未実装）
- デジタルくじの抽選
- 抽選結果の管理
- 店舗情報の管理
- 決済情報との連携を想定した API 設計
- OpenAPI 仕様から Dart クライアントコードを生成

## 技術スタック

| 領域 | 技術 |
| --- | --- |
| フロントエンド | Dart / Flutter |
| バックエンド | Go |
| API 仕様 | OpenAPI 3.0 |
| インフラ | AWS SAM / AWS Lambda / API Gateway 想定 |
| 認証 | Cognito JWT / Bearer 認証想定 |
| 開発環境 | Dev Container |

## ディレクトリ構成

```text
.
├── .claude/                 # Claude 向けルール・開発メモ
├── .devcontainer/           # Dev Container 設定
├── backend/                 # バックエンド実装・API 仕様・インフラ関連
│   ├── infrastructures/     # インフラ関連コード
│   ├── openapi/             # OpenAPI 仕様・生成コード
│   ├── sample/              # サンプル実装
│   └── template.yaml        # AWS SAM テンプレート
├── lottery_app/             # Flutter/Dart アプリケーション
├── go.mod                   # Go モジュール定義
└── go.sum                   # Go 依存関係ロック
```

## セットアップ
フロントエンドとバックエンドの統合が完璧にできていないため、ローカルで動かすことは難しいです。  
バックエンドのみであれば、以下の構成で動くはずです。
フロント側については[こちら](https://github.com/Yuji-ctrl/lotteryAppMobile)をご覧ください

### 前提条件

以下をインストールしてください。

- Go
- Docker
- AWS SAM CLI
- Git

### リポジトリの取得

```bash
git clone https://github.com/Cherry-115/Progate-2026.git
cd Progate-2026
```

サブモジュールが含まれるため、以下も実行してください。

```bash
git submodule update --init --recursive
```

## バックエンドの起動

```bash
cd backend
sam build
sam local start-api
```

## OpenAPI

API 仕様は以下に配置されています。

```text
backend/openapi/api.yaml
```

Dart クライアントコードは OpenAPI 仕様をもとに生成されます。
生成済みコードやドキュメントは以下のディレクトリを確認してください。

```text
backend/openapi/out/dart/
```

代表的な API は以下です。

| API | メソッド | エンドポイント | 説明 |
| --- | --- | --- | --- |
| Auth | POST | `/auth/signup` | ユーザー登録 |
| Auth | POST | `/auth/login` | ログイン |
| Auth | GET | `/auth/me` | 自分のユーザー情報取得 |

## 開発メモ

- 抽選処理では `idempotencyKey` による冪等制御を想定しています。
- API Gateway 側でレート制限を設定する想定です。
- OpenAPI を更新した場合は、必要に応じてクライアントコードを再生成してください。

## よく使うコマンド

### Go の依存関係を整理

```bash
go mod tidy
```

### SAM ビルド

```bash
cd backend
sam build
```

### SAM ローカル API 起動

```bash
cd backend
sam local start-api
```

## 今後の TODO

- 環境変数の一覧を README に追記
- API クライアント生成コマンドを明文化
- ローカル開発用の起動手順を詳細化
- テスト実行手順を追加
- デプロイ手順を整理
