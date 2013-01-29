<h1>Select a course:</h1>

<div id="course-list">
  {{#each course in controller.content}}
    {{#with course}}
      <div class="course-summary">
        <h2>{{#linkTo "course" course}}{{title}}{{/linkTo}}</h2>
        <div class="course-description">
          {{description}}
        </div>
        <div class="course-name">
          {{course_name}}
        </div>
        <div class="course-host">
          {{host}}
        </div>
      </div>
    {{/with}}
  {{/each}}
</div>

<div id="course-tools">
  <button {{action "coursesAddAction"}}>Add course</button>
</div>
