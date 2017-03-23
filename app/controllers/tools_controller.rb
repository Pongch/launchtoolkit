class ToolsController < ApplicationController
  before_action :set_tool, only: [:show, :edit, :update, :destroy]

  # GET /tools
  # GET /tools.json
  def index
    if params[:category].blank?
      @tools = Tool.all.order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @tools = Tool.where(:category_id => @category_id).order("created_at DESC")
    end
  end

  # GET /tools/1
  # GET /tools/1.json
  def show
  end
  
  def home
    if params[:category].blank?
      @tools = Tool.all.order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @tools = Tool.where(:category_id => @category_id).order("created_at DESC")
    end
  end

  # GET /tools/new
  def new
    @tool = Tool.new
    @categories = Category.all.map{ |c| [c.name, c.id] }
  end

  # GET /tools/1/edit
  def edit
    @categories = Category.all.map{ |c| [c.name, c.id] }
  end

  # POST /tools
  # POST /tools.json
  def create
    @tool = Tool.new(tool_params)
    @tool.category_id = params[:category_id]

    respond_to do |format|
      if @tool.save
        format.html { redirect_to @tool, notice: 'Tool was successfully created.' }
        format.json { render :show, status: :created, location: @tool }
      else
        format.html { render :new }
        format.json { render json: @tool.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tools/1
  # PATCH/PUT /tools/1.json
  def update
    @tool.category_id = params[:category_id]
    respond_to do |format|
      if @tool.update(tool_params)
        format.html { redirect_to @tool, notice: 'Tool was successfully updated.' }
        format.json { render :show, status: :ok, location: @tool }
      else
        format.html { render :edit }
        format.json { render json: @tool.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tools/1
  # DELETE /tools/1.json
  def destroy
    @tool.destroy
    respond_to do |format|
      format.html { redirect_to tools_url, notice: 'Tool was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tool
      @tool = Tool.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tool_params
      params.require(:tool).permit(:title, :description, :link, :category_id)
    end
end
