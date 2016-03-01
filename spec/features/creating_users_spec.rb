require 'rails_helper'

RSpec.feature "Creating Users", type: :feature do
  scenario 'with valid credentials' do
    visit root_path
    click_link 'Sign up'

    fill_in 'First Name', with: 'John'
    fill_in 'Last Name', with: 'Doe'
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Confirmation', with: 'password'
    click_button 'Create User'

    expect(page).to have_content('User has been created')
  end

  scenario 'with invalid credentials' do
    visit root_path
    click_link 'Sign up'

    fill_in 'First Name', with: ''
    fill_in 'Last Name', with: ''
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Confirmation', with: 'password'
    click_button 'Create User'

    expect(page).to have_content('User has not been created')
  end
end
