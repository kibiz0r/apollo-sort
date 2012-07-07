bootstrap = (taskList, menu) ->
  server = 'https://api.apollohq.com/beta'
  api_key = `'<YOUR API KEY GOES HERE>'`

  sort = $('<span class="dijit dijitReset dijitInline apSmallButton dijitButton" role="presentation">
      <span class="dijitReset dijitInline dijitButtonNode" role="presentation">
        <span class="dijitReset dijitStretch dijitButtonContents" role="button">
          <span class="dijitReset dijitInline dijitButtonText">
            Sort A-Z
          </span>
        </span>
      </span>
    </span>')

  menu.prepend sort

  id = taskList.attr('todo_list_id')

  taskList.addClass('apollo-sort')

  sort.click ->
    $(this).addClass 'dijitButtonActive dijitActive dijitButtonFocused dijitButtonActiveFocused dijitActiveFocused dijitFocused'
    $(this).find('.dijitButtonText').html 'Sorting...'

    $.ajax
      url: "#{server}/taskLists/#{id}/tasks",
      dataType: 'json',
      username: api_key,
      password: 'X',
      success: (data) ->
        tasks = data.tasks
        sortedTasks = _.sortBy tasks, 'subject'
        sortedIds = _.map sortedTasks, (task) -> task.id

        $.ajax
          url: "#{server}/taskLists/#{id}/tasks/reorder",
          type: 'POST',
          dataType: 'json',
          contentType: 'application/json',
          username: api_key,
          password: 'X',
          data: JSON.stringify(tasks: sortedIds),
          success: ->
            window.location.reload()

lookForTaskLists = ->
  console.log('Looking for tasklists')

  setTimeout lookForTaskLists, 1000

  for _taskList in $('.tasklistsWrapper .apTasklist[todo_list_id!="0"]').not('.apollo-sort')
    taskList = $(_taskList)
    menu = taskList.find '.apTasklistHovermenu'

    console.log 'Found a tasklist:'
    console.log taskList

    bootstrap taskList, menu

$ ->
  console.log 'Initialized apollo-sort'

  console.log 'Pre-existing tasklists:'
  console.log $('.tasklistsWrapper .apTasklist[todo_list_id!="0"]').not('.apollo-sort')

  lookForTaskLists()
