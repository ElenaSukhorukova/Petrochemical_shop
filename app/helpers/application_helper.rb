module ApplicationHelper
  def i18n_model_name(model, count: 1)
    model.model_name.human(count: count)
  end

  def attribute_model(model, attr)
    model.class.human_attribute_name(attr)
  end

  def full_title(page_title = '')
    base_title = t('page.site_name')
    page_title ? "#{page_title} | #{base_title}" : "#{base_title}"
  end

  def currently_at(current_page = '')
    render partial: 'shared/menu', locals: { current_page: current_page }
    render partial: "shared/#{define_menu.to_s}", locals: { current_page: current_page } if user_signed_in?
  end

  def nav_tab(title, url, options = {})
    current_page = options.delete :current_page
    css_text = current_page == title ? 'wheat-text' : 'white-text'
    options[:class] = options[:class] ? (options[:class] + ' ' + css_text) : 
                                        css_text
    link_to title, url, options
  end

  def nav_tab_right(title, url, options = {})
    current_page = options.delete :current_page
    css_text = current_page == title ? 'blue-text' : 'black-text'
    options[:class] = options[:class] ? (options[:class] + ' ' + css_text) : 
                                        css_text
    link_to title, url, options
  end

  def define_menu
    @menus = { 'admin' => :admin_menu, 'supply manager' => :supply_menu }

    if user_signed_in?
      @menus[current_user.role]
    end
  end
end
