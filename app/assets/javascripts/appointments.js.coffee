jQuery ->
  $('#appointment_service_id').parent().hide()
  services = $('#appointment_service_id').html()
  $('#appointment_category_id').change ->
    category = $('#appointment_category_id :selected').text()
    escaped_category = category.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(services).filter("optgroup[label='#{escaped_category}']").html()
    if options
      $('#appointment_service_id').html(options)
      $('#appointment_service_id').parent().show()
    else
      $('#appointment_service_id').empty()
      $('#appointment_service_id').parent().hide()
      

  $('#appointment_worker_id').parent().hide()
  workers = $('#appointment_worker_id').html()
  $('#appointment_service_id').change ->
    service = $('#appointment_service_id :selected').text()
    escaped_service = service.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(workers).filter("optgroup[label='#{escaped_service}']").html()
    if options
      $('#appointment_worker_id').html(options)
      $('#appointment_worker_id').parent().show()
    else
      $('#appointment_worker_id').empty()
      $('#appointment_worker_id').parent().hide()