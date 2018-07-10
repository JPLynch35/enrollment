require 'rails_helper'

describe 'a visitor' do
  describe 'visiting /students/:id/addresses/new' do
    it 'can view a page to create an address for a student' do
      student_1 = Student.create(name: 'Bobby')
      student_2 = Student.create(name: 'Sally')

      visit student_addresses_path(student_1)

      expect(page).to have_content('Create a New Address!')
    end
    it 'can fill in form and create an address for a student' do
      student_1 = Student.create(name: 'Bobby')
      student_2 = Student.create(name: 'Sally')

      visit student_addresses_path(student_1)

      fill_in :address_description, with: 'Lake House'
      fill_in :address_street, with: 'Pine Street'
      fill_in :address_city, with: 'Lake City'
      fill_in :address_state, with: 'Colorado'
      fill_in :address_zipcode, with: 07016
      click_on 'Create Address'

      expect(current_path).to eq(student_path(student_1))
      expect(page).to have_content('Lake House')
      expect(page).to have_content('Prine Street')
      expect(page).to have_content('Lake City')
      expect(page).to have_content('Colorado')
      expect(page).to have_content('07016')
    end
  end
end
