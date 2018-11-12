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
