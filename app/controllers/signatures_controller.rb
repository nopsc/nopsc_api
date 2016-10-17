class SignaturesController < ApplicationController
  before_action :set_signature, only: [:show, :update, :destroy]

  # GET /signatures
  def index
    @signatures = Signature.all.count

    render json: @signatures
  end

  # GET /signatures/1
  def show
    render json: @signature
  end

  # POST /signatures
  def create
    @signature = Signature.new(signature_params)

    if @signature.save
      if @signature.mail_opt_in
        mail_subscriber = MailSubscriber.new(email: @signature.email)
        mail_subscriber.save
      end

      render json: @signature, status: :created, location: @signature
    else
      render json: @signature.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /signatures/1
  def update
    if @signature.update(signature_params)
      render json: @signature
    else
      render json: @signature.errors, status: :unprocessable_entity
    end
  end

  # DELETE /signatures/1
  def destroy
    @signature.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_signature
      @signature = Signature.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def signature_params
      params.require(:signature).permit(:zip, :name, :mail_opt_in, :email)
    end
end
