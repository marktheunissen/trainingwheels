<div class="user">
  <a href="#" {{action "showUser" user target="App.usersController"}}><h2>{{user_name}}</h2></a>
  <div>Password: {{password}}</div>
  <div>Logged in: {{#if logged_in}}yes{{else}}no{{/if}}</div>
</div>
