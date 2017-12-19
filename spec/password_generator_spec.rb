require_relative "../password_generator"
require 'pry'

describe "生成したパスワード確認" do
  let(:password_generator) { PasswordGenerator.new(length: length) }
  subject { password_generator.run }
  let(:length) { 8 }

  context "length = 8" do
    let(:length) { 8 }
    it "8文字であること" do
      expect(subject.length).to eq 8
    end
  end

  it "大文字が1以上あること" do
    is_expected.to match(/[A-Z]/)
  end

  it "小文字が1以上あること" do
    is_expected.to match(/[a-z]/)
  end

  it "数字が1以上あること" do
    is_expected.to match(/[\d]/)
  end
end