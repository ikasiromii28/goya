require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '投稿の保存' do
    context '投稿できる場合' do
      it '日付と気分を投稿できる' do
        expect(@post).to be_valid
      end
    end
    context 'ツイートが投稿できない場合' do
      it '気分が空では投稿できない' do
        @post.kibun = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("気分は入力されていません")
      end
      it '日付が空では投稿できない' do
        @post.date = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("日付は入力されていません")
      end     
      it 'ユーザーが紐付いていなければ投稿できない' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('ユーザー名を入力してください')
      end
    end
  end
end
