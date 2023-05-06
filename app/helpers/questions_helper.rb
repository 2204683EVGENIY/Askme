module QuestionsHelper
  def question_author(question)
    return "Таинственная персона" unless question.author.present?

    if question.author == current_user && question.author.present?
      "Aвтор - Вы"
    else
      link_to "@#{question.author.nickname}", user_path(question.author_id)
    end
  end
end
