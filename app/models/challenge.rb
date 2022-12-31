class Challenge < ApplicationRecord
  before_validation :set_nameless_user
  before_save :set_todo

  with_options presence: true do
    validates :nickname, length: { maximum: 30 }
    validates :timing
    validates :category
  end

  private

  def set_nameless_user
    # セッターメソッドを呼ぶ時には省略できない
    self.nickname = '名無し' if nickname.blank?
  end

  def set_todo
    todo_results = {
      '運動' => {
        1 => %w[
          スクワット20回してみる
          もも上げ50回してみる
        ],
        2 => %w[
          一番近い駅まで散歩してみる
          5分だけランニングしてみる
        ],
        3 => %w[
          逆立ちしてみる
          ジムに行ってみる
        ]
      },
      '生活' => {
        1 => %w[
          鏡の前で笑顔になってみる
          温かいコーヒーか紅茶を飲んでみる
        ],
        2 => %w[
          スマホから1時間離れてみる
          5分だけ読書してみる
        ],
        3 => %w[
          初詣に行ってみる
          お正月っぽいことをやってみる
        ]
      },
      'RUNTEQ' => {
        1 => %w[
          twitterで新年のご挨拶ツイートをしてみる
          timesで今年の目標を宣言してみる
        ],
        2 => %w[
          timesでスタンプ10個押してみる
          timesでコメントしてみる
        ],
        3 => [
          '質問ボードの未回答に答えてみる',
          '1月のイベントに登壇/参加の予約をしてみる'

        ]
      }
    }
    self.todo = todo_results.dig(category, timing).sample
  end 
end
