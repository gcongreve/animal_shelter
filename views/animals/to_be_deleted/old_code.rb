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



FORM FOR ENTERING ANIMAL:



<form action="/animals/" method="post">

  <label for="name">Name: </label>
  <input id="name" type="text" name="name">
  <br>

  <label for="species">Species: </label><br>
  <input type="radio" name="species" value="Dog" checked> Dog<br>
  <input type="radio" name="species" value="Cat"> Cat<br>
  <input type="radio" name="species" value="Other"> Other<br>
  <br>
  <label for="type">Breed of Dog/Cat or species of animal: </label>
  <input id="type" type="text" name="type" value="Unknown">

  <br>
  <label for="date_admitted">Date Admitted: </label>
  <input id="date_admitted" type="date" name="date_admitted">

  <br>
  <label for="healthy">Animal is HEALTHY?</label>
  <select class="healthy" name="healthy">
    <option value="t">True</option>
    <option value="f">False</option>
  </select>

  <br>
  <label for="Trained">Animal is TRAINED?: </label>
  <select class="trained" name="trained">
    <option value="t">True</option>
    <option value="f">False</option>
  </select>
  <br>

  <input type="submit" value="Log Animal into Shelter">

</form>
<br><br><br>
<label for="species">Species: </label><br>
<input type="radio" name="species" value="Dog" <%= 'checked' if @animal.species == "Dog" %>> Dog <br>

<input type="radio" name="species" value="Cat" <%= 'checked' if @animal.species == "Cat" %>> Cat<br>

<input type="radio" name="species" value="Other" <%= 'checked' if @animal.species == "Other" %>> Other<br>
<br>
