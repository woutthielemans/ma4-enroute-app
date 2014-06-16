<div class="container">
  <div class="corner topleft"></div>
  <div class="corner topright"></div>
  <div class="corner bottomleft"></div>
  <div class="corner bottomright"></div>
  <div class="frame"></div>

  <section id='loginsection'>
     <a id="btngarden" href="http://localhost/zentrijk/index.php?page=home">home</a>
    <header id="headerhome">
        <hgroup>
          <h1 class="centercontent"><span class="invisible">Zentrijk</span></h1>
        </hgroup>
      </header>
	<form method='POST' action='index.php?page=grid&action=login' autocomplete='off'>
		<fieldset>
			<label for="txtcode">1. Dagcode *</label><br/>
			<label for="selectgroup">2. Selecteer je groep *</label>
		</fieldset>
		<fieldset>
			<input type="text" name='txtcode' id="txtcode" tabindex="1" /></br>			
			<span>1</span><input type="radio" name="selectgroup" class="radioselectgroup" value="1">
			<span>2</span><input type="radio" name="selectgroup" class="radioselectgroup" value="2">
			<span>3</span><input type="radio" name="selectgroup" class="radioselectgroup" value="3">
			<span>4</span><input type="radio" name="selectgroup" class="radioselectgroup" value="4">
			<span>5</span><input type="radio" name="selectgroup" class="radioselectgroup" value="5"></br>
			<input type="submit" name="btnsubmit" id="btnsubmit" tabindex="2"/></br>
		</fieldset><div id="clear"></div>
			<span class='errormessage'>
				<?php 
					if(!empty($isError) && $isError)
					{ ?>
						<?php echo $error; ?>
				<?php } ?>
			</span>
	</form>  	
  </section>
</div>
