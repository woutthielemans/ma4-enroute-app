<div class="container">
  <div class="corner topleft"></div>
  <div class="corner topright"></div>
  <div class="corner bottomleft"></div>
  <div class="corner bottomright"></div>
  <div class="frame"></div>

	<section id='selectphoto'>
			<?php
			foreach($arrPhotos as $photo)
			{ ?>
				<div>
					<form method="POST" action="index.php?page=grid&action=assignphoto">
						<input type="hidden" name="photopath" value="<?php echo $photo['path']; ?>" />
						<input type="submit" value="" />
					</form>
					<img src=<?php echo $photo['path']; ?> />	
				</div>
			<?php } ?>
	</section>
</div>
