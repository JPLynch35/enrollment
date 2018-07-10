require 'rails_helper'

describe 'a visitor' do
  describe 'visiting /students/new' do
    it 'can see a page to create a new student' do
      visit new_student_path

      expect(page).to have_content('Create a New Student!')
    end
    it 'can fill in form and create a new student' do
      student_1 = Student.create(name: 'Bobby')
      student_2 = Student.create(name: 'Sally')
      
      visit new_student_path

      fill_in :student_name, with: 'Harold'
      click_on 'Create Student'

      expect(current_path).to eq(student_path(Student.find_by(name: 'Harold')))
      expect(page).to have_content('Harold')
    end
  end
end
