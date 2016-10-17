class MailSubscribersController < ApplicationController
  before_action :set_mail_subscriber, only: [:show, :update, :destroy]

  # GET /mail_subscribers
  def index
    @mail_subscribers = MailSubscriber.all

    render json: @mail_subscribers
  end

  # GET /mail_subscribers/1
  def show
    render json: @mail_subscriber
  end

  # POST /mail_subscribers
  def create
    @mail_subscriber = MailSubscriber.new(mail_subscriber_params)

    if @mail_subscriber.save
      render json: @mail_subscriber, status: :created, location: @mail_subscriber
    else
      render json: @mail_subscriber.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /mail_subscribers/1
  def update
    if @mail_subscriber.update(mail_subscriber_params)
      render json: @mail_subscriber
    else
      render json: @mail_subscriber.errors, status: :unprocessable_entity
    end
  end

  # DELETE /mail_subscribers/1
  def destroy
    @mail_subscriber.destroy
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
