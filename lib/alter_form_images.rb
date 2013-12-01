require "alter_form_images/version"
require "alter_form_images/engine"

module AlterFormImages
  autoload :FormBuilderMethods, 'alter_form_images/form_builder_methods'
end

ActionView::Helpers::FormBuilder.instance_eval do
  include AlterFormImages::FormBuilderMethods
end