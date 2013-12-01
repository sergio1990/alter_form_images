module AlterFormImages
  module FormBuilderMethods

    def image_fields_for(method, options={})
      options = default_opts_image_fields options
      @template.content_tag :div, class: 'alter-image-block' do
        img_image_fields(options) + input_image_fields(options, method)
      end
    end

    private

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