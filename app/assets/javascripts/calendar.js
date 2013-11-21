var updateEvent;

$(document).ready(function() {
  return $('#calendar').fullCalendar({
    editable: true,
    header: {
      left: 'prev,next today',
      center: 'title',
      right: 'month,agendaWeek,agendaDay'
    },
    defaultView: 'agendaWeek',
    height: 500,
    slotMinutes: 30,
    eventSources: [
      {
        url: '/events'
      }
    ],
    timeFormat: 'h:mm t{ - h:mm t} ',
	titleFormat: {
	    month: 'MMMM yyyy',                             // September 2009
	    week: "| MMM d[ yyyy] { '&#8212;' MMM d | yyyy}", // |Sep 7 - Sep 13|, 2009
	    day: 'dddd, MMM d, yyyy'                  // Tuesday, Sep 8, 2009
	},
    dragOpacity: "0.5",
        handleWindowResize: true,
        windowResize: function(view) {
                alert('The calendar has adjusted to a window resize');
        },                
        eventClick: function(event) {
          if (event.url) {
              window.open(event.url);
              return false;
          }
        },
        dayClick: function(date, allDay, jsEvent, view) {

        if (allDay) {
            alert('Clicked on the entire day: ' + date);
        }else{
            alert('Clicked on the slot: ' + date);
        }
                var formBox = "<div id='close'>close_box</div> <br /><ul><li>date is "+date+" </li></ul>";
                var selected_hour;
        //alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);

        //alert('Current view: ' + view.name);
                alert("time is" + parseInt(date.getHours(), 10));
                $("#event_starts_at_1i").val(date.getFullYear());
                $("#event_starts_at_2i").val(date.getMonth()+1);        
                $("#event_starts_at_3i").val(date.getDate());
                if (date.getHours() <= 9)
                {
                        selected_hour = '0'+date.getHours();
                        alert('insideif selected hour'+selected_hour);
                }
                else
                {
                         selected_hour = date.getHours();
                }        
                 
                if (date.getHours() < 8)
                {
                         selected_end_hour = '0'+(date.getHours()+2);
                        alert('insideif selected end hour'+selected_end_hour);
                }
                else
                {
                         selected_end_hour = date.getHours()+2;
                }
                
                //selected_hour = date.getHours();
                $("#event_starts_at_4i > [value='"+selected_hour+"']").attr("selected", "true");
                $("#event_starts_at_5i").val(date.getMinutes());
                
                //Ends at form
                $("#event_ends_at_4i > [value='"+selected_end_hour+"']").attr("selected", "true");                
                $("#event_ends_at_1i").val(date.getFullYear());
                $("#event_ends_at_2i").val(date.getMonth()+1);        
                $("#event_ends_at_3i").val(date.getDate());
                //selected_hour = date.getHours();
                $("#event_ends_at_5i").val(date.getMinutes());
        // change the day's background color just for fun
        $(this).css('background-color', 'red');
                //$("div#pop_up").html(formBox);
                 $("div#box").css('display', 'inline-block');        

    },
    eventDrop: function(event, dayDelta, minuteDelta, allDay, revertFunc) {
      return updateEvent(event);
    },
    eventResize: function(event, dayDelta, minuteDelta, revertFunc) {
      return updateEvent(event);
    }
  });
});

$(document).on("click", "#close", function(){
        $("div#box").css('display', 'none');        
});
updateEvent = function(the_event) {
  return $.update("/events/" + the_event.id, {
    event: {
      title: the_event.title,
      starts_at: "" + the_event.start,
      ends_at: "" + the_event.end,
      description: the_event.description
    }
  });
};