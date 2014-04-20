require 'spec_helper'

describe Subject do

  let(:group) { FactoryGirl.create(:group) }
  
  before do
    # This code is not idiomatically correct.
    @subject = group.subjects.build(twitter: "rodmaykel", instagram: "777777", name: "Rod Coronel", photo: "photo")
  end

  subject { @subject }

  it { should respond_to(:group_id) }
  it { should respond_to(:twitter) }
  it { should respond_to(:instagram) }
  it { should respond_to(:name) }
  it { should respond_to(:photo) }

  it { should be_valid }

  it { should respond_to(:group) }
  its(:group) { should eq group }

  describe "name validation" do
    before {@subject.name = ''}
    it {should_not be_valid}
  end

  describe "photo validation" do
    before {@subject.photo = ''}
    it {should_not be_valid}    
  end

  describe "when group_id is not present" do
    before { @subject.group_id = nil }
    it { should_not be_valid }
  end
end
