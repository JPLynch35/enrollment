require 'rails_helper'

describe 'a visitor' do
  describe 'visiting /students/new' do
    it 'can create a new student' do
      student_1 = Student.create(name: 'Bobby')
      student_2 = Student.create(name: 'Sally')
      
      visit new_student_path

      expect(page).to have_content('Create a New Student!')
    end
  end
end
