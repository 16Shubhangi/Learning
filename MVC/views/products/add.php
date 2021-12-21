<div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title">Add New Product</h3>
  </div>
  <div class="panel-body">
    <form method="post" action="<?php $_SERVER['PHP_SELF']; ?>">
    	<div class="form-group">
    		<label>Product Name</label>
    		<input type="text" name="product_name" class="form-control" />
    	</div>
    	<div class="form-group">
    		<label>Quantity</label>
    		<input type="text" name="qty" class="form-control" />
    	</div>
    	<div class="form-group">
    		<label>Price</label>
    		<input type="text" name="price" class="form-control" />
    	</div>
    	<input class="btn btn-primary" name="insert" type="submit" value="Submit" />
        <a class="btn btn-danger" href="<?php echo ROOT_PATH; ?>products">Cancel</a>
    </form>
  </div>
</div>