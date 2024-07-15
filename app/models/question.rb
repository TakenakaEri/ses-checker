# frozen_string_literal: true

class Question < ApplicationRecord
  validates :content, presence: true
  # inclusionバリデーションで[true, false] の配列を指定してbooleanを指定する
  validates :correct_answer, inclusion: { in: [true, false] }
end
