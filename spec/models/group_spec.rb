require 'spec_helper'

describe Group do

  before { @group = Group.new(name: 'Ateneo WVT', description: 'Stalk the Ateneo WVT', category: 'Sports', photo: '') }

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

  describe 'subjects association' do
    before { @group.save }
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

