require 'rails_helper'

feature 'User Edit Page', js: false do
  let(:user) { FactoryGirl.create(:user) }

  before do
    login_as(user, :scope => :user)
    visit "/users/#{user.id}/edit"
  end

  it 'can be reached' do
    expect(page.status_code).to eq(200)
  end

  it 'has a profile picture upload field' do
    expect(page).to have_field('user_profile_picture', type: 'file')
  end

  # it 'has an e-mail field' do
  #   expect(page).to have_field('user_email')
  # end

  it 'has a title field' do
    expect(page).to have_field('user_title')
  end

  it 'has a first name field' do
    expect(page).to have_field('user_first_name', type: 'text')
  end

  it 'has a middle name field' do
    expect(page).to have_field('user_middle_name', type: 'text')
  end

  it 'has a last name field' do
    expect(page).to have_field('user_last_name', type: 'text')
  end

  it 'has a citizenship field' do
    expect(page).to have_field('user_citizenship')
  end

  it 'has a date of birth field' do
    expect(page).to have_field('user_date_of_birth', type: 'date')
  end

  it 'has a phone number field' do
    expect(page).to have_field('user_phone_number', type: 'tel')
  end

  it 'has an address field' do
    expect(page).to have_field('user_address', type: 'text')
    expect(page).to have_field('user_address_line_2', type: 'text')
  end

  it 'has a city field' do
    expect(page).to have_field('user_city', type: 'text')
  end

  it 'has a postcode field' do
    expect(page).to have_field('user_postcode', type: 'text')
  end

  scenario 'user can fill in all their details' do
    user_fills_in_details
    click_on 'Save'
    # expect(page).to be('users/user_id/profile')
    expect(page).to have_content('My Details')
  end

  scenario 'user can upload a profile picture' do
    user_uploads_profile_picture
    click_on 'Save'
    # expect(page).to be('users/user_id/profile')
    expect(page).to have_content('My Details')
  end

  # scenario 'user wants to change his password' do
  #   visit "/users/edit.#{user.id}"
  #   expect(page).to have_content('Edit User')
  #   fill_in 'user_current_password', with: 'password'
  #   fill_in 'user_password', with: 'new_password'
  #   fill_in 'user_password_confirmation', with: 'new_passwords'
  #   click_on 'Update'

  #   expect(page).to have_content("doesn't match Password")
  #   fill_in 'user_current_password', with: 'password'
  #   fill_in 'user_password', with: 'new_password'
  #   fill_in 'user_password_confirmation', with: 'new_password'
  #   click_on 'Update'

  #   expect(current_path).to eq(user_path(user))
  # end

  private

  def user_fills_in_details
    select "Mr", from: "user_title"
    fill_in 'user_first_name', with: 'John'
    fill_in 'user_last_name', with: 'Smith'
    select "French", from: "user_citizenship"
    fill_in 'user_date_of_birth', with: '31/07/1980'
    fill_in 'user_phone_number', with: '07123 123123'
    fill_in 'user_address', with: '12 Example Road'
    fill_in 'user_address_line_2', with: 'New Example'
    fill_in 'user_city', with: 'Exampleville'
    fill_in 'user_postcode', with: 'EX14 MPL'
    fill_in 'user_date_of_birth', with: '31/07/1980'
  end

  def user_uploads_profile_picture
    click_on 'Change Picture'
    attach_file 'user_profile_picture', 'spec/files/eu.png'
  end
end
