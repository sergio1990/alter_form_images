module AlterFormImages
  module FormBuilderMethods

    def image_fields_for(method, options={})
      options = default_opts_image_fields options
      render_image_fields method, options
    end

    private

    def is_new_record_object?(method)
      @object.new_record? || @object.send(method).nil?
    end

    def render_image_fields(method, options)
      @template.content_tag :div, class: 'alter-image-block' do
        img_image_fields(method, options) + input_image_fields(method, options)
      end
    end

    def img_image_fields(method, options)
      @template.image_tag(preview_img_url(method, options, is_new_record_object?(method)), class: 'alter-image-preview', style: create_img_styles(options))
    end

    def preview_img_url(method, options, is_new_record)
      is_new_record ? options[:default_image] : @object.send(method).url(options[:preview_style])
    end

    def input_image_fields(method, options)
      @template.file_field_tag("#{@object_name}[#{method}]", class: 'alter-image-input')
    end

    def create_img_styles(options)
      "width: #{options[:width]}px; height: #{options[:height]}px;"
    end

    def default_opts_image_fields(options)
      opts = {
          width: 100,
          height: 100,
          default_image: 'alter_default_image.png',
          preview_style: :original
      }
      options.merge(opts)
    end

  end
end