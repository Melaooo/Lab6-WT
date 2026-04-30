ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  if html_tag =~ /<(input|textarea|select)/
    if html_tag =~ /class=/
      html_tag = html_tag.sub(/class="/, 'class="is-invalid ')
    else
      html_tag = html_tag.sub(/>/, ' class="is-invalid">')
    end
  end

  html_tag.html_safe
end