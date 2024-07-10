class QuizzesController < ApplicationController
    before_action :authenticate_user!

    def show
      @questions = Question.order("RANDOM()").limit(10)
    end
  
    def submit
      # params[:answers]がnilまたは空の場合はエラーメッセージを表示して処理を中断
      if params[:answers].blank?
        flash[:alert] = "回答が提出されていません。"
        redirect_to ses_quiz_path # 適切なパスにリダイレクト
        return # メソッドから抜ける
      end
    
      @score = 0
      answers = params.require(:answers).permit!.to_h
      @total = answers.count
      answers.each do |question_id, answer|
        question = Question.find(question_id)
        if question.correct_answer.to_s == answer
          @score += 1
        end
      end
      @percentage = @total.zero? ? 0 : (@score.to_f / @total * 100).round(2)
      
      render :result
    end
end
