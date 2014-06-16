<div class="container">
  <div class="corner topleft"></div>
  <div class="corner topright"></div>
  <div class="corner bottomleft"></div>
  <div class="corner bottomright"></div>
  <div class="frame"></div>

	<section id='grid'>
 	<a id="btngarden" href="http://localhost/zentrijk/index.php?page=home">home</a>	
	<a id="btnlogout" href="index.php?page=grid&action=logout">Logout</a>	
		<?php 
			$arrPhotos =  array();
			$arrForms =  array();

			if(!empty($arrGridPhotos))
			{	
				if(count($arrGridPhotos) < 9)
				{ ?>
					<h1 id="gridcounter">Selecteer nog <?php echo (9 - count($arrGridPhotos));?> foto's.</h1>
				<?php }
				else
				{	
					if($_SESSION['isWashable'])
					{
						if($_SESSION['washCount'] < 5)
						{ ?>
							<h1 id="gridcounter">Klik op <?php echo (5 - $_SESSION['washCount']);?> fotos om ze te faden.</h1>
						<?php }
					}
				}
			}
			else
			{ ?>
				<h1 id="gridcounter">Dit is je grid, selecteer 9 foto's in een willekeurig vak.</h1>
			<?php }

			for($i = 1; $i < 13; $i ++)
			{	
				$arrForms[] = $i;
			}

			if($isArrGridPhotos)
			{
				$gridcount = 0;

				foreach($arrGridPhotos as $photo)
				{ ?>
					<div id="marker<?php echo $photo['gridid'];?>">

					<?php 
						if($photo['iswashed'] == 'true')
						{ ?>
							<div class="washed"></div>
						<?php }
						else
						{
							if($_SESSION['isWashable'])
							{ ?>
								<form class="formwashed" method='POST' action="index.php?page=grid&action=washphoto">
									<input type="hidden" name="gridid" value="<?php echo $photo['gridid'];?>" />
									<input type="submit" value="" />
								</form>
							<?php }
						} 
					?>
						<img class="gridimage" src="<?php echo $photo['photopath']; ?>" />
					</div>					
				<?php
					$gridcount ++; 
				}

				if($gridcount < 9)
				{
					foreach($arrGridPhotos as $photo)
					{
						$arrPhotos[] = $photo['gridid'];
					}

					$result = array_diff($arrForms, $arrPhotos);

					foreach($result as $number)
					{
						?>			
						<div id="marker<?php echo $number; ?>">
							<form method='POST' action="index.php?page=grid&action=showphotos">
								<input type="hidden" name="gridid" value="<?php echo $number; ?>" />
								<input type="submit" value="+" />
							</form>
						</div>
						<?php
					}
				}
			}
			else
			{
				for($i = 1; $i < 13; $i ++)
				{	
					?>			
					<div id="marker<?php echo $i; ?>">
						<form method='POST' action="index.php?page=grid&action=showphotos">
							<input type="hidden" name="gridid" value="<?php echo $i; ?>" />
							<input type="submit" value="+" />
						</form>
					</div>
					<?php
				}
			}
		?>
	</section>
</div>