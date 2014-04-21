require 'spec_helper'

describe Tweet do
  let(:group) { FactoryGirl.create(:group) }
    
  before do
    @subject = group.subjects.create(twitter: "rodmaykel", instagram: "777777", name: "Rod Coronel", photo: "photo")
    @tweet = @subject.tweets.build(text: "tweet_text", created: 1.day.ago, photo: "photo", tweet_id: "1")
  end

  subject { @tweet }

  it { should respond_to(:subject_id) }
  it { should respond_to(:text) }
  it { should respond_to(:created) }
  it { should respond_to(:photo) }
  it { should respond_to(:tweet_id) }

  it { should be_valid }

  it { should respond_to(:subject) }
  its(:subject) { should eq @subject }

  describe "text validation" do
    before {@tweet.text = ''}
    it {should_not be_valid}
  end

  describe "tweet_id validation" do
    before {@tweet.tweet_id = ''}
    it {should_not be_valid}    
  end

  describe "when subject_id is not present" do
    before { @tweet.subject_id = nil }
    it { should_not be_valid }
  end
end
