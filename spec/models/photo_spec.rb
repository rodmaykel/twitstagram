require 'spec_helper'

describe Photo do
  let(:group) { FactoryGirl.create(:group) }
    
  before do
    @subject = group.subjects.create(twitter: "rodmaykel", instagram: "777777", name: "Rod Coronel", photo: "photo")
    @photo = @subject.photos.build(caption: "caption", created: 1.day.ago, photo: "photo", instagram_id: "1")
  end

  subject { @photo }

  it { should respond_to(:subject_id) }
  it { should respond_to(:caption) }
  it { should respond_to(:created) }
  it { should respond_to(:photo) }
  it { should respond_to(:instagram_id) }

  it { should be_valid }

  it { should respond_to(:subject) }
  its(:subject) { should eq @subject }

  describe "photo validation" do
    before {@photo.photo = ''}
    it {should_not be_valid}
  end

  describe "instagram_id validation" do
    before {@photo.instagram_id = ''}
    it {should_not be_valid}    
  end

  describe "when subject_id is not present" do
    before { @photo.subject_id = nil }
    it { should_not be_valid }
  end

end
