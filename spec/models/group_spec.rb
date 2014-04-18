require 'spec_helper'

describe Group do

  before { @group = Group.new(name: 'Ateneo WVT', description: 'Stalk the Ateneo WVT', category: 'Sports', photo: '') }

  subject { @group }  

  it {should respond_to(:name) }
  it {should respond_to(:description) }
  it {should respond_to(:category) }
  it {should respond_to(:photo) }

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


end

