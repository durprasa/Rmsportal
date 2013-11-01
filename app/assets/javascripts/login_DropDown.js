   function setDropDownList()
  {
  var langoptionslen = document.getElementById('selectedvalue').options.length;
  var selectedlan = (document.getElementById('selectedvalue').options[document.getElementById("selectedvalue").selectedIndex].value);
  window.location = "http://localhost:3000/" + selectedlan
  return selectedlan;
  } 

  $(document).ready(function(){ 
  var pathname = window.location.pathname;
  if(pathname.indexOf('en')>=0)
  {
      $('#selectedvalue').val('en');
  }
  else if (pathname.indexOf('de')>=0)
  {
      $('#selectedvalue').val('de');
  }
  else if (pathname.indexOf('es')>=0)
  {
      $('#selectedvalue').val('es');
  }

  }) 