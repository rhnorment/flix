require 'spec_helper'

describe 'delete a user' do

  it "automatically signs out that user" do
    user = User.create!(user_attributes)

    sign_in(user)

    visit user_path(user)

    click_link 'Delete Account'

    expect(page).to have_link('Sign In')
    expect(page).not_to have_link('Sign Out')
  end

end