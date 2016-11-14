class MailSubscribersController < ApplicationController
  before_action :set_mail_subscriber, only: [:show, :update, :destroy]

  # POST /mail_subscribers
  def create
    @mail_subscriber = MailSubscriber.new(mail_subscriber_params)

    if @mail_subscriber.save
      render json: @mail_subscriber, status: :created, location: @mail_subscriber
    else
      render json: @mail_subscriber.errors, status: :unprocessable_entity
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mail_subscriber
      @mail_subscriber = MailSubscriber.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def mail_subscriber_params
      params.require(:mail_subscriber).permit(:email)
    end
end
