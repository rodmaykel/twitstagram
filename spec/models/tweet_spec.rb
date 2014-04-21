require 'spec_helper'

describe Tweet do
  let(:subj) { FactoryGirl.create(:subject) }
    
  before do
    #@subject = group.subjects.build(twitter: "rodmaykel", instagram: "777777", name: "Rod Coronel", photo: "photo")
    @tweet = subj.tweets.build(text: "tweet_text", created: 1.day.ago, photo: "photo", tweet_id: "1")
  end

  subject { @tweet }

  it { should respond_to(:subject_id) }
  it { should respond_to(:text) }
  it { should respond_to(:created) }
  it { should respond_to(:photo) }
  it { should respond_to(:tweet_id) }

  it { should be_valid }

  it { should respond_to(:subject) }
  its(:subject) { should eq subj }

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
