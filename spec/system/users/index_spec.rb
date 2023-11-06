require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    driven_by(:rack_test)
    @user = User.create(name: 'Albert', photo: 'test photo', bio: 'Tester', posts_counter: 4)
  end

  it 'Should render user name' do
    visit root_path
    expect(page).to have_content('Albert')
  end

  it 'Should render user photo' do
    visit root_path
    expect(page.html).to include('user-photo')
  end

  it 'Should render number of posts' do
    visit root_path
    expect(page).to have_content('Number of posts: 4')
  end

  it 'Should click the link with the name of the user' do
    visit root_path
    click_on('Albert')
    expect(page).to have_current_path(user_path(id: @user.id))
  end
end
