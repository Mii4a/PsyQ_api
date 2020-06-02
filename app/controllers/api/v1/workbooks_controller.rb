# frozen_string_literal: true

class Api::V1::WorkbooksController < ApplicationController
  before_action :set_workbook, only: %i[show update destroy]

  # GET /workbooks
  # GET /workbooks.json
  def index
    @workbooks = Workbook.all
    render json: @workbooks
  end

  # GET /workbooks/1
  # GET /workbooks/1.json
  def show
    @workbook = Workbook.find(params[:id])
    @questions = @workbook.questions.all
    @answers = @questions.map {|question| question.answers}.flatten
    render json: {
      workbook: @workbook,
      questions: @questions,
      answers: @answers
    }
  end

  # POST /workbooks
  # POST /workbooks.json
  def create
    @workbook = Workbook.new(workbook_params)
    if @workbook.save
      render json: @workbook, status: :created
    else
      render json: @workbook.errors
    end
  end

  # PATCH/PUT /workbooks/1
  # PATCH/PUT /workbooks/1.json
  def update
    if @workbook.update(workbook_params)
      render @workbook, status: :ok
    else
      render json: @workbook.errors, status: :unprocessable_entity
    end
  end

  # DELETE /workbooks/1
  # DELETE /workbooks/1.json
  def destroy
    @workbook.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_workbook
    @workbook = Workbook.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def workbook_params
    params.require(:workbook).permit(:subject_name, :subject_explanation, :subject_image)
  end

  def encode_base64(image_file)
    image = Base64.encode64(image_file.download) # 画像ファイルをActive Storageでダウンロードし、エンコードする
    blob = ActiveStorage::Blob.find(image_file[:id]) # Blobを作成
    "data:#{blob[:content_type]};base64,#{image}" # Vue側でそのまま画像として読み込み出来るBase64文字列にして返す
  end

  def admin_user
    render status: :unauthorized unless current_user.is_admin
  end
end
