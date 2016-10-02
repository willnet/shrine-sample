document.addEventListener 'change', (event) ->
  input = event.target
  return unless input.tagName is 'INPUT' &&
    input.type is 'file'
  xhr = new XMLHttpRequest()
  xhr.addEventListener 'load', ->
    return if xhr.status < 200 || xhr.status >= 300
    hidden_field =
      document.getElementById('hidden_event_image')
    hidden_field.value = xhr.responseText
    input.removeAttribute('name')
  formData = new FormData()
  file = input.files[0]
  formData.append('file', file, file.name)
  xhr.open('POST', '/images/cache/upload', true)
  xhr.send(formData)
