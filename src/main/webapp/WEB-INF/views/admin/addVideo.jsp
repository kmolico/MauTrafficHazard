<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../header.jsp" />
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>Admin Console</title>
  <!-- Bootstrap core CSS-->
  <link href="<spring:url value='/resources/vendor/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet" />
  <!-- Custom fonts for this template-->
  <link href="<spring:url value='/resources/vendor/font-awesome/css/font-awesome.min.css'/>" rel="stylesheet" type="text/css" />
  <!-- Page level plugin CSS-->
  <link href="<spring:url value='/resources/vendor/datatables/dataTables.bootstrap4.css'/>" rel="stylesheet" />
  <!-- Custom styles for this template-->
  <link href="<spring:url value='/resources/css/sb-admin.css'/>" rel="stylesheet" />
</head>

<body class="sticky-footer bg-dark" id="page-top">

  <jsp:include page="adminMenu.jsp" />
  
    <div class="content-wrapper">
    <div class="container-fluid">
      <!-- Breadcrumbs-->
      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="#">Videos</a>
        </li>
        <li class="breadcrumb-item active">Add a new video</li>
      </ol>
      
      
      
      
    </div>
    <!-- /.container-fluid-->
    <!-- /.content-wrapper-->

    <!-- Bootstrap core JavaScript-->
    <script src="<spring:url value='/resources/vendor/jquery/jquery.min.js'/>"></script>
    <script src="<spring:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
    <!-- Core plugin JavaScript-->
    <script src="<spring:url value='/resources/vendor/jquery-easing/jquery.easing.min.js'/>"></script>
    <!-- Page level plugin JavaScript-->
    <script src="<spring:url value='/resources/vendor/chart.js/Chart.min.js'/>"></script>
    <script src="<spring:url value='/resources/vendor/datatables/jquery.dataTables.js'/>"></script>
    <script src="<spring:url value='/resources/vendor/datatables/dataTables.bootstrap4.js'/>"></script>
    <!-- Custom scripts for all pages-->
    <script src="<spring:url value='/resources/js/sb-admin.min.js'/>"></script>
    <!-- Custom scripts for this page-->
    <script src="<spring:url value='/resources/js/sb-admin-datatables.min.js'/>"></script>
    <script src="<spring:url value='/resources/js/sb-admin-charts.min.js'/>"></script>
  </div>
</body>

</html>