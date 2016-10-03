<?php
      $LoginError ="";
	if (isset($_POST["submit"])) 
    {
		
            $email = $_POST['email'];
            $name = $_POST['password'];
            $errEmail = false;
            $errPassword = false;
        
        
            if (!$_POST['email'] || !filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
                  $errEmailMessage = "Please Enter a Valid Email.";
            }


            if (!$_POST['password'] || strlen($_POST['password']) < 8 ) {
                $errPassMessage = "Password should be minimum 8 characters.";
            }



    if (isset($errEmailMessage) || isset($errPassMessage) )
        {
            $loginMessage=  '<div class="container"><div class="alert alert-danger">Sorry there were errors loging into your account.Please try again later.</div></div>';
        
        }
        else 
            {
             $loginMessage=  '<div class="alert alert-success">You have successfully logged into your account.</div>'; 
            }
	}
?>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>PHP/Bootstrap Login Form</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">
      
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">

   
  </head>

  <body>

    <div class="container">

      <form class="form-signin" method="post" action="index.php">
      

  <?php if (isset($loginMessage)) echo $loginMessage ; ?>

        <h2 class="text-center">Please Login</h2>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="text" id="inputEmail" name="email" class="form-control" placeholder="Email address" required autofocus>
        <span class="text-danger"><?php if (isset($errEmailMessage)) echo $errEmailMessage; ?></span>
        
         
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" required>
        <span class="text-danger"><?php if (isset($errPassMessage)) echo $errPassMessage; ?></span>
         <button name="submit" class="btn btn-success btn-block" type="submit">Login</button>
      </form>
        
    

    </div> <!-- /container -->
    
     

    <script src="js/bootstrap.js"></script>
  </body>
</html>
