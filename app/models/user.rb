class User < ApplicationRecord
  # //の間に書く。iは大小関係ないオプション、\Aで始まり\zで終わり
  # \wで英数字と_、\dで数字  \. で .  +は1以上、*は0以上
  # [\w+-.]+で英数字_+.一つ以上、[a-z\d\-]
  #uniqueness: true # 同じのはダメよ


  # 制約 ( : の位置気を付けて)
  validates :name, presence: true, length: { maximum:50 }
  validates :email, presence: true, length: { maximum:255 },
  format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }, # .を連続しない
  uniqueness: { case_sensitive: false } # 大小関係なく同じのダメよ
end
