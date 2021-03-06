class DrinksController < ApplicationController
  before_action :set_drink, only: [:edit, :update, :destroy]

  # GET /drinks
  # GET /drinks.json
  def index
    @bar = Bar.find(params[:bar_id])
    @drinks = @bar.drinks.all
  end

  # GET /drinks/1
  # GET /drinks/1.json
  def show
    @bar = Bar.find(params[:bar_id])
    @drink = @bar.drinks.find(params[:id])
    @order = Order.last
  end

  # GET /drinks/new
  def new
    @bar = Bar.find(params[:bar_id])
    @drink = @bar.drinks.new
  end

  # GET /drinks/1/edit
  def edit
  end

  # POST /drinks
  # POST /drinks.json
  def create
    @bar = Bar.find(params[:bar_id])
    @drink = @bar.drinks.new(drink_params)
    @order = @bar.orders.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to bar_drink_path }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
    # respond_to do |format|
    #   if @drink.save
    #     format.html { redirect_to bar_drinks_path, notice: 'Drink was successfully created.' }
    #     format.json { render :show, status: :created, location: @drink }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @drink.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /drinks/1
  # PATCH/PUT /drinks/1.json
  def update
    respond_to do |format|
      if @drink.update(drink_params)
        format.html { redirect_to @drink, notice: 'Drink was successfully updated.' }
        format.json { render :show, status: :ok, location: @drink }
      else
        format.html { render :edit }
        format.json { render json: @drink.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drinks/1
  # DELETE /drinks/1.json
  def destroy
    @drink.destroy
    respond_to do |format|
      format.html { redirect_to bar_drinks_path, notice: 'Drink was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drink
      @drink = Drink.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def drink_params
      params.require(:drink).permit(:name, :description, :price, :image)
    end
end
