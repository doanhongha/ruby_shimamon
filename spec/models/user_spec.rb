require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end
  # context "with 2 or more tasks" do
  #   it "orders them in reverse chronologically" do
  #     user = build(:user).new
  #     task1 = user.tasks.create!(:name => "first task")
  #     task2 = user.tasks.create!(:name => "second task")
  #     expect(user.reload.tasks).to eq([task2, task1])
  #   end
  # end
  describe "db schema" do
    context "columns" do
      it { should have_db_column(:email).of_type(:string) }
      it { should have_db_column(:name).of_type(:string) }
      it { should have_db_column(:password_digest).of_type(:string) }
      it { should have_db_column(:role).of_type(:integer) }
      it { should have_db_column(:deleted_at).of_type(:datetime) }
    end
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_length_of(:name) }
    it { should validate_length_of(:email) }
  end

  describe "associations" do
    it { should have_many(:tasks).dependent(:destroy) }
  end
end
