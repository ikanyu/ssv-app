# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

# ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
#   if instance.error_message.kind_of?(Array)
#     %(#{html_tag}<span class="validation-error">&nbsp;
#       #{instance.error_message.join(',')}</span>).html_safe
#   else
#     %(#{html_tag}<span class="validation-error">&nbsp;
#       #{instance.error_message}</span>).html_safe
#   end
# end

ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  html = %(<div class="field_with_errors">#{html_tag}</div>).html_safe
  # add nokogiri gem to Gemfile

  form_fields = [
    'textarea',
    'input',
    'select'
  ]

  elements = Nokogiri::HTML::DocumentFragment.parse(html_tag).css "label, " + form_fields.join(', ')

  elements.each do |e|
    if e.node_name.eql? 'label'
      html = %(<div class="control-group error">#{e}</div>).html_safe
    elsif form_fields.include? e.node_name
      if instance.error_message.kind_of?(Array)
        html = %(<div class="control-group error">#{html_tag}<span class="help-inline">&nbsp;#{instance.error_message.uniq.join(', ')}</span></div>).html_safe
      else
        html = %(<div class="control-group error">#{html_tag}<span class="help-inline">&nbsp;#{instance.error_message}</span></div>).html_safe
      end
    end
  end
  html
end