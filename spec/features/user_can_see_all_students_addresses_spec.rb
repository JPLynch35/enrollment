require 'rails_helper'

describe 'a visitor' do
  describe 'visiting /students/:id' do
    it 'can see all addresses for a student' do
      student_1 = Student.create(name: 'Bobby')
      student_2 = Student.create(name: 'Sally')

      visit new_student_address_path(student_1)

      fill_in :address_description, with: 'Lake House'
      fill_in :address_street, with: 'Pine Street'
      fill_in :address_city, with: 'Lake City'
      fill_in :address_state, with: 'Colorado'
      fill_in :address_zipcode, with: '17016'
      click_on 'Create Address'

      visit new_student_address_path(student_1)

      fill_in :address_description, with: 'Summer House'
      fill_in :address_street, with: 'Shore Street'
      fill_in :address_city, with: 'Beach City'
      fill_in :address_state, with: 'California'
      fill_in :address_zipcode, with: '20174'
      click_on 'Create Address'

      expect(current_path).to eq(student_path(student_1))
      expect(page).to have_content('Lake House')
      expect(page).to have_content('Pine Street')
      expect(page).to have_content('Lake City')
      expect(page).to have_content('Colorado')
      expect(page).to have_content('17016')

      expect(page).to have_content('Summer House')
      expect(page).to have_content('Shore Street')
      expect(page).to have_content('Beach City')
      expect(page).to have_content('California')
      expect(page).to have_content('20174')
    end
  end
end