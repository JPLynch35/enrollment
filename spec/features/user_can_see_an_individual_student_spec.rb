require 'rails_helper'

describe 'a visitor' do
  describe 'visiting /students/:id' do
    it 'will see the name of a student' do
      student = Student.create(name: 'Bobby')
      visit student_path(student)

      expect(page).to have_content(student.name)
    end
  end
end
