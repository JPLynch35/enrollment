require 'rails_helper'

describe 'a visitor' do
  describe 'visiting /students' do
    it 'can delete a student' do
      student_1 = Student.create(name: 'Bobby')
      student_2 = Student.create(name: 'Sally')

      visit students_path
      within '.student_Sally' do
        click_on 'Delete'
      end

      expect(page).to have_content(student_1.name)
      expect(page).to_not have_content(student_2.name)
    end
  end
end