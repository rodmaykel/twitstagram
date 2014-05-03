require 'spec_helper'

describe Group do

  before { @group = Group.create(name: 'Ateneo WVT', description: 'Stalk the Ateneo WVT', category: 'Sports', photo: '') }

  subject { @group }  

  it {should respond_to(:name) }
  it {should respond_to(:description) }
  it {should respond_to(:category) }
  it {should respond_to(:photo) }

  it { should respond_to(:subjects) }

  it { should be_valid }

  describe 'name validation' do
    before { @group.name = '' }
    it { should_not be_valid }
  end

  describe 'description validation' do
    before { @group.description = '' }
    it { should_not be_valid }
  end

  describe 'category validation' do
    before { @group.category = '' }
    it { should_not be_valid }
  end

  describe 'photo validation' do
    before { @group.photo = '' }
    it { should be_valid }
  end

  describe "tweets and photos" do
    
    let!(:another_group) {
      FactoryGirl.create(:group)
    }
    let!(:non_member_subject) {
      another_group.subjects.create!(twitter: "rodmaykel2", instagram: "777777", name: "Rod Coronel", photo: "photo")
    }
    let!(:first_member_subject) {
      @group.subjects.create!(twitter: "rodmaykel", instagram: "7777771", name: "Rod Coronel", photo: "photo")
    }
    let!(:second_member_subject) {
      @group.subjects.create!(twitter: "rodmaykel3", instagram: "7777772", name: "Rod Coronel", photo: "photo")
    }
    let!(:first_tweet) {
      first_member_subject.tweets.create!(text: "lorem ipsum", created: 1.hour.ago, photo: "photo", tweet_id: "312")
    }
    let!(:first_photo) {
      first_member_subject.photos.create!(caption: "caption", created: 1.day.ago, photo: "photo", instagram_id: "1")
    }
    
    before do
      3.times do |n| 
        second_member_subject.tweets.create!(text: "lorem ipsum", created: 1.hour.ago, photo: "photo", tweet_id: "#{n}")
        non_member_subject.tweets.create!(text: "lorem ipsum", created: 1.hour.ago, photo: "photo", tweet_id: "#{n}")
        second_member_subject.photos.create!(caption: "caption", created: 1.day.ago, photo: "photo", instagram_id: "#{n}")
        non_member_subject.photos.create!(caption: "caption", created: 1.day.ago, photo: "photo", instagram_id: "#{n}")
      end
    end

    its(:tweets) do
      another_group.tweets.each do |tweet|
        should_not include(tweet)
      end
    end
    its(:tweets) { should include(first_tweet) }
    its(:tweets) do
      second_member_subject.tweets.each do |tweet|
        should include(tweet)
      end
    end

    its(:photos) do
      another_group.photos.each do |photo|
        should_not include(photo)
      end
    end
    its(:photos) { should include(first_photo) }
    its(:photos) do
      second_member_subject.photos.each do |photo|
        should include(photo)
      end
    end

  end

  describe 'subjects association' do
    
    let!(:older_subject) do
      FactoryGirl.create(:subject, group: @group, created_at: 1.day.ago)
    end
    let!(:newer_subject) do
      FactoryGirl.create(:subject, group: @group, created_at: 1.hour.ago)
    end

    it "should have the right subjects in the right order" do
      expect(@group.subjects.to_a).to eq [newer_subject, older_subject]
    end

    it "should destroy associated subjects" do
      subjects = @group.subjects.to_a
      @group.destroy
      expect(subjects).not_to be_empty
      subjects.each do |subject|
        expect(Subject.where(id: subject.id)).to be_empty
      end
    end
  end


end

