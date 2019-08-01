

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Focus Admin: Widget</title>

    <!-- ================= Favicon ================== -->
    <!-- Standard -->
    <link rel="shortcut icon" href="http://placehold.it/64.png/000/fff">
    <!-- Retina iPad Touch Icon-->
    <link rel="apple-touch-icon" sizes="144x144" href="http://placehold.it/144.png/000/fff">
    <!-- Retina iPhone Touch Icon-->
    <link rel="apple-touch-icon" sizes="114x114" href="http://placehold.it/114.png/000/fff">
    <!-- Standard iPad Touch Icon-->
    <link rel="apple-touch-icon" sizes="72x72" href="http://placehold.it/72.png/000/fff">
    <!-- Standard iPhone Touch Icon-->
    <link rel="apple-touch-icon" sizes="57x57" href="http://placehold.it/57.png/000/fff">

    <!-- Styles -->
    <link href="<?php echo base_url()?>assets/css/lib/font-awesome.min.css" rel="stylesheet">
    <link href="<?php echo base_url()?>assets/css/lib/themify-icons.css" rel="stylesheet">
    <link href="<?php echo base_url()?>assets/css/lib/bootstrap.min.css" rel="stylesheet">
    <link href="<?php echo base_url()?>assets/css/lib/helper.css" rel="stylesheet">
    <link href="<?php echo base_url()?>assets/css/style.css" rel="stylesheet">
		<!-- SweetAlert -->
		<link href="<?php echo base_url()?>assets/css/lib/sweetalert/sweetalert.css" rel="stylesheet">
		<script src="<?php echo base_url()?>assets/js/lib/sweetalert/sweetalert.min.js"></script>

		
</head>

<body class="bg-primary">

    <div class="unix-login">
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <div class="login-content">
                        <div class="login-logo">
                            <a href="index.html"><span><?php echo  $data[0]['SystemValue'];?></span></a>
                        </div>
                        <div class="login-form">
                            <h4>Administratior Login</h4>
                            <form id="loginform" data-parsley-validate>
                                <div class="form-group">
                                    <label>UserName</label>
                                    <input type="text" required class="form-control" name="Username" placeholder="Username">
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <input type="password" required class="form-control" name="Password" placeholder="Password">
                                </div>
                                <button type="button" id="submitlogin" class="btn btn-primary btn-flat m-b-30 m-t-30">Sign in</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>

<style>

		.l-wrap {
		max-width: 600px;
		margin: 0 auto;
		padding: 30px 0;
		}

		/* Parsley CSS */

		.parsley-success {
		color: #468847;
		background-color: #DFF0D8;
		border: 1px solid #D6E9C6;
		}

		.parsley-error {
		color: red;
		background-color: #F2DEDE;
		border: 1px solid #EED3D7;
		}

		.parsley-errors-list {
		margin: 2px 0 3px;
		padding: 0;
		list-style-type: none;
		font-size: 0.9em;
		line-height: 0.9em;
		opacity: 0;

		transition: all .3s ease-in;
		-o-transition: all .3s ease-in;
		-moz-transition: all .3s ease-in;
		-webkit-transition: all .3s ease-in;
		}

		.parsley-errors-list.filled {
		opacity: 1;
}
</style>
</html>
<script>
	var base_url="<?php echo base_url()?>";
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="<?php echo base_url('assets/js/parsley.min.js')?>"></script>
<script src="<?php echo base_url('assets/customjs/auth.js?nocache='.date('YYYY-MM-DD H:i:s').'');?>"></script>
