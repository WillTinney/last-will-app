require 'rails_helper'

feature 'Guardian Edit Page', js: false do
  let(:user) { FactoryGirl.create(:user) }
  # let(:guardian) { FactoryGirl.create(:assignee, :guardian, association(:user)) }

  before do
    login_as(user, :scope => :user)
    @guardian = FactoryGirl.create(:assignee, :guardian, user: user)
    visit "/users/#{user.id}/assignees/#{@guardian.id}/edit"
  end

  it 'can be reached' do
    expect(page.status_code).to eq(200)
  end

  it 'has a profile picture upload field' do
    expect(page).to have_field('guardian_profile_picture', type: 'file')
  end

  it 'type is guardian' do
    expect(find('#set_assignee_type', :visible => false).value).to eq('Guardian')
  end

  it 'has relevant fields' do
    expect(page).to have_field('guardian_email')
    expect(page).to have_field('guardian_title')
    expect(page).to have_field('guardian_first_name', type: 'text')
    expect(page).to have_field('guardian_middle_name', type: 'text')
    expect(page).to have_field('guardian_last_name', type: 'text')
    expect(page).to have_field('guardian_citizenship')
    expect(page).to have_field('guardian_relationship', type: 'text')
    expect(page).to have_field('guardian_phone_number', type: 'tel')
    expect(page).to have_field('user_address', type: 'text')
    expect(page).to have_field('guardian_address_line_2', type: 'text')
    expect(page).to have_field('guardian_city', type: 'text')
    expect(page).to have_field('guardian_postcode', type: 'text')
  end

  scenario 'user can edit guardian details' do
    guardian_fills_in_details
    click_on 'Save'
    # expect(page).to be('users/guardian_id/profile')
    expect(page).to have_content('My Guardians')
  end

  scenario 'user can upload a profile picture of guardian' do
    guardian_uploads_profile_picture
    click_on 'Save'
    # expect(page).to be('users/guardian_id/profile')
    expect(page).to have_content('My Guardians')
  end

  private

  def guardian_fills_in_details
    select "Mr", from: "guardian_title"
    fill_in 'guardian_email', with: 'test@example.com'
    fill_in 'guardian_first_name', with: 'John'
    fill_in 'guardian_last_name', with: 'Smith'
    select "French", from: "guardian_citizenship"
    fill_in 'guardian_relationship', with: 'Friend'
    fill_in 'guardian_phone_number', with: '07123 123123'
    fill_in 'user_address', with: '12 Example Road'
    fill_in 'guardian_address_line_2', with: 'New Example'
    fill_in 'guardian_city', with: 'Exampleville'
    fill_in 'guardian_postcode', with: 'EX14 MPL'
  end

  def guardian_uploads_profile_picture
    click_on 'Change Picture'
    attach_file 'guardian_profile_picture', 'spec/files/eu.png'
  end
end
