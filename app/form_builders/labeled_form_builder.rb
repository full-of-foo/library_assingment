class LabeledFormBuilder < ActionView::Helpers::FormBuilder
  delegate :content_tag, :tag, to: :@template

  %w[text_field text_area password_field].each do |method_name|
    define_method(method_name) do |name, *args|
        options = default_field_options(*args)
        content_tag :div do
          push_div + field_label(name, options) + super(name, *args)
        end
      end
    end

  def submit(*args)
    content_tag :div, class: "col-lg-offset-4" do
      push_div("half-push") + super
    end
  end

  private

    def push_div(id = "small-push")
      content_tag :div, nil, id: id
    end

    def field_label(name, *args)
      options = default_label_options(args.extract_options![:label])
      label :p do
        content_tag(:span, (options[:name] || name), options)
      end
    end

    def default_field_options(options)
      options[:class] = "form-control"
      options
    end

    def default_label_options(*args)
      options         = args.extract_options!
      options[:class] = "text-info"
      options
    end

    def objectify_options(options)
      super.except(:label)
    end
end
