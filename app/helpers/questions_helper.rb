module QuestionsHelper
  def question_author(question)
    if question.author == current_user && question.author.present?
      "Aвтор - Вы"
    elsif question.author.present?
      link_to "@#{question.author.nickname}", user_path(question.author_id)
    else
      "Таинственная персона"
    end
  end
end
