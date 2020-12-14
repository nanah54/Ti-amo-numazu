# README


・アプリ名	Ti-amo-numazu 聖地巡礼者交流アプリ					
・概要 沼津に観光に来た人がオススメのお店やイベントなどの情報を主にチャットや画像投稿を通して交流を深める
・制作背景 自分自身が巡礼をしていてその知識をまだ行ったことのない知人に共有し喜ばれた事、
   コロナの影響で巡礼が難しくなり、沼津が今どんな感じなのかツイッター等のsnsだけだと分かりづらいと感じたため
・DEMO					
・実装予定の内容	画像投稿可能なチャット機能 初心者の方用の案内オススメ巡礼サイトを作りそこへのリンクも貼る					
・DB設計		
   # テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :room_users
- has_many :rooms, through: room_users
- has_many :messages

## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :room_users
- has_many :users, through: room_users
- has_many :messages

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user				
