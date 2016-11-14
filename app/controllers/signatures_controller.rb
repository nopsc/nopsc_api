class SignaturesController < ApplicationController
  before_action :set_signature, only: [:show, :update, :destroy]
  before_action :restrict_access, only: [:to_csv]
  # GET /signatures
  def index
    @signatures = Signature.all.count + 279

    render json: @signatures
  end

  def to_csv
    @signatures = Signature.all

    respond_to do |format|
      format.csv { send_data @signatures.to_csv }
    end
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_signature
      @signature = Signature.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def signature_params
      params.require(:signature).permit(:zip, :name, :mail_opt_in, :email)
    end


  def restrict_access
      api_key = ApiKey.find_by_access_token(params[:access_token])
      head :unauthorized unless api_key
  end

end
