module ApplicationHelper
  def errors_for(object)
    if object.errors.any?
      content_tag(:div, class: 'card border-danger') do
        concat(content_tag(:div, class: 'card-header bg-danger text-white') do
          concat 'Não foi possível salvar. Verifique os erro(s) e tente novamente'
        end)
        concat(content_tag(:ul, class: 'mb-0 list-group list-group-flush') do
          object.errors.full_messages.each do |msg|
            concat content_tag(:li, msg, class: 'list-group-item')
          end
        end)
      end
    end
end
end
