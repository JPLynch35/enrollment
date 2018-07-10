require 'rails_helper'

describe 'a visitor' do
  describe 'visiting any student route' do
    it 'can use a nav bar to create a student from /students' do
      student_1 = Student.create(name: 'Bobby')
      student_2 = Student.create(name: 'Sally')

      visit students_path

      click_on 'Create a Student'

      expect(page).to have_content('Create a New Student!')
    end
    it 'can use a nav bar to create a student from /students/new' do
      student_1 = Student.create(name: 'Bobby')
      student_2 = Student.create(name: 'Sally')

      visit new_student_path

      click_on 'Create a Student'

      expect(page).to have_content('Create a New Student!')
    end
    it 'can use a nav bar to student index from /students/new' do
      student_1 = Student.create(name: 'Bobby')
      student_2 = Student.create(name: 'Sally')

      visit new_student_path

      click_on 'All Students'

      expect(page).to have_content(student_1.name)
      expect(page).to have_content(student_2.name)
    end
    it 'can use a nav bar to student index from /students/:id' do
      student_1 = Student.create(name: 'Bobby')
      student_2 = Student.create(name: 'Sally')

      visit student_path(student_1)

      click_on 'All Students'

      expect(page).to have_content(student_1.name)
      expect(page).to have_content(student_2.name)
    end
  end
end