require 'rails_helper'

feature 'Child Edit Page', js: false do
  let(:user) { FactoryGirl.create(:user) }
  # let(:child) { FactoryGirl.create(:assignee, :child, association(:user)) }


  before do
    login_as(user, :scope => :user)
    @child = FactoryGirl.create(:assignee, :child, user: user)
    visit "/users/#{user.id}/assignees/#{@child.id}/edit"
  end

  it 'can be reached' do
    expect(page.status_code).to eq(200)
  end

  it 'has a profile picture upload field' do
    expect(page).to have_field('recipient_profile_picture', type: 'file')
  end

  it 'type is recipient' do
    expect(find('#set_assignee_type', :visible => false).value).to eq('Recipient')
  end

  it 'relationship is child' do
    expect(find('#recipient_relationship', :visible => false).value).to eq('Child')
  end

  it 'has relevant fields' do
    expect(page).to have_field('recipient_email')
    expect(page).to have_field('recipient_title')
    expect(page).to have_field('recipient_first_name', type: 'text')
    expect(page).to have_field('recipient_middle_name', type: 'text')
    expect(page).to have_field('recipient_last_name', type: 'text')
    expect(page).to have_field('recipient_citizenship')
    expect(page).to have_field('recipient_date_of_birth', type: 'date')
    expect(page).to have_field('recipient_phone_number', type: 'tel')
    expect(page).to have_field('user_address', type: 'text')
    expect(page).to have_field('recipient_address_line_2', type: 'text')
    expect(page).to have_field('recipient_city', type: 'text')
    expect(page).to have_field('recipient_postcode', type: 'text')
  end

  scenario 'user can edit child details' do
    recipient_fills_in_details
    click_on 'Save'
    # expect(page).to be('users/recipient_id/profile')
    expect(page).to have_content('My Children')
  end

  scenario 'user can upload a profile picture of child' do
    recipient_uploads_profile_picture
    click_on 'Save'
    # expect(page).to be('users/recipient_id/profile')
    expect(page).to have_content('My Children')
  end

  private

  def recipient_fills_in_details
    select "Mr", from: "recipient_title"
    fill_in 'recipient_email', with: 'test@example.com'
    fill_in 'recipient_first_name', with: 'John'
    fill_in 'recipient_last_name', with: 'Smith'
    select "French", from: "recipient_citizenship"
    fill_in 'recipient_date_of_birth', with: '31/07/1980'
    fill_in 'recipient_phone_number', with: '07123 123123'
    fill_in 'user_address', with: '12 Example Road'
    fill_in 'recipient_address_line_2', with: 'New Example'
    fill_in 'recipient_city', with: 'Exampleville'
    fill_in 'recipient_postcode', with: 'EX14 MPL'
    fill_in 'recipient_date_of_birth', with: '31/07/1980'
  end

  def recipient_uploads_profile_picture
    click_on 'Change Picture'
    attach_file 'recipient_profile_picture', 'spec/files/eu.png'
  end
end
