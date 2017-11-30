require 'rails_helper'

RSpec.describe Task, type: :model do
  describe "associations" do
    it { should belong_to(:user).with_foreign_key('assign') }
  end
  describe "db schema" do
    context "columns" do
      it { should have_db_column(:description).of_type(:text) }
      it { should have_db_column(:name).of_type(:string) }
      it { should have_db_column(:status).of_type(:integer) }
      it { should have_db_column(:deadline).of_type(:datetime) }
      it { should have_db_column(:tag).of_type(:string) }
      it { should have_db_column(:assign).of_type(:integer) }
      it { should have_db_column(:deleted_at).of_type(:datetime) }
      it { should have_db_column(:priority).of_type(:integer) }
    end
  end
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:priority) }
    it { should validate_presence_of(:assign) }
    it { should validate_length_of(:name) }
  end
  # context "associations" do
  #   it {is_expected.to belong_to :user}
  # end

end
