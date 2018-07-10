require 'rails_helper'

describe 'a visitor' do
  describe 'visiting /students' do
    it 'will see a list of all the students' do
      student_1 = Student.create(name: 'Bobby')
      student_2 = Student.create(name: 'Sally')
      
      visit students_path

      expect(page).to have_content(student_1.name)
      expect(page).to have_content(student_2.name)
    end
  end
end
