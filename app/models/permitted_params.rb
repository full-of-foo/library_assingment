class PermittedParams < Struct.new(:params, :user)

  %w[user address signup].each do |model_name|
    define_method(model_name) do
      params.require(:"#{model_name}").permit!
    end
  end

end
