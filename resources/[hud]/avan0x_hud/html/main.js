﻿
$(function(){
	window.addEventListener('message', function(event) {
		if (event.data.action == "setValue"){
			if (event.data.key == "job"){
				setJobIcon(event.data.icon)
			}
			setValue(event.data.key, event.data.value)
		} else if (event.data.action == "setValue2"){
			if (event.data.key == "job2"){
				setJob2Icon(event.data.icon2);
				if (event.data.value == "État - Civil")
					$("#job2").hide();
				else
					$("#job2").show();
			}
			setValue(event.data.key, event.data.value)
		} else if (event.data.action == "updateStatus"){
			updateStatus(event.data.status);
		} else if (event.data.action == "toggle"){
			if (event.data.show){
				$('#ui').show();
			} else{
				$('#ui').hide();
			}
		} else if (event.data.action == "showcarhud"){
			if (event.data.showhud){
				$('.huds').fadeIn();
				setProgressSpeed(event.data.speed,'.progress-speed');
				setProgressFuel(event.data.fuel,'.progress-fuel');
			} else{
				$('.huds').fadeOut();
			}
		} else if (event.data.action == "setbelt"){
			if (!event.data.isAccepted || event.data.belt) {
				$('.belt').fadeOut();
			} else{
				$('.belt').fadeIn();
			}
		}
	});

});



function setValue(key, value){
	$('#'+key+' span').html(value)
}

function setJobIcon(value){
	$('#job img').attr('src', 'img/jobs/'+value+'.png')
}

function setJob2Icon(value){
	$('#job2 img').attr('src', 'img/jobs/'+value+'.png')
}

function updateStatus(status){
	var hunger = status[0]
	var thirst = status[1]
	var drunk = status[2]
	var drugged = status[3]
	$('#hunger .bg').css('height', hunger.percent+'%')
	$('#water .bg').css('height', thirst.percent+'%')
	$('#drunk .bg').css('height', drunk.percent+'%');
	$('#drugged .bg').css('height', drugged.percent+'%');
	if (drunk.percent > 0){
		$('#drunk').show();
	}else{
		$('#drunk').hide();
	}
	if (drugged.percent > 0){
		$('#drugged').show();
	}else{
		$('#drugged').hide();
	}

}


  // Fuel
  function setProgressFuel(percent, element){
    var circle = document.querySelector(element);
    var radius = circle.r.baseVal.value;
    var circumference = radius * 2 * Math.PI;
    var html = $(element).parent().parent().find('span');

    circle.style.strokeDasharray = `${circumference} ${circumference}`;
    circle.style.strokeDashoffset = `${circumference}`;

    const offset = circumference - ((-percent*73)/100) / 100 * circumference;
    circle.style.strokeDashoffset = -offset;

    html.text(Math.round(percent));
  }

  // Speed
  function setProgressSpeed(value, element){
    var circle = document.querySelector(element);
    var radius = circle.r.baseVal.value;
    var circumference = radius * 2 * Math.PI;
    var html = $(element).parent().parent().find('span');
    var percent = value*100/220;
    if (percent > 100) percent = 100;

    circle.style.strokeDasharray = `${circumference} ${circumference}`;
    circle.style.strokeDashoffset = `${circumference}`;

    const offset = circumference - ((-percent*73)/100) / 100 * circumference;
    circle.style.strokeDashoffset = -offset;

    html.text(value);
  }
