
<style>
        /* Agrega estilos personalizados aquí */
        body {
            background-color: #f8f9fa;
        }

        .navbar {
            background-color: #e44d26;
        }

        .navbar-brand img {
            width: 50px; /* Ajusta el tamaño de la imagen según tu necesidad */
            height: auto;
            margin-right: 10px;
        }

        .navbar-brand,
        .navbar-nav .nav-link {
            color: white;
        }

        .navbar-toggler-icon {
            background-color: white;
        }

        .btn-danger {
            background-color: #e44d26;
            border-color: #e44d26;
        }

        .btn-danger:hover {
            background-color: #c5371d;
            border-color: #c5371d;
        }
    </style>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<nav class="navbar navbar-expand-lg navbar-light bg-secondary">
    <div class="container-fluid">
        <a class="navbar-brand" href="#"><img src="data:image/jpeg;base64,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" width="70" height="70" />Neto >>>>>> OXXO</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="Perfil.php">Perfil de Usuarios</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="Usuarios.php">Usuarios</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="Informacion.php">Información de Usuarios</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="Productos.php">Productos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="Devoluciones.php">Devoluciones</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="Ventas.php">Ventas</a>
                </li>
            </ul>
        </div>
        <a href="proyectoDisfraces/InicioSesion" class="btn btn-danger">Cerrar Sesión</a>
    </div>
</nav>
<div class="container mt-5">