module AlterFormImages
  module FormBuilderMethods

    def image_fields_for(method, options={})
      options = default_opts_image_fields options
      #@template.content_tag :div, class: 'alter-image-block' do
      #  img_image_fields(options) + input_image_fields(options, method)
      #end
      render_image_fields method, options
    end

    private

    def is_new_record_object?(method)
      @object.send(method) && !@object.new_record?
    end

    def render_image_fields(method, options)
      @template.content_tag :div, class: 'alter-image-block' do
        is_new_record_object? ? render_new_img_fields(method, options) : render_edit_img_fields(method, options)
        input_image_fields(options, method)
      end
    end

    def render_new_img_fields(method, options)

    end

    def render_edit_img_fields(method, options)

    end

    def img_image_fields(options)
      @template.image_tag(options[:default_image], class: 'alter-image-preview', style: "width: #{options[:width]}px; height: #{options[:height]}px;")
    end

    def input_image_fields(options, method)
      @template.file_field_tag("#{@object_name}[#{method}]", class: 'alter-image-input')
    end

    def default_opts_image_fields(options)
      opts = {
          width: 100,
          height: 100,
          default_image: 'alter_default_image.png'
      }
      options.merge(opts)
    end

  end
end