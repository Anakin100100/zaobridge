# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:landing]
  def index; end

  def landing; end
end
