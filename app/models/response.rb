# == Schema Information
#
# Table name: responses
#
#  id                     :bigint(8)        not null, primary key
#  answer                 :text
#  question_id            :bigint(8)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  file_file_name         :string
#  file_content_type      :string
#  file_file_size         :integer
#  file_updated_at        :datetime
#  student_application_id :bigint(8)
#

class Response < ActiveRecord::Base
  belongs_to :question

  # Optional so that response can be saved at the same time as the application
  belongs_to :student_application, optional: true

  has_attached_file :file

  # Generally unsafe but we will validate in student_application.rb
  do_not_validate_attachment_file_type :file

  # Validations for responses (length, required answers, file size) are done in the student application
  validates :question_id, presence: true

  def validate_short_text(errors)
    q = self.question
    if q.input_type == "email"
      unless self.answer =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
        errors.add("'#{self.answer}'", "is not a valid email")
      end
    elsif q.input_type == "phone"
      unless self.answer =~ /\A(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}\z/
        errors.add("'#{self.answer}'", "is not a valid phone number")
      end
    end
  end

  def validate_long_text(errors)
    q = self.question
    if self.answer.split.size > q.word_limit && q.word_limit > 0
      errors.add(q.tag, "is too long, max is #{q.word_limit} words")
    end
  end

  def validate_attachment(errors)
    q = self.question
    if self.file_file_size # check if file exists, can't use file to check this because of default file
      if self.file_file_size > (q.file_size_limit * 1000000) && q.file_size_limit > 0
        errors.add(q.title, "is too large, limit is #{q.file_size_limit} Megabytes")
      end
      if self.file_content_type != "application/pdf"
        errors.add(q.title, "must be a PDF")
      end
    elsif attachment_required(q)
      errors.add(q.title, "is missing")
    end
  end

  def validate_response(errors)
    q = self.question
    # Validate required questions
    if q.required && self.answer && self.answer.empty?
      errors.add(q.tag, "can't be left blank")
    end

    case q.question_type
    when "short_text"
      self.validate_short_text errors
    when "long_text"
      self.validate_long_text errors
    when "attachment"
      self.validate_attachment errors
    end
  end

  def attachment_required(q)
    # TODO: Replace this later. this is temporary because some designers submitted aplications without portfolios
    q.required
    #q.required || q.tag == "design_portfolio" && student_application.response_to("application_type").downcase.include?("designer")
  end
end
