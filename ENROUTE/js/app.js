$("document").ready(init);

function init()
{
	//scale images in grid to div size
	$('.gridimage').each(function(i, item)
	{
	    var img_height = $(item).height();
	    var div_height = $(item).parent().height();

	    if(img_height < div_height)
	    {
	        $(item).css({'width': 'auto', 'height': div_height });
	        var img_width = $(item).width();
	        var div_width = $(item).parent().width();
	        var newMargin = (div_width-img_width)/2+'px';
	        $(item).css({'margin-left': newMargin });
	    }
	    else
	    {
	        var newMargin = (div_height-img_height)/2+'px';
	        $(item).css({'margin-top': newMargin});
	    }
	});

	//validate login
	$("#txtcode").keyup(checkSixCharacters).blur(checkSixCharacters);
	$('#loginsection form').submit(submitForm);

	function checkSixCharacters()
	{
		var $el = $(this);

		if($el.val().length < 6) 
		{
			showInValid($('.errormessage'), "Gelieve minimum 6 karakters in te geven.");
		}
		else
		{
			showValid($('.errormessage'));
		}
	}

	function submitForm(e)
	{
		if(!$('.radioselectgroup').is(':checked'))
		{
			showInValid($('.errormessage'), "Gelieve een groep te kiezen.");	
		}

		if($('#txtcode').val().length < 6) 
		{
			showInValid($('.errormessage'), "Gelieve minimum 6 karakters in te geven.");
		}

		if(!$('.radioselectgroup').is(':checked') || $('#txtcode').val().length < 6)
		{
			e.preventDefault();			
		}
	}

	function showInValid($errorEl, message)
	{
		$errorEl.text(message);
	}

	function showValid($errorEl)
	{
		$errorEl.text("");
	}

	//animations
	$('#home #btndiscover').click(function(e)
	{
		e.preventDefault();

		$('html, body').animate
		({
        	scrollTop: $("#enroute").offset().top
    	}, 500);
	});

	$('#enroute #btndiscover').click(function(e)
	{
		e.preventDefault();

		$('html, body').animate
		({
        	scrollTop: $("#zentrijk").offset().top
    	}, 500);
	});

	$('#church').addClass('churchtransition');
	$('#tower').addClass('churchtransition');
}