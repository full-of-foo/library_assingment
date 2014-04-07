class PurchasePresenter < BasePresenter
  presents :purchase

  def completion_header
    content_tag :h2 do
      concat content_tag(:span, "Thanks, you paid ")
      concat content_tag(:span, price_attribute(purchase.total_cost))
      concat content_tag(:span, "!")
    end
  end

  def redirect_script
    javascript_tag redirect_js_str
  end


  private

    def redirect_js_str
      "$(function () {
        redirect = function() {
          window.location = '/books';
        }
        setTimeout(redirect, 2300);
      })();"
    end

end
