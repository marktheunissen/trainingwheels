<div class="course-user-info">
  <h2>Users</h2>
  {{#each user in controller}}
    {{#with user}}
      {{view "App.UserView"}}
    {{/with}}
  {{/each}}
</div>