module QuestionsHelper
  def question_author(question)
    return "Aвтор - Вы" if question.author == current_user && question.author.present?
    return link_to "@#{question.author.nickname}", user_path(question.author_id) if question.author.present?
    return "Таинственная персона"
  end
end
