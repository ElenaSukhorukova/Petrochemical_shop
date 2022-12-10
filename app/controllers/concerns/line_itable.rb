module LineItable
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_user!
    before_action :define_line_item!, only: %i[edit update destroy]
  end

  def create
    @line_item = @source.line_items.build(line_item_params)
    @line_item.sum = @line_item.quantity * @line_item.price
  
    if @line_item.save
      redirect_to source_path(@line_item.source_id)
    else
      redirect_to source_path(@line_item.source_id), 
        danger: "#{@line_item.errors.full_messages.each{|error| error.capitalize}.join(' ')}"
    end
  end

  def edit
  end

  def update
    if @line_item.update(line_item_params)
      redirect_to source_path(@line_item.source_id)
    else
      redirect_to source_path(@line_item.source_id), 
        danger: "#{@line_item.errors.full_messages.each{|error| error.capitalize}.join(' ')}"
    end
  end
  
  def destroy
    if @line_item.destroy
      redirect_to source_path(@line_item.source_id)
    end
  end
  
  private

    def define_line_item!
      @line_item = LineItem.find(params[:id])
    end

    def line_item_params
      params.require(:line_item).permit(:product_id, :quantity, :price, :container_id, :unit)
    end
end
