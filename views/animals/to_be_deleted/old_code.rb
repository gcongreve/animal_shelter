<p>First Name: <%=@customer.first_name %></p>
<p>Last Name: <%=@customer.last_name %></p>
<p>Species Preference : <%= @customer.species_preference %></p>
<p>Type Preference : <%= @customer.type_preference %></p>
<p>Number of Adoptions: <%=@customer.number_of_adoptions %></p>


<p><%= @animal.name %></p>
<p><%= @animal.display_type %></p>
<p><%= @animal.date_admitted %></p>
<p>Healthy? :<%= @animal.healthy %></p>
<p>Trained? :<%= @animal.trained %></p>
<p>Adoptable? :<%= @animal.adoptable? %></p>
<br>
<br>


<p>First Name: <%= @customer.first_name %></p>
<p>Last Name: <%=@customer.last_name %></p>
<p>Preference: <%=@customer.display_preference %></p>
<p>Number of Adoptions: <%=@customer.number_of_adoptions %></p>
<br>


<h2>All the Animals currently in the shelter are:</h2>

<table>
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Date Admitted</th>
    <th>Healthy?</th>
    <th>Trained?</th>
    <th>Adoptable?</th>
    <th>Link to Animal</th>
  </tr>
  <% @animals.each do |animal| %>
  <% if animal.in_shelter? %>
  <tr>
    <td><%= animal.name %></td>
    <td><%= animal.display_type %></td>
    <td><%= animal.date_admitted %></td>
    <td><%= animal.healthy %></td>
    <td><%= animal.trained %></td>
    <td><%= animal.adoptable? %></td>
    <td><a href="/animals/<%= animal.id %>">link</a></td>
  </tr>
  <% end %>
  <% end %>
</table>
<br>
<br>
<br>
