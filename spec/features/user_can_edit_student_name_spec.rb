require 'rails_helper'

describe 'a visitor' do
  describe 'visiting /student/:id/edit' do
    it 'can see a page to edit a new student' do
      student_1 = Student.create(name: 'Bobby')
      student_2 = Student.create(name: 'Sally')

      visit edit_student_path(student_2)

      expect(page).to have_content('Edit a Student!')
    end
    it 'can fill in form and edit a student name' do
      student_1 = Student.create(name: 'Bobby')
      student_2 = Student.create(name: 'Sally')

      visit edit_student_path(student_2)

      fill_in :student_name, with: 'Samantha'
      click_on 'Update Student'

      expect(current_path).to eq(student_path(student_2))
      expect(page).to have_content('Samantha')
    end
  end
end