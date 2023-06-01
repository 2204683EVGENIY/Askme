class QuestionSave
  attr_reader :question, :params

  def self.call(question:, params:)
    new(question: question, params: params).call
  end

  def initialize(question:, params:)
    @question = question
    @params = params
  end

  def call
    question.assign_attributes(params)

    question.transaction do
      question.save!

      question.hashtags =
        "#{question.body} #{question.answer}".
          downcase.
          scan(Hashtag::REGEXP).
          uniq.
          map { |ht| Hashtag.create_or_find_by!(text: ht.delete("#")) }

      true
    rescue ActiveRecord::RecordInvalid
      false
    end
  end
end
