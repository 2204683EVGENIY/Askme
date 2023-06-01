class HashtagsController < ApplicationController
  def show
    hashtag = Hashtag.with_questions.find_by!(text: params[:text].downcase)
    @questions = hashtag.questions.includes(:user, :author)
  end
end
