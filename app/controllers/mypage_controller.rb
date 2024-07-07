class MypageController < ApplicationController
  before_action :authenticate_user!
  
  def index
    # マイページのダッシュボード
    @recent_analyses = current_user.analyses.order(created_at: :desc).limit(5)
  end

  def history
    # 分析履歴の全リスト ページネーションを追加した後に.page(params[:page])を追記
    @analyses = current_user.analyses.order(created_at: :desc).page(params[:page])
  end
end
