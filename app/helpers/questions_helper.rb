module QuestionsHelper
  def text_with_hashtags(text)
    strip_tags(text).gsub(Hashtag::REGEXP) do |ht|
      link_to ht, hashtag_path(ht.delete("#").downcase)
    end
  end

  def question_author(question)
    return "Таинственная персона" unless question.author.present?

    if question.author == current_user
      "Aвтор - Вы"
    else
      link_to "@#{question.author.nickname}", user_path(question.author.nickname)
    end
  end
end
