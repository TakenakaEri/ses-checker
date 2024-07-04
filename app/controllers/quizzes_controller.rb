class QuizzesController < ApplicationController
    before_action :authenticate_user!

    def show
      # クイズ画面のロジックをここに記述
    end
end
