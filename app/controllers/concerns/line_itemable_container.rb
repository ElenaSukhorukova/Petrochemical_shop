module LineItemableContainer
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_user!
    before_action :define_line_item!, only: %i[edit update destroy]
  end

  def create
    @line_item_container = @source.line_item_containers.build(line_item_container_params)
    
    if @line_item_container.save
      redirect_to source_path(@line_item_container.source_id)
    else
      redirect_to source_path(@line_item.source_id), 
        danger: "#{@line_item_container.errors.full_messages.each{|error| error.capitalize}.join(' ')}"
    end
  end

  def edit
  end

  def update
    if @line_item_container.update(line_item_container_params)
      redirect_to source_path(@line_item_container.source_id)
    else
      redirect_to source_path(@line_item.source_id), 
        danger: "#{@line_item_container.errors.full_messages.each{|error| error.capitalize}.join(' ')}"
    end
  end
  
  def destroy
    if @line_item_container.destroy
      redirect_to source_path(@line_item_container.source_id)
    end
  end
  
  private

    def define_line_item!
      @line_item_container = LineItemContainer.find(params[:id])
    end

    def line_item_container_params
      params.require(:line_item_container).permit(:quantity, :price, :container_id, :unit)
    end
end
