# frozen_string_literal: true

# MembersControllerは、メンバーに関連するアクションを管理します。
class MembersController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def ses_points; end

  def interview_points; end

  def submit_tip; end
end
