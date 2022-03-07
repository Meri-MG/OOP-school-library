# frozen_string_literal: true

require_relative './student'

class Classroom
  attr_accessor :label, :students

  def initialize(label: 'unknown')
    @label = label
    @students = []
  end

  def add_student(student)
    @students << student
    student.classroom = self unless student.classroom == self
  end
end
