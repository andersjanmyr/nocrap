if Rails.env.development?
ActionView::Helpers::AssetTagHelper.register_javascript_expansion   :jquery => %w(jquery jquery-ui rails)
else
ActionView::Helpers::AssetTagHelper.register_javascript_expansion   :jquery => %w(jquery.min jquery-ui.min rails)
end
