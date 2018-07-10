require 'rails_helper'

describe 'a visitor' do
  describe 'visiting /students/:id' do
    it 'can see a list of all courses the student is taking' do
      student_1 = Student.create(name: 'Bobby')
      student_2 = Student.create(name: 'Sally')
      course_1 = student_1.courses.create(title: 'Math')
      course_2 = student_1.courses.create(title: 'Science')

      visit student_path(student_1)

      expect(page).to have_content(student_1.name)
      expect(page).to have_content(course_1.title)
      expect(page).to have_content(course_2.title)
    end
  end
end
