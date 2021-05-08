Potentially use the "fields_for" helper for the form used to crreate a nuew study
to fill the subtitles hash.

Example:

<%= form_for @study do |f| %>
  <% f.label :title %>
  <% f.text_field :title %>
  <% f.label :semester %>
  <% f.text_field :semester %>
  <% f.label :year %>
  <% f.text_field :year %>
  <% f.label :number %>
  <% f.text_field :number %>
  <% f.label :bilbical_base %>
  <% f.text_field :bilbical_base %>
  
  <%= f.fields_for :outline do |outline_form| %>
    <li>
      <%= outline_form.label :subtitle %>
      <%= outline_form.text_field :subtitle %>

      <%= outline_form.fields_for :point do |point| %>
        <%= point.label :description %>
        <%= point.text_field :description %>

        <%= point.fields_for :note do |note| %>
          <%= note.label :description %>
          <%= note.text_area :description %>
        <% end %>
      <% end %>
    </li>
  <% end %>
<% end %>

  

Make the :subtitles attribute a nested attribute:

class Study < ActiveRecord::Base
    has_many :subtitles
    accepts+_nested_attributes_for :subtitles
end


