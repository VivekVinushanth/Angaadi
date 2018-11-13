<?php
require_once 'header.php';
$query = "SELECT * FROM Cart NATURAL JOIN Product_Variant NATURAL JOIN Product WHERE customer_ID='$customer_ID'";
$items = mysqli_query($conn, $query);//||exit();\

?>
	<div class="cart_section">
		<div class="container">
				<div class="row">
					<div class="col-lg-10 offset-lg-1">
						<div class="cart_container">
							<div class="cart_title">Check Out</div>
							<div class="cart_buttons">
								<form method="post" action="checkout.php">
									<input type="button" name="submit" class="button cart_button_checkout" value="Confirm and Pay" onclick="submit">
								</form>
							</div>
						</div>
					</div>
				</div>
		</div>
	</div>
<?php require_once 'footer.php';?>