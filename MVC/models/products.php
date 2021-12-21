<?php

class ProductModel extends Model{


	//display
	public function Index(){
		$this->query('SELECT * FROM product1');
		$row = $this->resultSet();
		return $row;
	
	}

	public function delete()
	{
		//delete
		$delete=$_REQUEST['delete_id'];
		$this->query('DELETE from product1 where product_code=:product_code');
		$this->bind(':product_code',$delete);
		$this->execute();
		header('location:'.ROOT_URL.'products');
	}






	public function add(){
		// Sanitize POST
		$post = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

		if(isset($post['insert'])){	
				if($post['product_name']==''||$post['qty']==''){
				Messages::setMsg('Please Fill In All Fields', 'error');
				return;
			}
			// Insert into MySQL
			$this->query('INSERT INTO product1 (product_code, product_name, qty, price ) VALUES(:product_code, :product_name, :qty, :price )');
			$this->bind(':product_code', $post['product_code']);
			$this->bind(':product_name', $post['product_name']);
			$this->bind(':qty', $post['qty']);
			$this->bind(':price', $post['price']);
		
			$this->execute();
			// Verify
			if($this->lastInsertId()){			
				header('Location: '.ROOT_URL.'products');
			}
		}
		return;
	}

	public function edit()
        {
			//update Data
            if(isset($_REQUEST['update_id']))
            {
                $update=$_REQUEST['update_id'];
                $this->query('SELECT * FROM product1 WHERE product_code=:product_code');
                $this->bind(':product_code',$update);
                $row=$this->single();
                return $row;
            }
            else
            {
                $post = filter_input_array(INPUT_POST,FILTER_SANITIZE_STRING);
                if(isset($post['update']))
                {
                    $this->query('UPDATE product1 SET product_name=:product_name, qty=:qty, price=:price WHERE product_code=:product_code');
                    $this->bind(':product_name',$post['product_name']);
                    $this->bind(':qty',$post['qty']);
                    $this->bind(':price',$post['price']);
                    $this->bind(':product_code',$post['product_code']);
                    $this->execute();
                    header('location:'.ROOT_URL.'products');
                }
            }
        }




}