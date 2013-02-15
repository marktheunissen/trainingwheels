<div id="course-form">
  <form>
    <div id="course-form-info" class="course-section active">
      <div id="course-form-info-title" class="course-form-title">Course Info</div>

      <div class="course-fields">
        <div {{bindAttr class="css_class_title"}}>
          Title
          {{view Ember.TextField placeholder="Course title" size="30" viewName="titleTextField" valueBinding="title"}}
          <ul id="title-errors" class="errors">
            {{#each error in controller.titleErrors}}
            <li class="error">{{error}}</li>
            {{/each}}
          </ul>
        </div>
        <div class="field"><span>Description</span> {{view Ember.TextArea placeholder="Describe course" rows="5" cols="30" viewName="descriptionTextField" valueBinding="description"}}</div>
        <div {{bindAttr class="css_class_short_name"}}>
          Short name
          {{view Ember.TextField required="required" placeholder="Contains only letters and underscores" size="30" valueBinding="courseName"}}
          <ul id="short-name-errors" class="errors">
            {{#each error in controller.courseNameErrors}}
            <li class="error">{{error}}</li>
            {{/each}}
          </ul>
        </div>
        <div class="field">Type        {{view Ember.TextField placeholder="drupal" size="30" viewName="typeTextField" valueBinding="courseType"}}</div>
        <div class="field">Environment {{view Ember.TextField value="ubuntu" size="30" viewName="environmentTextField" valueBinding="envType"}}</div>
      </div>
    </div>

    <div id="course-form-add-plugins" class="course-section">
      <div id="course-form-add-plugins-title" class="course-form-title">Add Plug-ins</div>
    </div>

    <div id="course-form-config-plugins" class="course-section">
      <div id="course-form-config-plugins-title" class="course-form-title">Configure Plug-ins</div>
    </div>

    <div id="course-form-resources" class="course-section">
      <div id="course-form-resources-title" class="course-form-title">Add Resources</div>
    </div>

    <div id="course-form-connection" class="course-section">
      <div id="course-form-connection-title" class="course-form-title">Connection</div>
      <div class="course-tools">
        <button class="submit" type="submit" value="Save" {{bindAttr disabled="form_is_invalid"}} {{action "saveCourse" view}}>Create course</button>
      </div>
    </div>

    <div class="course-tools" class="course-section">
      <hr>
      <button class="cancel" type="submit" value="Cancel" {{action "cancelCourseAdd"}}>View all courses</button>
    </div>
  </form>
</div>
