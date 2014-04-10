class BasePresenter

  def initialize(object, template)
    @object = object
    @template = template
  end

  def show_title(proceeding_text, content)
    content_tag :h3, "#{proceeding_text} #{content}"
  end

  def detail_label(label)
    content_tag :span, label, class: "text-info"
  end

  def detail_content(content, has_format_date = nil)
    content = content.strftime("%d/%m/%Y") if has_format_date
    content_tag :p, content
  end

  def attribute_label(attribute_string)
    detail_label attribute_string.split("_").map(&:capitalize).join(" ")
  end

  def attribute_content(attribute_string)
    content = attribute_string.split(".").inject(@object, :send)

    detail_content content
  end

  def table_header(id = "", value)
    content_tag :th, value, id: id
  end


  private

    def self.presents(name)
      define_method(name) do
        @object
      end
    end

    def h
      @template
    end

    def price_attribute(amount)
      number_to_currency(amount, unit: "€")
    end

    def method_missing(*args, &block)
      @template.send(*args, &block)
    end

end
