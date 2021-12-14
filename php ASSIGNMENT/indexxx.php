<?php 
include("conn.php");
?>



<!DOCTYPE html>
<html lang="en">
<head>
    <title>Crud Operation</title>
    <link type="text/css" rel="stylesheet" href="style.css">
</head>

<body>
    <table>
        <tr>
            <td>
                <form autocomplete="off" onsubmit="onFormSubmit()" method = "POST">
                    <div>
                        <label for="product_code">Product Code</label>
                        <input type="text" name="productCode" id="productCode" required>
                    </div>
                    <div>
                        <label for="product_name">Product Name</label>
                        <input type="text" name="product" id="product" required>
                    </div>
                    <div>
                        <label for="qty">Qty</label>
                        <input type="number" name="qty" id="qty" required>
                    </div>
                    <div>
                        <label for="price">Price</label>
                        <input type="number" name="price" id="price">
                    </div>

                    <div class="form_action--button">
                        <input type="submit" value="Submit">
                        <input type="reset" value="Reset">
                    </div>
                </form>

                <td>
                    <table class="list" id="storeList">
                        <thead>
                            <tr>
                                <th>Product Code</th>
                                <th>Product Name</th>
                                <th>Qty</th>
                                <th>Price</th>
                            </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </td>
            </td>
        </tr>
    </table>


    
    <script type="text/javascript" src="./script.js"></script>

    <?php
    if(isset($_POST['Submit']))
    {
        $product_code = $_POST['product_code'];
        $product_name = $_POST['product_name'];
        $qty = $_POST['qty'];
        $price = $_POST['price'];
        $file_name = $_FILES["image"]["name"];
        $file_temp_loc = $_FILES["image"]["temp_name"]
        $file_store = "ASSIGNMENT/".$file_name;
        move_uploaded_file($file_temp_loc, $file_store);

        $result = mysqli_query($mysqli, "insert into product1 values('', $product_code, $product_name, $qty, $price ) " );
        if($result)
        {
            echo "Success";
            display();
        }
        else
        {
            echo "Failed";
        }
    }
    ?>


//display

function display($conn){
    $result = "SELECT product_code,product_name,qty , price , img from product1";
    $result1 = mysqli_query($conn,$result);
    echo "<h1>Product Details</h1>";
     echo "<table id='table2' border='1' class='list' id='countryList'>";
       echo "<form action='indexxx.php' method='post'>";
       echo "<thead>
       <tr>
           <th>Product Code</th>
           <th>Product Name</th>
           <th>Quantity</th>
           <th>Price</th>
           <th>Uploaded Image</th>
       </tr>
   </thead>";
    if(mysqli_num_rows($result1)>0)
    {
     
        while($row = mysqli_fetch_assoc($result1))
        {
            echo "<tr><td>" . $row["product_name"] . "</td> <td>". $row["product_code"] . "</td>  <td>". $row["qty"] . "</td> <td>". $row["price"] . "</td>              
            <td>
                <button type='submit' name='delete' id='delete'  value=" . $row["cid"] . ">Delete</button> <br><br>
                <button name='update' id='update'  value=" . $row["cid"] . ">Update </button></td>
                <td><img src='" . $row['uploadfile'] . "' width='100' height='100' /> </td> </tr>";
        }
            echo "</form>";
            echo "</table>";
    }  
    mysqli_free_result($result1);
    }
    display($conn);


//delete

if(isset($_POST['delete'])==TRUE)
{ 
    $product_code = $_POST['delete'];

$result2= "DELETE from Product_database where product_code='$product_code'";
if(mysqli_query($conn,$result1)){
    echo "<script> window.location='indexxx.php';</script>";  
    display();
    exit;
}
else 
{
    echo "Invalid Data";
}
}
<script type="text/javascript" src="./script.js"></script>
</body>
</html>
