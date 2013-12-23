class DataboxesController < ApplicationController
  before_action :set_databox, only: [:show, :edit, :update, :destroy]
	before_filter :authenticate_user!
  # GET /databoxes
  # GET /databoxes.json
  def index
    @databoxes = Databox.all
  end

  # GET /databoxes/1
  # GET /databoxes/1.json
  def show
    @databoxes = Databox.order(:name)
    @comment = @databox.comments.build
    @databox.comments.pop

    respond_to do |format|
      format.html
      format.csv { render text: @databoxes.to_csv }
    end
  end

  # GET /databoxes/new
  def new
    @databox = Databox.new
  end

  # GET /databoxes/1/edit
  def edit
  end

  # POST /databoxes
  # POST /databoxes.json
  def create
    @databox = Databox.new(databox_params)
		respond_to do |format|
      if @databox.save
        format.html { redirect_to @databox, notice: 'Databox was successfully created.' }
        format.json { render action: 'show', status: :created, location: @databox }
      else
        format.html { render action: 'new' }
        format.json { render json: @databox.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /databoxes/1
  # PATCH/PUT /databoxes/1.json
  def update
    respond_to do |format|
      if @databox.update(databox_params)
        format.html { redirect_to @databox, notice: 'Databox was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @databox.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /databoxes/1
  # DELETE /databoxes/1.json
  def destroy
    @databox.destroy
    respond_to do |format|
      format.html { redirect_to databoxes_url }
      format.json { head :no_content }
    end
  end

  def import
    Databox.import(params[:file])
    redirect_to root_url, notice: "Products imported."
  end

	def download_data
		send_file(Databox.find(params[:id]).data.file.path,
							:filename => Databox.find(params[:id]).data.file.filename)
	end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_databox
      @databox = Databox.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def databox_params
      params.require(:databox).permit(:title, :description, :data)
    end
end
