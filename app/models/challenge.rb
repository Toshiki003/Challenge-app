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
        self.nickname = "名無し" if nickname.blank?
    end

    def set_todo
        todo_results = {
            "運動" => {
                "今すぐ" => [
                    "スクワット20回してみる",
                    "もも上げ50回してみる",
                ],
                "今日中" => {
                    "一番近い駅まで散歩してみる",
                    "5分だけランニングしてみる",

                },
                "正月三が日の間には必ず!" =>[
                    "逆立ちしてみる",
                    "ジムに行ってみる",

                ]
            },
            "生活" => {
                "今すぐ" => [
                    "鏡の前で笑顔になってみる",
                    "温かいコーヒーか紅茶を飲んでみる",
                ],
                "今日中" => {
                    "スマホから1時間離れてみる",
                    "5分だけ読書してみる",

                },
                "正月三が日の間には必ず!" =>[
                    "初詣に行ってみる",
                    "お正月っぽいことをやってみる",

                ]
            },
            "RUNTEQ" => {
                "今すぐ" => [
                    "twitterで新年のご挨拶ツイートをしてみる",
                    "timesで今年の目標を宣言してみる",
                ],
                "今日中" => {
                    "timesでスタンプ10個押してみる",
                    "timesでコメントしてみる",

                },
                "正月三が日の間には必ず!" =>[
                    "質問ボードの未回答に答えてみる",
                    "1月のイベントに登壇/参加の予約をしてみる",

                ]
            }
        }
        self.todo = todo_results.dig(category, timing).sample
    end
end
