module AlterFormImages
  module FormBuilderMethods

    def image_fields_for(method)
      @template.content_tag :div, class: 'alter-image-block' do
        @template.image_tag('img.jpg', class: 'alter-image-preview') +
        @template.file_field_tag("#{@object_name}[#{method}]", class: 'alter-image-input')
      end
    end

  end
end