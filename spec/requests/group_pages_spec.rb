require 'spec_helper'

describe "Group Pages" do
  subject { page }

  describe "create page" do
    before { visit '/admin/groups/new' }
    it { should have_content('Groups#new') }
    it { should have_title(full_title('Create group')) }
  end

end
