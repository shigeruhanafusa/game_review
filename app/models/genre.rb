class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: 'ジャンルを選択してください' },
    { id: 2, name: 'RPG' },
    { id: 3, name: 'ACT' },
    { id: 4, name: 'シューター' },
    { id: 5, name: 'ADV' },
    { id: 6, name: 'レース' },
    { id: 7, name: 'パズル' },
    { id: 8, name: 'シミュレーション' },
    { id: 9, name: '音ゲー' },
    { id: 10, name: 'テーブルゲーム' },
    { id: 11, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items

  end