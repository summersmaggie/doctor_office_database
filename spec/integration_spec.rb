require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new doctor', {:type => :feature}) do
  it('allows a user to add a new doctor') do
    visit('/')
    click_link('Add New Doctor')
    fill_in('name', :with =>'Hoyt')
    fill_in('speciality', :with =>'general medicine')
    click_button('Add Doctor')
    expect(page).to have_content('Success!')
  end
    it('allows a user to see all doctors') do
      doctors = Doctor.new({:name => 'Hoyt', :speciality => 'general practice', :id => nil})
      doctors.save()
      visit('/')
      click_link('View All Doctors')
      expect(page).to have_content(doctors.name)
    end
end
