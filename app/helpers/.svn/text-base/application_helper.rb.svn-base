module ApplicationHelper
  require 'date'
  require 'time'

  def title(page_title)
    content_for(:title) { page_title }
  end

  def sortable(column, name = nil)
    name ||= column.titleize
    title = "Sort by #{name}"
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to name, params.merge(:sort => column, :direction => direction), {:title => title, :class => css_class}
  end

  def is_users_account(id)
    session[:user_id] == id ? true : false
  end

  def back_track(alum_id, back_to)
    link_to 'Back', back_to ? "/#{back_to}/index/#{alum_id}" : alumnis_path
  end

  def cancel_link(givn_path)
    link_to 'cancel', givn_path, :id => 'cancel_link_'+givn_path.gsub(/\//, ''), :class => 'btn'
  end

  def custom_form(alum, act)
    if (act == 'new')
      form_for(alum, :remote => true, :html => {:'data-type' => 'html', :id => act+'_alumni_form'})
    else
      form_for(alum, :id => act+'_alumni_form')
    end
  end

  def format_date_difference(thedate)
    unless thedate.nil?
      diff = ((Time.now - thedate) / 60)
      if diff < 1
        "Less than a minute"
      elsif diff < 60
        diff.to_i.to_s + " minute"+(diff < 2 ? "" : "s")
      elsif (diff / 60).to_i <= 48
        (diff / 60).to_i.to_s + " hour"+((diff / 60).to_i < 2 ? "" : "s")
      elsif ((diff / 60).to_i / 24) > 365
        (((diff / 60).to_i / 24) / 365).to_s + " year(s)"
      else
        ((diff / 60).to_i / 24).to_s + " days"
      end
    else
      "Never"
    end
  end

  def build_search_options(searched)
    select_options = ["name", "email", "address", "phone", "program", "graduation date"]
    select_options.delete_if { |t| t == searched }
    if searched
      select_tag :cat, options_for_select([[searched.capitalize, searched]] + select_options.collect { |t| [t.capitalize, t] })
    else
      select_tag :cat, options_for_select(select_options.collect { |t| [t.capitalize, t] })
    end

  end

  #Used by _form files
  def mark_required(field)
    content_tag(:span, field) +
        content_tag(:span, " ( required )", :class => "txt-required")
  end

  def link_to_void(txt, *args)
    link_to(txt.html_safe, 'javascript:void(0);', *args)
  end

  def header
    content_tag(:div, :class => 'header') do
      raw render(:partial => '/partials/header')
    end
  end

  def content(title='', &block)
    content_tag(:div, :class => 'colorful gray') do
      concat(self.header)
      concat(content_tag(:div, :class => 'content') { concat(content_tag(:h2, title)); concat(capture(&block)) })
    end
  end

  def show_error_messages(record)
    if record.errors.any?
      content_tag(:div, :class => 'colorful blue') do
        concat(content_tag(:div, :class => 'header') do
          pluralize(record.errors.count, "error")
        end)
        concat(content_tag(:div, :class => 'content') do
          content_tag(:ul) do
            record.errors.full_messages.each do |msg|
              concat(content_tag(:li, msg))
            end
          end
        end)
      end
    end
  end

end
