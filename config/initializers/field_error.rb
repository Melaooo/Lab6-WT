ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  if html_tag =~ /class="/
    html_tag.sub(/class="/, 'class="is-invalid ')
  else
    html_tag.sub(/>/, ' class="is-invalid">')
  end
end