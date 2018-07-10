require 'rails_helper'

describe 'a visitor' do
  describe 'visiting /courses/:id' do
    it 'can see a course show page' do
      student_1 = Student.create(name: 'Bobby')
      course_1 = student_1.courses.create(title: 'Math')

      visit course_path(course_1)


      expect(page).to have_content(course_1.title)
    end
    it 'can see a list of all students in the course' do
      student_1 = Student.create(name: 'Bobby')
      student_2 = Student.create(name: 'Sally')
      student_3 = Student.create(name: 'Tony')
      student_4 = Student.create(name: 'George')
      course_1 = student_1.courses.create(title: 'Math')
      StudentCourse.create(student_id: student_2.id, course_id: course_1.id)
      StudentCourse.create(student_id: student_3.id, course_id: course_1.id)

      visit course_path(course_1)

      expect(page).to have_content(student_1.name)
      expect(page).to have_content(student_2.name)
      expect(page).to have_content(student_3.name)
      expect(page).to_not have_content(student_4.name)
    end
  end
end
