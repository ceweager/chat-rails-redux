class Api::V1::MessagesController < ApplicationController
  before_action :find_channel, only: [:index]
  skip_before_action :authenticate_user!

  def index
    @messages = @channel.messages.order(created_at: :desc)
    render json: @messages
  end

  def create
  end

  private

  def find_channel
    @channel = Channel.find_by(name: params[:channel_id])
  end
end
