require 'spec_helper'

describe "ViewPages" do
  subject { page }

  describe "view a group" do
    let(:group) { FactoryGirl.create(:group_with_subjects) }
    before { visit "/groups/#{group.id}/#{group.name.parameterize}"}
    
    it { should have_content(group.name)}
    it { should have_content(group.description)}
    it { should have_content(group.category)}
    
  end

end
